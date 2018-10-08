#!/bin/sh
_Library="-lGL -lGLU -lglut"
_FileOut=$(echo ${1} | awk -F'.' '{print $1}')
_FileOut="${_FileOut}.out"
_Compile_Command="g++ ${1} -o ${_FileOut} ${_Library}"
_Command="./${_FileOut}"
$_Compile_Command
$_Command
rm $_FileOut

