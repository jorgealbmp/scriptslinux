#!/bin/bash
while :
do
echo "*********************************************"
echo "Este Script sirve para agregar usuarios"
echo "*********************************************"

echo "++++++++++++++++++++++++++++++++++++"
echo -e "1.- Agregar Usuarios Version 1" 
echo "++++++++++++++++++++++++++++++++++++"
echo -e "2.- Agregar Usuarios Version 2"
echo "++++++++++++++++++++++++++++++++++++"
echo -e " 3.- Agregar Usuarios Version 3"
echo "++++++++++++++++++++++++++++++++++++"
echo "++++++++++++++++++++++++++++++++++++"
echo -e " 4.- SALIR"
echo "++++++++++++++++++++++++++++++++++++"
echo -e "Elige una opcion"
read opcion
case $opcion in 
1)
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "Elegiste la version 1"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "la version 1 solo agrega usuario y contraseña"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "Ingresa el nombre del usuario\n"
read usuario

echo -e "\nIngresa un comentario para el usuario\n"
read comentario

echo -e "\nEstos son los grupos que hay\n"
cat /etc/group

echo -e "\nIngresa el nombre del grupo para el usuario\n"
read grupo
sudo groupadd $grupo

echo -e "\nIngrese la ruta del directorio hogar (Por default es: /home/'nombreUsuario'\n"
read dirHogar

sudo useradd -c $comentario -d $dirHogar -m -k /etc/skel -g $grupo -s /bin/bash $usuario

echo -e "\nSE HA CREADO EL USUARIO\n"
sleep 3

echo -n "Se modificara la contraseña del usuario: "$usuario
sleep 3
echo -e "\nIngrese la contraseña del usuario"
STTY_SAVE=`stty -g`
stty -echo
read contra
stty $STTY_SAVE
longitud=${#contra}
if [ $longitud = 8 ];
        then 
        echo -e "\nCumple la condicion\n"
        echo "$usuario:$contra" | sudo chpasswd
        else
                echo -e "\nNo cumple la condicion\n"
fi
echo "Contraseña establecida"
;;
2)
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "Elegiste la version 2"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "la version 2 solo agrega usuario y contraseña"
echo -e "tambien agrega una quota de almacenamiento"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "Ingresa el nombre del usuario\n"
read usaurio
echo -e "\nIngresa un comentario para el usuario\n"
read comentario

echo -e "\nEstos son los grupos que hay\n"
cat /etc/group

echo -e "\nIngresa el nombre del grupo para el usuario\n"
read grupo
sudo groupadd $grupo

echo -e "\nIngrese la ruta del directorio hogar (Por default es: /home/'nombreUsuario'\n"
read dirHogar

sudo useradd -c $comentario -d $dirHogar -m -k /etc/skel -g $grupo -s /bin/bash $usuario

echo -e "\nSE HA CREADO EL USUARIO\n"
sleep 3

echo -n "Se modificara la contraseña del usuario: "$usuario
sleep 3
echo -e "\nIngrese la contraseña del usuario"
STTY_SAVE=`stty -g`
stty -echo
read contra
stty $STTY_SAVE
longitud=${#contra}
if [ $longitud = 8 ];
        then 
        echo -e "\nCumple la condicion\n"
        echo "$usuario:$contra" | sudo chpasswd
        else
                echo -e "\nNo cumple la condicion\n"
fi
echo "Contraseña establecida"
sleep 5

echo "***************************************************************"
echo -e "\nEstas aputo de agregar la quota                          *"
echo "***************************************************************"
echo -e "\n Las reglas para poder establecerlas son las siguientes: *"
echo "***************************************************************"
echo -e "\n Se asignan en Megabytes                                 *"
echo "***************************************************************"
echo -e "\n Primero es el Soft y se prosigue con el Hard            *"
echo -e "\n Soft debe ser menor que hard o del mismo tamaño         *"
echo "***************************************************************"
echo -e "\n Al terminar se debe oprimir Ctrl+k y q para salir       *"
echo -e "\n Para guardar el cambio se guarda con la letra y         *"
echo "***************************************************************"
sleep 20
sudo edquota -u $usaurio
echo -e "\n Quota finalizada"
;;
3)
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "Elegiste la version 3"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "la version 3 agrega usuario y contraseña"
echo -e "tambien agrega una quota de almacenamiento"
echo -e "tambien agrega al usario al archivo sudoers"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "Ingresa el nombre del usuario\n"
read usaurio
echo -e "\nIngresa un comentario para el usuario\n"
read comentario
echo -e "\nEstos son los grupos que hay\n"
cat /etc/group

echo -e "\nIngresa el nombre del grupo para el usuario\n"
read grupo
sudo groupadd $grupo

echo -e "\nIngrese la ruta del directorio hogar (Por default es: /home/'nombreUsuario'\n"
read dirHogar

sudo useradd -c $comentario -d $dirHogar -m -k /etc/skel -g $grupo -s /bin/bash $usuario

echo -e "\nSE HA CREADO EL USUARIO\n"
sleep 3

echo -n "Se modificara la contraseña del usuario: "$usuario
sleep 3
echo -e "\nIngrese la contraseña del usuario"
STTY_SAVE=`stty -g`
stty -echo
read contra
stty $STTY_SAVE
longitud=${#contra}
if [ $longitud = 8 ];
        then 
        echo -e "\nCumple la condicion\n"
        echo "$usuario:$contra" | sudo chpasswd
        else
                echo -e "\nNo cumple la condicion\n"
fi
echo "Contraseña establecida"
sleep 5

echo "***************************************************************"
echo -e "\nEstas aputo de agregar la quota                          *"
echo "***************************************************************"
echo -e "\n Las reglas para poder establecerlas son las siguientes: *"
echo "***************************************************************"
echo -e "\n Se asignan en Megabytes                                 *"
echo "***************************************************************"
echo -e "\n Primero es el Soft y se prosigue con el Hard            *"
echo -e "\n Soft debe ser menor que hard o del mismo tamaño         *"
echo "***************************************************************"
echo -e "\n Al terminar se debe oprimir Ctrl+k y q para salir       *"
echo -e "\n Para guardar el cambio se guarda con la letra y         *"
echo "***************************************************************"
sleep 20
sudo edquota -u $usaurio
echo -e "\n Quota finalizada"
echo "***************************************************************"
echo -e "Se agregará al usaurio creado al archivo sudoers\n"
echo "***************************************************************"
echo -e "Para que tenga privelegios por el comando sudo"
echo "***************************************************************"
sudo sed -i '$a '$usuario' ALL=(ALL:ALL) ALL' /etc/sudoers
sleep 4
echo -e "\nFElICIDADES\n"
whoami
echo -e "\nYA PUEDES USAR SUDO\n"
echo -e "\nY RECUERDA\n"
echo -e "\nUN GRAN PODER, CONLLEVA UNA GRAN RESPONSABILIDAD\n"
;;
4)
exit
;;
esac
done
