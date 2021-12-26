	B main

n		DEFW 	100
buzz	DEFB "Buzz",0
fourth	DEFB "Fourth " ,0

		ALIGN

main	LDR R2, n 
                MOV R8,#0
		MOV R1, #1
loop	MOV R0, R1
		SWI 4

		MOV R0,#10
		SWI 0
yeet		ADD R1, R1, #1
		CMP R1, R2
		BLE multiple
		SWI 2
		
multiple        MOV R4,R1
                AND R5,R4, #3
                CMP R5,#0
                BEQ buzzz
                BAL loop
         
buzzz          ADD R8,R8,#1
               MOV R7,#4
               CMP R8,R7
               BEQ buzzharder
               ADR R0,buzz
               SWI 3
               MOV R0,#10
		SWI 0
               BAL yeet
               
buzzharder     ADR R0,fourth
               SWI 3
               ADR R0,buzz
               SWI 3
               MOV R0,#10
		SWI 0
	       MOV R8,#0
		 BAL yeet
