package handler

import (
	"github.com/jinzhu/gorm"
	"goticket-sod/app/dto"
	"net/http"
)

func HomePage(db *gorm.DB, w http.ResponseWriter, r *http.Request) {
	ResponseJSON(w, http.StatusOK, dto.BaseResponse{StatusCode: http.StatusOK, Data: "Welcome!"})
}
