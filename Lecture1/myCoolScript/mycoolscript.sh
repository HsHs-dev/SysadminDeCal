#!/bin/bash

FILES=$(ls *)

for File in ${FILES[@]}
do
  cp $File new_$File
done