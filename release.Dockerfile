FROM rust:latest as builder
WORKDIR /usr/src/
RUN rustup target add x86_64-unknown-linux-musl

RUN USER=root cargo new postgres_migrator
WORKDIR /usr/src/postgres_migrator
COPY Cargo.toml Cargo.lock ./
RUN cargo build --release

COPY src ./src
RUN cargo install --target x86_64-unknown-linux-musl --path .

FROM supabase/pgadmin-schema-diff:latest

COPY --from=builder /usr/local/cargo/bin/postgres_migrator /usr/bin/

WORKDIR /working

ENTRYPOINT ["/usr/bin/postgres_migrator"]
