package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"time"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

//Patient struct
type Patient struct {
	ID           string    `json:"id"`
	Name         string    `json:"name"`
	Age          int       `json:"age"`
	Gender       string    `json:"gender"`
	DateCreated  time.Time `json:"date_created,omitempty"`
	DateModified time.Time `json:"date_modified,omitempty"`
}

var db *sql.DB
var err error

func main() {
	db, err = sql.Open("mysql", "admin:admin@tcp(127.0.0.1:3306)/medication_app?parseTime=true")
	if err != nil {
		panic(err.Error())
	}

	defer db.Close()
	router := mux.NewRouter()
	router.HandleFunc("/", greetUsers).Methods("GET")
	router.HandleFunc("/patients", getPatients).Methods("GET")
	router.HandleFunc("/patients", createPatient).Methods("POST")
	router.HandleFunc("/patients/{id}", getPatient).Methods("GET")
	router.HandleFunc("/patients/{id}", updatePatient).Methods("PUT")
	router.HandleFunc("/patients/{id}", deletePatient).Methods("DELETE")
	http.ListenAndServe(":9090", router)
}
func greetUsers(w http.ResponseWriter, r *http.Request) {
	fmt.Println("WELCOME TO OUR SITE")
}

func getPatients(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var patients []Patient
	result, err := db.Query("SELECT id, name, age, gender from patients")
	if err != nil {
		panic(err.Error())
	}
	defer result.Close()
	for result.Next() {
		var patient Patient
		err := result.Scan(&patient.ID, &patient.Name, &patient.Age, &patient.Gender)
		if err != nil {
			panic(err.Error())
		}
		patients = append(patients, patient)
	}
	json.NewEncoder(w).Encode(patients)
}
func createPatient(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	stmt, err := db.Prepare("INSERT INTO patients(id, name, age, gender) VALUES(?, ?, ?, ?)")
	if err != nil {
		panic(err.Error())
	}
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		panic(err.Error())
	}
	keyVal := make(map[string]string)
	json.Unmarshal(body, &keyVal)

	id := keyVal["id"]
	name := keyVal["name"]
	age := keyVal["age"]
	gender := keyVal["gender"]

	_, err = stmt.Exec(id, name, age, gender)
	if err != nil {
		panic(err.Error())
	}
	fmt.Fprintf(w, "New patient was created")
}
func getPatient(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	params := mux.Vars(r)
	result, err := db.Query("SELECT id, name, age, gender, date_created, date_modified FROM patients WHERE id = ?", params["id"])
	if err != nil {
		panic(err.Error())
	}
	defer result.Close()
	var patient Patient
	for result.Next() {
		err := result.Scan(&patient.ID, &patient.Name, &patient.Age, &patient.Gender, &patient.DateCreated, &patient.DateModified)
		if err != nil {
			panic(err.Error())
		}
	}

	json.NewEncoder(w).Encode(patient)
}
func updatePatient(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r)
	stmt, err := db.Prepare("UPDATE patients SET name = ?, age = ?, gender = ? WHERE id = ?")
	if err != nil {
		panic(err.Error())
	}
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		panic(err.Error())
	}
	keyVal := make(map[string]string)
	json.Unmarshal(body, &keyVal)
	name := keyVal["name"]
	age := keyVal["age"]
	gender := keyVal["gender"]
	_, err = stmt.Exec(name, age, gender, params["id"])
	if err != nil {
		panic(err.Error())
	}

	fmt.Fprintf(w, "Patient with ID = %v was updated", params["id"])
}
func deletePatient(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r)
	stmt, err := db.Prepare("DELETE FROM patients WHERE id = ?")
	if err != nil {
		panic(err.Error())
	}
	_, err = stmt.Exec(params["id"])
	if err != nil {
		panic(err.Error())
	}
	fmt.Fprintf(w, "Patient with ID = %s was deleted", params["id"])
}
