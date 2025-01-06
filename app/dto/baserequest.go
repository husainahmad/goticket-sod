package dto

type BaseRequest struct {
	Filter   Filter `json:"filter"`
	Sort     Sort   `json:"sort"`
	PageSize int    `json:"page_size"`
}
