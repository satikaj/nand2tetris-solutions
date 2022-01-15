// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// If R0=0, jump to making R2=0. Else, make R2=R0
@R0
D=M

@ZERO
D;JEQ

@R2
M=D

// If R1=0, jump to making R2=0. Else, make new variable factor=R1
@R1
D=M

@ZERO
D;JEQ

@factor
M=D

// Make new variable i=1 (counter for loop)
@i
M=1

(LOOP)
// Jump to program end if i=factor
@factor
D=M

@i
D=M-D

@END
D;JEQ

// Add R0 to R2
@R0
D=M

@R2
M=M+D

// Increment i (counter)
@i
M=M+1

// Jump to next loop iteration
@LOOP
0;JMP

// Make R2=0 if one of the inputs are 0
(ZERO)
@R2
M=0

// End program
(END)
@END
0;JMP
