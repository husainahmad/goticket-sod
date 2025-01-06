package handler

import (
	"encoding/json"
	"net/http"
)

func responseJSON(w http.ResponseWriter, status int, payload interface{}) {
	response, err := json.Marshal(payload)
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("Internal Server Error"))
		return
	}
	w.WriteHeader(status)
	w.Write(response)
}

func responseError(w http.ResponseWriter, code int, payload interface{}) {
	responseJSON(w, code, payload)
}
