package dto

import (
	"github.com/go-playground/validator/v10"
	"time"
)

type TicketDto struct {
	TicketTitle  string    `json:"ticket_title" validate:"required,min=10,max=100"`
	TicketMsg    string    `json:"ticket_msg" validate:"required,min=100"`
	TicketStatus string    `json:"ticket_status"`
	UserId       int       `json:"user_id" validate:"required"`
	CreatedAt    time.Time `json:"created_at"`
}

func (t *TicketDto) Validate() error {
	validate := validator.New()
	return validate.Struct(t)
}
