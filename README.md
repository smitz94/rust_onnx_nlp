# rust_onnx_nlp

### Tasks 
1. Build a rust project for pytorch
2. Deploy it using rust-actix
3. Given a user input it gives the output

### Process
**Date:** 11-05-2023
1. Got to know about sonos/tract.
2. It has a git repo and some example.
3. tract-onnx crate is there to support its implementation in rust.

**Date:** 12-05-2023
1. Converting the hardcoded text input in the main.rs to read from cli arguments.

### Issues
1. while looking at the example in the sonos/tract I found that there is a text feild which is coupled with the model while exporting as onnx in export.py file.
2. Looking at this example: [https://pytorch.org/tutorials/advanced/super_resolution_with_onnxruntime.html] I found that:
   1. onnx runtime is supported from python 3.5 - 3.7.
   2. the text input is required because to export a model, we call the torch.onnx.export() function. This will execute the model, recording a trace of what operators are used to compute the outputs. Because export runs the model, we need to provide an input tensor x.
3. While running cargo clippy faced some error with Cargo.toml- ndarray.workspace = true was mentioned in tutorial but thatt will throw error so removed and then added reference from the crate.io
4. edition="2021" in Cargo.toml is required but dont know why?

### Completed
**Date:** 11-05-2023
1. Created rust project and set up Cargo.toml and set all the dependencies for rust 
2. Installed poetry and added all the relevant dependencies for python
3. Ran poetry add torch transformers onnx
4. Ran poetry run python export.py and exported the onnx version of model.
5. Ran cargo clippy.
6. Rand cargo run --release.

**Date:** 12-05-2023
1. Updated text input through CLI args. Worked fine but the predictions of the model were not good and wrong sometime.

### TODO
1. Change the text dependency in main.rs and convert it to user input.
2. Create an actix based APIs and address this user input.
3. Bind these 2 into a docker container and deploy as a service
4. Document Performance of the inference.


### References
[https://www.youtube.com/watch?v=GEd5PY3BeNo&ab_channel=PragmaticAILabs]