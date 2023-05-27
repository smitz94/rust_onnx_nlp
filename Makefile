.PHONY: run_main build_main run_inference build_inference build_project build_image run_container export_model clean

export_model:
	@echo "Exporting model in ONNX format"
	poetry install
	poetry run python .\export.py

run_main:
	@echo "Running main"
	cargo run --bin rust_onnx_nlp -- "Paris is the [MASK] of France."

build_main:
	@echo "Building main"
	cargo build --bin rust_onnx_nlp --release

run_inference:
	@echo "Running inference"
	cargo run --bin inference_api 

build_inference:
	@echo "Building inference"
	cargo build --bin inference_api --release

build_project: build_main build_inference

build_image:
	@echo "Building docker image"
	docker build -t rust_onnx_transformers .

run_container:
	@echo "Running container"
	docker run -d -p 8080:8080 --name actix_nlp rust_onnx_transformers

clean:
	@echo "removing target directory"
	rm -rf .\target