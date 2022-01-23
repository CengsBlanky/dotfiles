#! /usr/bin/bash

wget \
    --recursive \
    --no-clobber \
    --page-requisites \
    --html-extension \
    --convert-links \
    --restrict-file-names=windows \
    --domains docs.spring.io  \
    --no-parent \
    https://docs.spring.io/spring-framework/docs/current/reference/html/core.html
