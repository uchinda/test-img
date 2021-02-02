#!/bin/bash

img login -u uchinda -p 207608b7-259d-4845-a104-5ab327b5df67
img build -f eks/Dockerfile -t uchinda/img-build-test:0.1 .
img ls
img push uchinda/img-build-test:0.1