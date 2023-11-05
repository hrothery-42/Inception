#!/bin/bash
if [ ! -d "./srcs/requirements/tools" ]; then
	mkdir ./srcs/requirements/tools
	cd ./srcs/requirements/tools
	mkcert hrothery.42.fr
	mv hrothery.42.fr-key.pem hrothery.42.fr.key
	mv hrothery.42.fr.pem hrothery.42.fr.crt
	cd ../../..
fi