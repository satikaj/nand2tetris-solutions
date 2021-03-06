// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

@SCREEN
D=A

@addr
M=D

@8191
D=D+A

@endscrn
M=D

(LOOP)
@KBD
D=M

@BLCK
D;JGT

@WHT
D;JEQ

(BLCK)
@addr
AD=M
M=-1

@endscrn
D=M-D

@LOOP
D;JEQ

@addr
M=M+1

@LOOP
0;JMP

(WHT)
@addr
AD=M
M=0

@SCREEN
D=D-A

@LOOP
D;JEQ

@addr
M=M-1

@LOOP
0;JMP
