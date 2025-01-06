package dto

import "goticket-sod/app/enum"

type Filter struct {
	FilterName  string          `json:"filter_name"`
	FilterType  enum.FilterType `json:"filter_type"`
	FilterValue string          `json:"filter_value"`
}
