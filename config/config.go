package config

type Config struct {
	DB *DBConfig
}

type DBConfig struct {
	Dialect string
	Host    string
	Port    string
	User    string
	Passwd  string
	Name    string
	Charset string
}

func GetConfig() *Config {
	return &Config{
		DB: &DBConfig{
			Dialect: "mysql",
			Host:    "localhost",
			Port:    "3306",
			User:    "root",
			Passwd:  "forlearn27",
			Name:    "db-ticket-sod",
			Charset: "utf8",
		},
	}
}
