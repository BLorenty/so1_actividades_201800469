# Actividad 2
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
