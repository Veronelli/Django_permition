#!/usr/bin/expect -f

# Asignar variables desde el entorno
set django_database_password [lindex $env(DJANGO_DATABASE_PASSWORD) 0]
set django_database_user [lindex $env(DJANGO_DATABASE_USER) 0]

# Tiempo de espera indefinido para evitar timeouts
set timeout -1

# Ejecutar la migración
spawn python manage.py migrate
expect eof  ;# Esperar a que termine el proceso

# Crear superusuario
spawn python manage.py createsuperuser

# Responder a los prompts
expect "Username:"
send "$django_database_user\r"

expect "Email address:"
send "\r"

expect "Password:"
send "$django_database_password\r"

expect "Password (again):"
send "$django_database_password\r"

# Usar expresión regular para la pregunta final
expect -re {Bypass password validation and create user anyway\? \[y/N\]:}
send "y\r"

# Mantener la sesión abierta
interact

