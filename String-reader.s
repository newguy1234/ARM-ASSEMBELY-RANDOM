	B main

fs1	DEFB	"%d green %s sitting on a wall%c\n",0
fs2	DEFB	"This is a test containg nothing but a %%\n",0
fs3	DEFB	"%d %d %d %d %d.\n%s!\n\n%s\n",0
bottleString	DEFB "bottles",0
blast	DEFB	"Blast Off!",0
hello	DEFB	"Hello Universe",0
	ALIGN
seq1	DEFW	10,bottleString, '.'
seq2	DEFW	1
seq3	DEFW	5,4,3,2,1,blast,hello

main	ADR R1,fs1		; Feel free to change these to point to the other format specifiers and value sequencei
	ADR R2,seq1

printf
; You should start your program here
; DO NOT modify any of the code above (other than to try different tests -- the pipeline will run further tests as well.)

begin LDRB R0,[R1],#1
       CMP R0,#0
       BEQ END
       CMP R0,#37
       BEQ sequence
      SWI 0
      BAL begin

sequence LDRB R0,[R1],#1
         CMP R0,#37
         BNE next
         MOV R0,#37
         SWI 0
 next    CMP R0,#100
         BNE next1
         LDR R0,[R2],#4
         SWI 4
         BAL end
next1    CMP R0,#115
         BNE next2
         LDR R0,[R2],#4
         SWI 3
         BAL end
next2    CMP R0,#99
         BNE end
         LDR R0,[R2],#4
         SWI 0
end      BAL begin



END    SWI 2
