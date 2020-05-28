use std::io::{self, Read};
// use std::io::prelude::*;
// use std::fs::File;

fn read_stdin_to_string() -> io::Result<String> {
    let mut buffer = String::new();
    
    // let mut input_handle = File::open("in.txt")?;
    let stdin = io::stdin();
    let mut input_handle = stdin.lock();

    input_handle.read_to_string(&mut buffer)?;

    Ok(buffer)
}

fn main() -> io::Result<()> { 
    let input = read_stdin_to_string()?;

    let tabs_and_quotes = input.replace("\\t", "\t").replace("\\\"", "\"");

    let output: Vec<&str> = tabs_and_quotes.split("\\n")
        .filter(|line| !line.contains("\tat") || line.contains("com.calms"))
        .collect();

    for x in &output {
        println!("{}", &x);
    }

    Ok(())
}

