#!/usr/bin/expect -f

set django_database_password [lindex $env(DJANGO_DATABASE_PASSWORD)]
set django_database_user [lindex $env(DJANGO_DATABASE_USER)]

set timeout -1

python django_permition/manage.py migrate

spawn python django_permition/manage.py createsuperuser

expect "Username (leave blank to use 'root'):"
send "$django_database_user\r"

expect "Email address:"
send "\r"

expect "Password:"
send "$django_database_password\r"

expect "Password (again):"
send "$django_database_password\r"

expect "Bypass password validation and create user anyway? [y/N]:"
send "y\r"

interact
