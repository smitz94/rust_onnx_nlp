![tract-logo](assets/tract-horizontal-black.png) ![rust-logo](assets/rust-logo.png) ![python-logo](assets/python-logo.png) ![onnx-logo](assets/onnx-logo.png)

# Fast Inference Module/Template for MLOps with Rust utilizing ONNX

![GitHub](https://img.shields.io/github/license/smitz94/rust_onnx_nlp)
![rustc >= 1.65.0](https://img.shields.io/badge/rustc-%3E%3D1.65.0-brightgreen)

This module is a simple template for MLOps with Rust and Python. 

# Table of Contents

- [Motivation](#motivation)
- [Details](#details)
- [Features](#features)
- [How to Run different Features with Examples](#how-to-run-different-features-with-examples)
- [Pre-requisites](#Prerequisites)
- [What did I Learn](#what-did-i-learn)
- [Credits](#credits)
    

# Motivation

After going through several posts on linkedin and discussion forums regarding benifits of Rust inference, I decided to explore it further. I really liked the idea that we should not be rigid about python everywhere and use the tools which provide the best performance for the needs we have.

Low docker image size and blazing fast inference is desired by every MLOps practitioner. The idea of creating binaries and utlizing them into containerized application motivated me to build this project.

The idea that under deployment the container will only have binaries running and it will be really light weight and fast attracted me to build this project. 

We can use this same template in most of the Applications.

# Details

This module utilized both Rust and python libraries. It uses python to generate ONNX formatted model and then utilizes Rust to load the ONNX model and serve it as an API using Rust-Actix. It also includes dockerfile which can be used to containerized and deployed.

# Features

1. It uses python to export the **ONNX model**.
2. It loads the model and uses user input to do inference in Rust.
3. Inference api is exposed using Actix(very fast web framework).
   1. The binary created where model is loaded above is called and provided by user input.
   2. Really fast inference is done and output is returned.
4. Above features are then containerized and can be deployed easily.

# How to Run different Features with Examples

Make sure that the python version you are runniong the poetry wth and the python version of the project is matching else you will find the error sauyingno compatible versions found. I like to use conda and poetry in this case. Conda to create a virtual env with the python version i want and then just use poetry to track my installation.

this issue will be faced only while running in loaca if we use container then we will have python version supported by our project directly.

In our case we dont need poetry package definition in toml file as we dont want to install package but only the library dependencies in the venv.

# What did I Learn

# Credits