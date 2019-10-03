#!/bin/bash

## Removendo travas aventuais do apt
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

## Atualizando o repositorio
sudo apt update &&
