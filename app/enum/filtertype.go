package enum

type FilterType string

const (
	Before  FilterType = "before"
	After   FilterType = "after"
	Between FilterType = "between"
)
