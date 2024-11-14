use std::env;
use std::fs::File;
use std::io::Write;
use std::thread;

fn main() {
    thread::spawn(|| {
        let mut args = env::args().into_iter();
        args.next();
        let path = args.next().expect("Usage: parallel-write <file>");
        println!("{path:?}");

        // let mut f = File::options()
        //     .read(true)
        //     .write(true)
        //     .create(true)
        //     .open(&path)
        //     .unwrap();
        //
        // write!(&mut f, "Hello").unwrap();
    });
}
