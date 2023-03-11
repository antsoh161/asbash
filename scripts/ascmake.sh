#!/bin/bash

if [ "$#" -eq 1 ]; then
  if [ "$1" == "Debug" ]; then
      bear -- cmake --preset Debug
  elif [ "$1" == "Release" ]; then
      bear -- cmake --preset Release
  else
      echo "Invalid build type"
      exit 1
  fi
elif [ "$#" -eq 2 ]; then
  if [ "$1" == "build" ]; then
    if [ "$2" == "Debug" ]; then
      bear -- cmake --build --preset=Debug
    elif [ "$2" == "Release" ]; then
      bear -- cmake --build --preset=Release
    fi
  fi
fi

