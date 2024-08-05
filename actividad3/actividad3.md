## Parte 1: Gestión de Usuarios
__1. Creación de Usuarios: Crea tres usuarios llamados `usuario1`, `usuario2` y `usuario3`.__
~~~
sudo adduser usuario1
sudo adduser usuario2
sudo adduser usuario3
~~~

__2. Asignación de Contraseñas: Establece una nueva contraseñas para cada usuario creado.__

La contraseña se establece en conjunto con el commando __adduser__ sin embargo si el usuario fue creado con el comando __useradd__ se puede de la siguiente manera:
~~~
echo "usuario1:password1" | sudo chpasswd
echo "usuario2:password2" | sudo chpasswd
echo "usuario2:password2" | sudo chpasswd
~~~

__3. Información de Usuarios: Muestra la información de `usuario1` usando el comando `id`.__
~~~
id usuario1
~~~

__4. Eliminación de Usuarios: Elimina `usuario3`, pero conserva su directorio principal.__
~~~
sudo userdel usuario3
sudo mv /home/usuario3 /home/usuario3_backup
~~~

## Parte 2: Gestión de Grupos
__1. Creación de Grupos: Crea dos grupos llamados `grupo1` y `grupo2`.__
~~~
sudo groupadd grupo1
sudo groupadd grupo2
~~~
__2. Agregar Usuarios a Grupos: Agrega `usuario1` a `grupo1` y `usuario2` a `grupo2`.__
~~~
sudo usermod -aG grupo1 usuario1
sudo usermod -aG grupo2 usuario2
~~~
__3. Verificar Membresía: Verifica que los usuarios han sido agregados a los grupos utilizando el comando `groups`.__
~~~
groups usuario1
groups usuario2
~~~

__4. Eliminar Grupo: Elimina `grupo2`.__
~~~
sudo groupdel grupo2
~~~

## Parte 3: Gestión de Permisos
__1. Creación de Archivos y Directorios:__
__Como `usuario1`, crea un archivo llamado `archivo1.txt` en su directorio principal y escribe algo en él.
Crea un directorio llamado `directorio1` y dentro de ese directorio, un archivo llamado `archivo2.txt`.__
~~~
su - usuario1
echo "Contenido de archivo1" > archivo1.txt
mkdir directorio1
echo "Contenido de archivo2" > directorio1/archivo2.txt
~~~

__2. Verificar Permisos: Verifica los permisos del archivo y directorio usando el comando `ls -l` y `ls -ld` respectivamente.__
~~~
ls -l archivo1.txt
ls -ld directorio1
~~~

__3. Modificar Permisos usando `chmod` con Modo Numérico: Cambia los permisos del `archivo1.txt` para que sólo `usuario1` pueda leer y escribir (permisos `rw-`), el grupo pueda leer (permisos `r--`) y nadie más pueda hacer nada.__
~~~
chmod 640 archivo.txt
~~~

__4. Modificar Permisos usando `chmod` con Modo Simbólico: Agrega permiso de ejecución al propietario del `archivo2.txt`.__
~~~
chmod u+x directorio1/archivo2.txt
~~~

__5. Cambiar el Grupo Propietario: Cambia el grupo propietario de `archivo2.txt` a `grupo1`.__
~~~
chgrp grupo1 directorio1/archivo2.txt
~~~

__6. Configurar Permisos de Directorio: Cambia los permisos del `directorio1` para que sólo el propietario pueda entrar (permisos `rwx`), el grupo pueda listar contenidos pero no entrar (permisos `r--`), y otros no puedan hacer nada.__
~~~
chmod 740 directorio1
~~~

__7. Comprobación de Acceso: Intenta acceder al `archivo1.txt` y `directorio1/archivo2.txt` como `usuario2`. Nota cómo el permiso de directorio afecta el acceso a los archivos dentro de él.__
~~~
su - usuario2
cat /home/usuario1/archivo1.txt
ls /home/usuario1/directorio1
cat /home/usuario1/directorio1/archivo2.txt
~~~

__8. Verificación Final: Verifica los permisos y propietario de los archivos y directorio nuevamente con `ls -l` y `ls -ld`.__
~~~
ls -l /home/usuario1/archivo1.txt
ls -ld /home/usuario1/directorio1
ls -l /home/usuario1/directorio1/archivo2.txt
~~~

## Reflexión: (Opcional) 
Contestar las siguientes preguntas:

__¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo?__
Principalmente por seguridad, cuando se tienen muchos archivos con información crítica o con funcionalidades importantes para procesos y aplicaciones es de alta importancia determinar quien o quienes pueden hacer cambios en todo el ambiente del sistema.
__¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux?__
- chown
- umask
- sudo visudo