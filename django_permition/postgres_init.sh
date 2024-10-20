#!/usr/bin/expect -f

# Obtener variables del entorno
set postgres_user [lindex $env(POSTGRES_USER) 0]
set postgres_password [lindex $env(POSTGRES_PASSWORD) 0]

set timeout -1

# Ejecutar el comando psql usando la variable de entorno
spawn psql -h permition-db-1 -U $postgres_user -c "CREATE DATABASE permition;"

expect "Password for user admin:"
send "$postgres_password\r"

interact
