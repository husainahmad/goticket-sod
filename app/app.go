package app

import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
	"github.com/jinzhu/gorm"
	"goticket-sod/app/handler"
	"goticket-sod/app/model"
	"goticket-sod/config"
	"log"
	"net/http"
)

type App struct {
	Router *mux.Router
	DB     *gorm.DB
}

func (a *App) Initialize(config *config.Config) {

	a.Router = mux.NewRouter()

	dbUri := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?parseTime=true",
		config.DB.User,
		config.DB.Passwd,
		config.DB.Host,
		config.DB.Port,
		config.DB.Name)

	db, err := gorm.Open(config.DB.Dialect, dbUri)
	if err != nil {
		log.Fatal("Cannot connect to database")
	}
	a.DB = db
	a.DB.AutoMigrate(&model.Ticket{})
	a.setRouter()
}

func (a *App) setRouter() {
	a.Get("/", a.handleRequest(handler.HomePage))
	a.Post("/ticket", a.handleRequest(handler.CreateTicket))
	a.Get("/ticket", a.handleRequest(handler.GetTicket))
}

func (a *App) handleRequest(handler RequestHandlerFunction) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		handler(a.DB, w, r)
	}
}

type RequestHandlerFunction func(db *gorm.DB, w http.ResponseWriter, r *http.Request)

func (a *App) Get(path string, f func(w http.ResponseWriter, r *http.Request)) {
	a.Router.HandleFunc(path, f).Methods("GET")
}

func (a *App) Post(path string, f func(w http.ResponseWriter, r *http.Request)) {
	a.Router.HandleFunc(path, f).Methods("POST")
}

func (a *App) Put(path string, f func(w http.ResponseWriter, r *http.Request)) {
	a.Router.HandleFunc(path, f).Methods("PUT")
}

func (a *App) Delete(path string, f func(w http.ResponseWriter, r *http.Request)) {
	a.Router.HandleFunc(path, f).Methods("DELETE")
}

func (a *App) Run(host string) {
	log.Fatal(http.ListenAndServe(host, a.Router))
}
