#!/bin/bash

while mpc idle player >/dev/null 2>&1; do
    refbar.sh
done
