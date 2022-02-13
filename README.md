# Bywater BASIC Interpreter

The Bywater BASIC Interpreter (bwBASIC) implements a large superset of the ANSI Standard for Minimal BASIC (X3.60-1978) and a significant subset of the ANSI Standard for Full BASIC (X3.113-1987) in C.

BWBASIC is an original creation of Ted A. Campbell, who stopped working on it in 1993. Since then it has received contributions from other programmers: Jon B. Volkoff, Paul Edwards and Howard S. Wulf.

## Usage

Inside program, type:

* `help` - show all commands available.
* `help commandname` - show help for a specific command.
* `list` - list source code for the program currently in memory
* `run` - executes the program in memory from the start.
* `new` - deletes the program in memory and clears all variables.
* `load filename` - loads an ASCII BASIC program into memory.
* `save filename` - saves the current program into the file "filename" in ASCII format.
* `shell "command"` - lets you run a SHELL or DOS command within bwbasic. For example, to list the contents of the current directory, in Linux type `shell "ls -l"`, in Windows type `shell "dir"`.
* `quit` - exits bwbasic.

## About this repository

The official repository is located at [SourceForge](https://sourceforge.net/projects/bwbasic/). However, all available versions were transfered to GitHub, in order to create a history with the modifications of all versions. Some compiled versions are also available in the [Releases](https://github.com/nerun/bwbasic/releases) section, with their respective source code.