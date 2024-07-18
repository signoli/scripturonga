#!/bin/bash

# Actualizar el sistema
sudo apt update && sudo apt upgrade -y

# Instalar paquetes necesarios
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Agregar la clave GPG de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Agregar el repositorio de Docker
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar la lista de paquetes
sudo apt update

# Instalar Docker
sudo apt install docker-ce -y

# Habilitar Docker para que se inicie automáticamente con el sistema
sudo systemctl enable docker

# Verificar que Docker esté corriendo
sudo systemctl start docker
sudo systemctl status docker

# Mensaje final
echo "Docker ha sido instalado y configurado para iniciarse automáticamente con el sistema."
