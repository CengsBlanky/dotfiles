#!/bin/bash

youtube-dl $1

while [ $? -ne 0 ]
do
    youtube-dl $1
done
