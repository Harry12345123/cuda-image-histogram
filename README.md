# CUDA Image Histogram

A CUDA C++ project for histogram computation on the GPU.

This repository is helpful for learning parallel statistics, atomic operations, and image analysis in CUDA.

## Features

- image histogram computation with CUDA
- practical GPU statistics example
- useful for image analysis learning
- beginner-to-intermediate CUDA project

## Tech Stack

- C++
- CUDA
- OpenCV

## Project Goal

This project demonstrates:

- how histogram statistics are computed in parallel
- how atomic operations are used in CUDA
- how GPU computing can accelerate image analysis tasks

## Future Improvements

- RGB histogram support
- histogram equalization
- performance benchmarking
- Jetson version

## Related Topics

CUDA, Histogram, GPU Statistics, Image Analysis, C++, OpenCV

## Author

Harry12345123

## Requirements

Before building this project, make sure your system has:

- CUDA Toolkit
- OpenCV
- CMake 3.18 or later
- C++17 compatible compiler

## Build

Use the following commands to compile the project:

```bash
mkdir build
cd build
cmake ..
make -j

Run

After building, run the program with:

./cuda_image_histogram input.jpg

Notes
Make sure input.jpg exists in the project root directory.
You can replace the input file with your own image.
The executable name depends on your CMake project configuration.
