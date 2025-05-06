#!/bin/bash


ip addr | awk '/ether/ {print $2}'
