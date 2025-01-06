package model

import (
	"github.com/jinzhu/gorm"
	"goticket-sod/app/enum"
)

type Ticket struct {
	gorm.Model
	ID           uint              `gorm:"primary_key;auto_increment" json:"id"`
	TicketTitle  string            `gorm:"type:varchar(10);not null;" json:"ticket_title"`
	TicketMsg    string            `gorm:"type:varchar(100);not null" json:"ticket_msg"`
	TicketStatus enum.TicketStatus `gorm:"type:varchar(3);not null; default:'opn'"`
	UserId       int               `gorm:"not null" json:"user_id"`
}
