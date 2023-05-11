# rust_onnx_nlp

### Tasks 
1. Build a rust project for pytorch
2. Deploy it using rust-actix
3. Given a user input it gives the output

### Process
1. Got to know about sonos/tract.
2. It has a git repo and some example.
3. tract-onnx crate is there to support its implementation in rust.

### Issues
1. while looking at the example in the sonos/tract I found that there is a text feild which is coupled with the model while exporting as onnx in export.py file.
2. Looking at this example: [https://pytorch.org/tutorials/advanced/super_resolution_with_onnxruntime.html] I found that:
   1. onnx runtime is supported from python 3.5 - 3.7.
   2. the text input is required because to export a model, we call the torch.onnx.export() function. This will execute the model, recording a trace of what operators are used to compute the outputs. Because export runs the model, we need to provide an input tensor x.

### Completed
1. Created rust project and set up Cargo.toml and set all the dependencies for rust 
2. Installed poetry and added all the relevant dependencies for python
3. Ran poetry add torch transformers onnx
4. Ran poetry run python export.py and exported the onnx version of model.

### TODO
1. Change the text dependency in 