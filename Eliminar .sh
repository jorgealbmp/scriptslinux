#!/bin/bash

echo "Ingrese la ruta a eliminar: " 

read ruta

mv $ruta /home/jorgealbmp/.local/share/Trash/files

echo "Ruta eliminada. " 

