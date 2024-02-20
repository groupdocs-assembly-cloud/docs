#!/bin/bash

git submodule update --init --recursive docs-cloud-common
git submodule foreach git pull origin master
rm -rf ./docs-cloud-common/content/assembly/*
cp -r ./content/* ./docs-cloud-common/content/
cd ./docs-cloud-common
hugo server -D --config=config-geekdoc.toml
