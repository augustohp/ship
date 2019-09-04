#!/usr/bin/env bats
# vim: set noet ts=2 sw=2 sts=2 ai:

load helper

@test "displays help using short syntax" {
	run ship -h
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Usage: ship [-o <filename>] [-f] <image>" ]
}

@test "displays help using long syntax" {
	run ship --help
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Usage: ship [-o <filename>] [-f] <image>" ]
}

@test "display version using short syntax" {
	run ship -v
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "ship 1.0.0" ]
}

@test "display version using long syntax" {
	run ship --version
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "ship 1.0.0" ]
}

@test "running without arguments display short usage" {
	run ship
	[ "$status" -eq 1 ]
	[ "$output" = "No image specified! Run 'ship --help' for more information." ]
}
