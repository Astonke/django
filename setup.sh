#!/bin/bash

project=$1
app_name=$1_app

mkdir $1_prj
cd  $1_prj

#setup virtual env
python3 -m venv venv
source venv/bin/activate

#default installs
pip install django
pip install mysqlclient

django-admin startproject $project
cd $project
python manage.py startapp $app_name

cd $project
echo "INSTALLED_APPS.append('$app_name')" >> settings.py

cd ..
mkdir -p $app_name/templates/myapp


echo $1 project made..
echo $app_name created..
