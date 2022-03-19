#!/bin/sh
service_name=`poetry version | awk '{print $1}'`
code_version=`poetry version | awk '{print $2}'`
pwd;mkdir venv;mkdir -p build/lambda;mkdir -p build/dist
poetry config virtualenvs.path venv
poetry install --no-dev
cp ./*.py venv/*/lib/*/site-packages/
cp -R venv/*/lib/*/site-packages/* build

cd build;zip -r ../${service_name}_${code_version}.zip .


 echo "pyproject_name=$(poetry version | awk '{print $1}')" >> $GITHUB_ENV