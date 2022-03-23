#!/bin/sh
rm -Rf venv build;mkdir venv;mkdir -p build
poetry config virtualenvs.path venv
poetry install --no-dev
cp ./*.py venv/*/lib/*/site-packages/
ls -la venv/*/lib/*/site-packages/
cp -Ra venv/*/lib/*/site-packages/* build

cd build;zip -r ../artifact.zip .

