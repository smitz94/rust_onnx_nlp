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

**Date:** 13-05-2023
1. I wanted to create multiple binaries in single project but was unable to get it. The idea was to create a actix api in same project and then whenever that api is hit with some text call the model binary and then return the output to the user.
   1. while going through this I found these:
      1. Youtube video : [https://www.youtube.com/watch?v=F23vC3IQZJA&ab_channel=RustIng] talking about bin folder.
      2. Then I found the cargo book and a desired project structure in case of a bigger and organized project : [https://doc.rust-lang.org/cargo/guide/project-layout.html]
      3. Then I found the changes in toml file related to bin : [https://doc.rust-lang.org/cargo/reference/cargo-targets.html#binaries]

**Date:** 17-05-2023
1. Tried running the same command but I was running it from different directories , so when I tried to run the command again from the root directory it worked fine.
2. Same I tried running inference api from the root directory and it worked fine.

command: cargo build  --bin rust_onnx_nlp --release , cargo run --bin inference_api

**Date:** 18-05-2023
1. Using debian buster slim was throwing error for glibc as inference api required 2.29 version. Therefore changed the version from buster slim to latest debian.
2. Explicitely bin path not mentioned in cargo.toml file causing issue to build docker image.
3. Binding port of the rust application needs to be changed else it was unable to communicated via postman.
### Completed
**Date:** 11-05-2023
1. Created rust project and set up Cargo.toml and set all the dependencies for rust 
2. Installed poetry and added all the relevant dependencies for python
3. Ran poetry add torch transformers onnx
4. Ran poetry run python export.py and exported the onnx version of model.
5. Ran cargo clippy.
6. Ran cargo run --release.

**Date:** 12-05-2023
1. Updated text input through CLI args. Worked fine but the predictions of the model were not good and wrong sometime.
2. CLI args reference: [https://doc.rust-lang.org/book/ch12-01-accepting-command-line-arguments.html]
3. Ran cargo run --release -- "Obama is the [MASK] of USA".

**Date:** 13-05-2023
1. Create a src/bin folder to store other binary files that can be compiled.
2. Added inference_api.rs file that consists of actix web api for sample hello world.
3. Successfully created 2 binaries in single project using actix dependency in dependencies and also adding bin in toml file.

**Date:** 17-05-2023
1. From the root of the project directory ran: .\target\release\rust_onnx_nlp "Paris is the [MASK] of France."
**root dir is the dir where Cargo.toml is located**
2. Ran from root of the project directory : cargo build --bin rust_onnx_nlp --release
3. Ran : cargo run --bin inference_api 

### TODO
1. Change the text dependency in main.rs and convert it to user input.
2. Create an actix based APIs and address this user input.
3. Bind these 2 into a docker container and deploy as a service
4. Document Performance of the inference.


### References
[https://www.youtube.com/watch?v=GEd5PY3BeNo&ab_channel=PragmaticAILabs]