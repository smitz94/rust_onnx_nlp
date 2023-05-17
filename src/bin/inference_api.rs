use actix_web::{get, web, App, HttpServer, Result, Responder};
use serde::{Deserialize, Serialize};
use std::process::Command;

#[derive(Deserialize)]
struct RequestBody {
    text: String,
}

#[derive(Serialize)]
struct ResponseBody {
    text: String,
}

#[get("/infer")]
async fn inference(req_body: web::Json<RequestBody>) -> Result<impl Responder> {
    let text: &str = &req_body.text;
    let output = Command::new("C:/Users/szaveri/git/rust_onnx_nlp/target/release/rust_onnx_nlp")
                         .arg(text.to_string()).output().expect("failed to execute process.");

    let prediction = String::from_utf8(output.stdout).unwrap();
    println!("{}",std::env::current_dir().unwrap().display());

    println!("prediction is {}",prediction);

    let res_body = ResponseBody{
        text: prediction,
    };
     Ok(web::Json(res_body))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(inference)
    })
    .bind(("127.0.0.1", 8080))?
    .run()
    .await
}