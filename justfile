setup:
	cargo install cargo-bump just

build:
  cargo build --release

test:
	PG_URL='postgres://postgres:postgres@localhost:5432/test' cargo test
