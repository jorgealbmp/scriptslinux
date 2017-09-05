#/bin/bash 
echo -e "Archivos y directorios  a recuperar \n"
ls -l /home/jorgealbmp/.local/share/Trash/files/

echo -e "\n Ingrese el nombre del archivo que desea recuperar \n"
read recuperar

echo -e "\n"
mv ~/.local/share/Trash/files/$recuperar /home/jorgealbmp/Escritorio/ArchivosRecuperados

echo - e "Su archivo se ha recuperado, revise la carpeta ArchivosRecuperados"
