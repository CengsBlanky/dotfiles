#!/bin/bash

yt-dlp $1

while [ $? -ne 0 ]
do
    yt-dlp $1
done
