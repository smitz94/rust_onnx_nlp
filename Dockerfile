# Use the official Rust Docker image as the base image
FROM rust:latest as builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Cargo.toml and Cargo.lock files to leverage Docker's caching mechanism
COPY Cargo.toml Cargo.lock ./

# Copy all the files to the container
COPY . /app

# Build the rust_onnx_nlp binary
RUN cargo build --release --bin rust_onnx_nlp

# Build the inference binary
RUN cargo build --release --bin inference_api

# Create a new stage for the final image
FROM debian:latest

RUN apt-get update && rm -rf /var/lib/apt/lists/*
# Install system dependencies (if any)
# For example, if your microservice requires OpenSSL, you can include the following lines:
# RUN apt-get update && apt-get install -y openssl ca-certificates

# Set the working directory inside the container
WORKDIR /app

# Copy the built binaries from the previous stage
COPY --from=builder /app/albert /app/albert
COPY --from=builder /app/target/release/rust_onnx_nlp .
COPY --from=builder /app/target/release/inference_api .

# Expose the port on which your microservice listens
EXPOSE 8080

# Set the command to run mircro-service when the container starts
CMD ["./inference_api"]
