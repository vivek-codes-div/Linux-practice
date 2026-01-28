#!/bin/bash


read -p "Username " u
id "$u" 2>/dev/null || echo " user does not exist "
