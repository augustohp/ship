#!/usr/bin/env bats
# vim: set noet ts=2 sw=2 sts=2 ai:

load helper

@test "alpine:latest shell detection" {
	run ship --detect-shell alpine:latest
	[ "$output" = "ash" ]
}

@test "alpine:3.10 shell detection" {
	run ship --detect-shell alpine:3.10
	[ "$output" = "ash" ]
}

@test "alpine:3.9 shell detection" {
	run ship --detect-shell alpine:3.9
	[ "$output" = "ash" ]
}

@test "alpine:3.8 shell detection" {
	run ship --detect-shell alpine:3.8
	echo $output
	[ "$output" = "ash" ]
}

@test "alpine:3.7 shell detection" {
	run ship --detect-shell alpine:3.7
	[ "$output" = "ash" ]
}

@test "ubuntu:latest shell detection" {
	run ship --detect-shell ubuntu:latest
	[ "$output" = "bash" ]
}

@test "ubuntu:16.04 shell detection" {
	run ship --detect-shell ubuntu:16.04
	[ "$output" = "bash" ]
}

@test "ubuntu:18.04 shell detection" {
	run ship --detect-shell ubuntu:18.04
	[ "$output" = "bash" ]
}

@test "debian:latest shell detection" {
	run ship --detect-shell debian:latest
	[ "$output" = "bash" ]
}

@test "debian:stable shell detection" {
	run ship --detect-shell debian:stable
	[ "$output" = "bash" ]
}

@test "debian:testing shell detection" {
	run ship --detect-shell debian:testing
	[ "$output" = "bash" ]
}

@test "debian:unstable shell detection" {
	run ship --detect-shell debian:unstable
	[ "$output" = "bash" ]
}

@test "debian:buster shell detection" {
	run ship --detect-shell debian:10
	[ "$output" = "bash" ]
}

@test "debian:buster-slim shell detection" {
	run ship --detect-shell debian:10-slim
	[ "$output" = "bash" ]
}

@test "fedora:30 shell detection" {
	run ship --detect-shell fedora:30
	[ "$output" = "bash" ]
}

@test "fedora:29 shell detection" {
	run ship --detect-shell fedora:29
	[ "$output" = "bash" ]
}

@test "fedora:28 shell detection" {
	run ship --detect-shell fedora:28
	[ "$output" = "bash" ]
}
