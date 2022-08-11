#!/usr/bin/env node

const { spawn } = require("child_process");
const path = require("path");

function determineBinary() {
	if (process.platform === "darwin" && process.arch === "x64") {
		return path.join(__dirname, "macos-x64", "postgres_migrator");
	} else if (process.platform === "darwin" && process.arch === "arm64") {
		return path.join(__dirname, "macos-arm64", "postgres_migrator");
	} else if (process.platform === "linux" && process.arch === "x64") {
		return path.join(__dirname, "linux-x64", "postgres_migrator");
	} else {
		return null;
	}
}

function main() {
	const input = process.argv.slice(2);
	const bin = determineBinary();

	if (bin !== null) {
		spawn(bin, input, { stdio: "inherit" }).on("exit", process.exit);
	} else {
		throw new Error(
			`Platform "${process.platform} (${process.arch})" not supported.`
		);
	}
}

main();
