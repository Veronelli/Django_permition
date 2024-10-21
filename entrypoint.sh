#!/bin/sh

# Ejecutar el script expect
expect ./django_init.exp

# Comprobar si la inicialización fue exitosa
if [ $? -eq 0 ]; then
    echo "Inicialización de Django completada con éxito."
    # Iniciar Django
    exec python manage.py runserver 0.0.0.0:8000
else
    echo "Error durante la inicialización de Django."
    exit 1
fi