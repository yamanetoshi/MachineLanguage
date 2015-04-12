// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
    @old
    M=0

(LOOP)
    @KBD
    D=M
    @old
    D=D-M

    @LOOP
    D;JEQ

    @KBD
    D=M
    @old
    M=D

    // if D == 0 then jmp WHITE else jmp BLACK
    @WHITE
    D;JEQ
    @BLACK
    0;JMP

(WHITE)
    @color
    M=0
    @PAINT
    0;JMP

(BLACK)
    @color
    M=-1

(PAINT)
    @i
    M=0

(PAINT-INNER-LOOP)
    @i
    D=M
    @8192
    D=A-D
    @PAINT-INNER-LOOP-EXIT
    D;JLE

    // ptr = SCREEN + i
    @SCREEN
    D=A
    @i
    D=D+M
    @ptr
    M=D

    // *ptr = color
    @color
    D=M
    @ptr
    A=M
    M=D

    @i
    M=M+1
    @PAINT-INNER-LOOP
    0;JMP

(PAINT-INNER-LOOP-EXIT)
    @LOOP
    0;JMP

(END)
    @END
    0;JMP
