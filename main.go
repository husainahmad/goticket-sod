package main

import (
	"goticket-sod/app"
	"goticket-sod/config"
)

func main() {
	conf := config.GetConfig()
	a := &app.App{}
	a.Initialize(conf)
	a.Run(":3000")

}
