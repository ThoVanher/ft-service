#!/bin/sh


#démarrage de la minikube VM
minikube start --vm-driver=virtualbox

#placement de l'environnement docker dans minikude
eval $(minikube docker-env)

#Activation de l'add-on mettallb et conf
minikube addons enable metallb
kubectl apply -f 'https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml'
kubectl apply -f 'https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml'
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml > /dev/null

build_images()
{
services="nginx wordpress mysql phpmyadmin influxdb"
for service in $services
	do
		docker build --no-cache -t $service-image srcs/$service > /dev/null
	done
}

build_ressource()
{
services="nginx wordpress mysql phpmyadmin influxdb"
for service in $services
	do
		kubectl apply -f srcs/$service/$service.yaml
	done
}

build_images
build_ressource

minikube dashboard
