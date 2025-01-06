package handler

import (
	"encoding/json"
	"fmt"
	"github.com/go-playground/validator/v10"
	"github.com/jinzhu/gorm"
	"goticket-sod/app/dto"
	"goticket-sod/app/enum"
	"goticket-sod/app/model"
	"goticket-sod/app/util"
	"net/http"
	"strings"
)

func CreateTicket(db *gorm.DB, w http.ResponseWriter, r *http.Request) {

	var ticketDto dto.TicketDto

	if err := json.NewDecoder(r.Body).Decode(&ticketDto); err != nil {
		responseError(w, http.StatusBadRequest, dto.BaseResponse{StatusCode: http.StatusBadRequest,
			Data: "Invalid request payload"})
		return
	}

	if err := ticketDto.Validate(); err != nil {
		responseError(w, http.StatusBadRequest, dto.BaseResponse{StatusCode: http.StatusBadRequest,
			Data: mapErrorMessage(err)})
		return
	}

	ticket := model.Ticket{TicketTitle: ticketDto.TicketTitle, TicketMsg: ticketDto.TicketMsg, UserId: ticketDto.UserId}

	if err := db.Create(&ticket).Error; err != nil {
		responseError(w, http.StatusInternalServerError, dto.BaseResponse{StatusCode: http.StatusInternalServerError,
			Data: "Failed to create ticket"})
		return
	}

	responseJSON(w, http.StatusCreated, dto.BaseResponse{StatusCode: http.StatusCreated,
		Data: "Create ticket successfully"})
}

func GetTicket(db *gorm.DB, w http.ResponseWriter, r *http.Request) {

	var request dto.BaseRequest

	if err := json.NewDecoder(r.Body).Decode(&request); err != nil {
		responseError(w, http.StatusBadRequest, dto.BaseResponse{StatusCode: http.StatusBadRequest,
			Data: "Invalid request payload"})
		return
	}

	limit := util.Rounding{}.RoundHalfDownInt(request.PageSize)

	var filterSql = mapDateFilter(request.Filter)
	var tickets []model.Ticket

	if err := db.Where(filterSql,
		getFilterValue(request.Filter)...).Limit(limit).Order(
		getSortValue(request.Sort)).Find(&tickets).Error; err != nil {
		responseError(w, http.StatusInternalServerError, dto.BaseResponse{StatusCode: http.StatusInternalServerError,
			Data: "Failed to get all tickets"})
		return
	}

	var ticketDtos []dto.TicketDto
	for _, ticket := range tickets {
		ticketDtos = append(ticketDtos, dto.TicketDto{TicketTitle: ticket.TicketTitle, TicketMsg: ticket.TicketMsg,
			UserId: ticket.UserId, CreatedAt: ticket.CreatedAt, TicketStatus: enum.TicketStatus(ticket.TicketStatus).String()})
	}

	responseJSON(w, http.StatusOK, dto.BaseResponse{StatusCode: http.StatusOK, Data: ticketDtos})
}

func getFilterValue(filter dto.Filter) []interface{} {
	switch filter.FilterType {
	case enum.Between:
		return []interface{}{filter.FilterValue, filter.FilterValue}
	case enum.Before, enum.After:
		return []interface{}{filter.FilterValue}
	default:
		return []interface{}{}
	}
}

func getSortValue(sort dto.Sort) string {
	if sort.SortName != "" && sort.SortDir != "" {
		return fmt.Sprintf("%s %s", sort.SortName, sort.SortDir)
	}
	return "id desc"
}

func mapDateFilter(filter dto.Filter) string {
	filterType := map[enum.FilterType]string{
		"before":  filter.FilterName + " < ?",
		"after":   filter.FilterName + " > ?",
		"between": filter.FilterName + " between ? and ?",
	}

	return filterType[filter.FilterType]
}

func mapErrorMessage(err error) string {

	customMessage := map[string]string{
		"TicketDto.TicketTitle.required": "The ticket_title is required.",
		"TicketDto.TicketTitle.min":      "The ticket_title must be at least 10 characters long.",
		"TicketDto.TicketTitle.max":      "The ticket_title must not exceed 100 characters.",
		"TicketDto.TicketMsg.required":   "The ticket_msg is required.",
		"TicketDto.TicketMsg.min":        "The ticket_msg must be at least 100 characters long.",
		"TicketDto.UserId.required":      "The user_id is required.",
		"TicketDto.UserId.gt":            "The user_id must be greater than 0.",
	}

	var message strings.Builder
	lastIndex := len(err.(validator.ValidationErrors))
	var index int

	for _, fieldError := range err.(validator.ValidationErrors) {
		message.WriteString(customMessage[fieldError.Namespace()+"."+fieldError.Tag()])

		index++

		if index < lastIndex {
			message.WriteString("\n")
		}
	}

	return message.String()
}
