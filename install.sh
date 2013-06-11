#!/bin/sh
ver="`llvm-config --version`"
export CGO_CFLAGS="`llvm-config --cflags` -I ../include"
export CGO_LDFLAGS="`llvm-config --ldflags` -Wl,-L`llvm-config --libdir` -lLLVM-$ver"

case "$ver" in
*svn)
	tags="-tags llvmsvn"
	;;
*)
	tags="-tags llvm$ver"
	;;
esac

go clean -i github.com/greggoryhz/gollvm/llvm
go get $tags $* github.com/greggoryhz/gollvm/llvm
