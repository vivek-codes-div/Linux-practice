#!/bin/bash


read -p "Process ? " p
pgrep "$p" || echo " Not running "
