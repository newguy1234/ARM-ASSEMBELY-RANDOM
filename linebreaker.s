	B main
width	DEFW 12
		ALIGN
main	
; You will need to insert any setup code to 
; execute before the loop here
        MOV R1,#0
        LDR R2,width
        MOV R3,#32
		B readChar
loop	
;		Print character
		SWI 0
        ADD R1,R1,#1
        CMP R1,R2
        BGE check
back    BEQ newline
readChar	
		SWI 1
		CMP R0, #10
		BEQ newline
		CMP R0, #'#'
		BNE loop
		SWI 2
		
newline
      MOV R0,#10
		SWI 0
		MOV R1,#0
		BAL readChar

check CMP R0, #32
      BEQ back
      BNE readChar
