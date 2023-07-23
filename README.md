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

I like Poetry to work with dependency management and configurations. But when you first build your project Poetry takes the python version from your local as reference and start adding other libraries resolving dependencies.

There are 2 ways you can control the python version you want to work with for your project. 
1. Install the python version to your local system.
2. Install mamba a lightweight conda to manage base python version of your project while you build it.

I like to use 2nd option as it stops the interference of different python versions in your local system. So I find the 2nd option very convenient.

Make sure while building this project for the first time install python dependencies, setup rust.

Refer: 
1. https://www.rust-lang.org/tools/install
2. https://mamba.readthedocs.io/en/latest/installation.html
3. https://python-poetry.org/docs/basic-usage/

# How to Run different Features with Examples

Please go through [pre-requisites](#pre-requisites).

To enable easy experience running this project again and to no memorize the commands I have added makefile to it.

### Exporting the model with python env enabled

```sh
make export_model
```
underlying this command will run these commands:
```sh
poetry install
```
which will install all the python dependencies in virtualenv using poetry.lock file as reference.

```sh
& ((poetry env info --path) + "\Scripts\activate.ps1")
```
which will activate the virtualenv in the current shell without changing shell settings.
```sh
python .\export.py
```
which will export the ONNX fomat model in to the directory specified.

### Building Local Project

```sh
make build_project
```
this will build the complete project, underlying commands like above are explained in [makefile](/Makefile).

### Building Docker Image

```sh
make build_image
```

### Running Docker Container

```sh
make run_container
```

> You can customize commands in [makefile](/Makefile).
# What did I Learn

# Credits

### Pragmatic AI  

This channel helped me to understand the capabilities of the project and introduced to some good crates and libraries.

### Sonos-tract https://github.com/sonos/tract

Bridge between ONNX and rust.

### ChatGPT  

Helped me with mundane tasks, dockerfile creation and debugging. Really useful to fast track your project and debuggings.