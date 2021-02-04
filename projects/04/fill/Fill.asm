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

// Put your code here.
(MAIN)
	@24576	
	D=M
	@FILL
	D;JNE //jump to FILL if a key is pressed	
	@CLEAR
	D;JEQ
	@MAIN
	0;JMP
(FILL)
	@i
	M=0 //Set counter i to 0	
	@8192	
	D=A
	@end
	M=D
	@16384
	D=A
	@screen
	M=D
	(FILLLOOP)		
		@i
		D=M
		@end
		D=D-M	
		@MAIN
		D;JEQ


		@screen
		D=M
		@i
		D=D+M
		A=D
		M=-1	


		@i
		M=M+1
		@FILLLOOP
		0;JMP	
(CLEAR)
	@i
	M=0 //Set counter i to 0	
	@8192	
	D=A
	@end
	M=D
	@16384
	D=A
	@screen
	M=D
	(CLEARLOOP)		
		@i
		D=M
		@end
		D=D-M	
		@MAIN
		D;JEQ


		@screen
		D=M
		@i
		D=D+M
		A=D
		M=0	


		@i
		M=M+1
		@CLEARLOOP
		0;JMP	
