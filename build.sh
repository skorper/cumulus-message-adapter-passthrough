#!/bin/sh
rm -Rf venv build;mkdir venv;mkdir -p build
poetry config virtualenvs.path venv
poetry install --no-dev
cp ./*.py venv/*/lib/*/site-packages/
cp -R venv/*/lib/*/site-packages/* build

cd build;zip -r ../artifact.zip .

