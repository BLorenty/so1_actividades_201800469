#!/bin/bash
# Variables
GITHUB_USER=$1 # Recibe el primer argumento, este debe ir despues del nombre del script
USER_DATA=$(curl -s https://api.github.com/users/$GITHUB_USER) # Obtiene la informacion del usuario de GitHub

# Instalar jq si no esta instalado, jq es una herramienta para procesar JSON
USER_ID=$(echo $USER_DATA | jq -r '.id') # Extrae el id del usuario
CREATED_AT=$(echo $USER_DATA | jq -r '.created_at') # Extrae la fecha de creacion de la cuenta

# Mensaje, se imprime en la consola para probar que el script funciona
MESSAGE="Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT"
#echo $MESSAGE

# Crear el archivo log

DATE=$(date +"%Y-%m-%d_%H-%M-%S") # Formato de la fecha y hora actual
LOG_DIR="tmp/$DATE" # Directorio donde se guardara el archivo
mkdir -p $LOG_DIR # Crea el directorio si no existe
echo $MESSAGE > $LOG_DIR/saludos.txt # Crea el archivo saludos.txt en el directorio creado

# Fin del script actividad.sh

# ************************************************************************
# Para ejecutar el script se debe dar permisos de ejecucion
# chmod +x actividad.sh
# Luego se ejecuta con el nombre del usuario de GitHub
# bash actividad.sh

# ************************************************************************
# Para ejecutar el script con un cronjob se debe seguir los siguientes pasos
# EDITAR CRONTAB CON CRONTAB -E
# 1. Crear un archivo crontab con el comando crontab -e
# 2. Agregar la siguiente linea al archivo crontab
# * * * * * /ruta/al/script/actividad.sh <GITHUB_USER>
# 3. Guardar y salir del editor
# 4. Verificar que el cronjob se agrego con el comando crontab -l
# 5. Esperar un minuto y verificar que se creo el archivo saludos.txt en el directorio tmp
# 6. Verificar que el archivo saludos.txt contiene el mensaje de saludo