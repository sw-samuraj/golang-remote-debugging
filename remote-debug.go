package main

import (
	"fmt"
	"github.com/gorilla/mux"
	log "github.com/sirupsen/logrus"
	"net/http"
	"time"
)

func init() {
	log.SetFormatter(&log.TextFormatter{
		FullTimestamp: true,
	})
	log.SetLevel(log.DebugLevel)
}

func main() {
	log.Info("starting my cool app...")

	r := mux.NewRouter()
	r.HandleFunc("/", ultimateHandler)
	http.Handle("/", r)
	srv := &http.Server{
		Handler:      r,
		Addr:         ":4040",
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	log.Info("my cool app has started.")
	log.Fatal(srv.ListenAndServe())
}

func ultimateHandler(writer http.ResponseWriter, request *http.Request) {
	log.Debugf("request: %s %s %s", request.Method, request.Host, request.RequestURI)
	log.Infof("computing the ultimate question...")
	answer := computeUltimateQuestion()
	log.Infof("returning the ultimate answer: %s", answer)
	writer.WriteHeader(http.StatusOK)
	fmt.Fprint(writer, answer)
}

func computeUltimateQuestion() string {
	return "42"
}
