package enum

type TicketStatus string

const (
	Open     TicketStatus = "opn"
	Close    TicketStatus = "cls"
	Assigned TicketStatus = "asn"
)

func (t TicketStatus) String() string {
	switch t {
	case Open:
		return "Open"
	case Close:
		return "Close"
	case Assigned:
		return "Assigned"
	default:
		return ""
	}
}
