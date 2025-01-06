package dto

type BaseResponse struct {
	StatusCode int         `json:"status"`
	Data       interface{} `json:"data"`
}
