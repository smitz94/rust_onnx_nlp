# Fast Inference Module/Template for MLOps with Rust utilizing ONNX

![GitHub](https://img.shields.io/github/license/smitz94/rust_onnx_nlp)
![rustc >= 1.65.0](https://img.shields.io/badge/rustc-%3E%3D1.65.0-brightgreen)

This module is a simple template for MLOps with Rust and Python. It uses python to generate _ONNX formatted model_ and then utilizes Rust to load the ONNX model and serve it as an API using _Rust-Actix_. It also includes dockerfile which can be used to containerize and deploy as an application.

# Table of Contents

- [Motivation](#motivation)
- [Features](#features)
- [How to Run different Features with Examples](#how-to-run-different-features-with-examples)
- [Pre-requisites](#Prerequisites)
- [What did I Learn](#what-did-i-learn)
- [Credits](#credits)
    

# Motivation

After going through several posts on linkedin and MLOps-discussion forums regarding benifits of Rust based inference while deploying ML application, I decided to explore it further. I really liked the idea that we should not be rigid about python everywhere and use the tools which provide the best performance for the needs we have.

Low docker image size and blazing fast inference is desired by every MLOps practitioner. The idea of creating binaries and utlizing them into containerized application motivated me to build this project.

The idea that under deployment the container will only have binaries running and it will be really light weight and fast attracted me to build this project. 

We can use this same template in most of the Applications.

# Features

### CLI

CLI support with Makefile to 
1. Export model
2. Build binaries
3. Build whole project
4. Create docker image
5. Run model locally
6. Deploy as docker container
   
### API

Utilizing Actix it has CLI as well as docker support to expose api that can take user input and return model predicted output.

### Containerized Application

It has dockerfile that can be utilized to deploy as docker container or any cloud platform.

# Pre-requisites

I faced couple of issues while i was running project with poetry. Poetry is great as it takes the overhead of dependency management and had really cool features. I am still exploring so please feel free to comment if something is wrongly done.

When you install poetry in your system environment then when you start building the project and add the libraries it takes the python version from your local as reference and start adding other libraries resolving dependencies. The issue i feel here is it hinders the migration. For eg. I want to use python 3.10 and my system has 3.9 or 3.11 then i have to install the 3.10 version. 

Instead of this I really like the combination of really light weight mamba (conda) to manage the python environment and then poetry to manage dependencies and also virtual environment to run the code inside. This way I ensure that i am not hindering with the system python environment.


Make sure that the python version you are running the poetry wth and the python version of the project is matching else you will find the error sauyingno compatible versions found. I like to use conda and poetry in this case. Conda to create a virtual env with the python version i want and then just use poetry to track my installation.

this issue will be faced only while running in loaca if we use container then we will have python version supported by our project directly.

In our case we dont need poetry package definition in toml file as we dont want to install package but only the library dependencies in the venv.

# How to Run different Features with Examples

Please go through []

# What did I Learn

# Credits

### Pragmatic AI  

This channel helped me to understand the capabilities of the project and introduced to some good crates and libraries.

### Sonos-tract https://github.com/sonos/tract

Bridge between ONNX and rust.

### ChatGPT  

Helped me with mundane tasks, dockerfile creation and debugging. Really useful to fast track your project and debuggings.