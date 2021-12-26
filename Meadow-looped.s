B main

verses 	DEFW	11
went    DEFB    "went to mow\n",0
man     DEFB    " man ",0
men     DEFB    " men",0
space   DEFB    " ",0
dog     DEFB    "and his dog, Spot\n",0
meadow  DEFB    "Went to mow a meadow\n",0
comma   DEFB    ", ",0
nl      DEFB    "\n",0
		
		ALIGN
		
main 
     LDR R1,verses
     MOV R0,#0
     CMP R0,R1
     BEQ end
     MOV R6,#0
     LDR R7,verses
    
     
     
 again MOV R0,R1
 SWI 4
 
 MOV R5,#1
 CMP R5,R1
 BNE menh
 ADR R0,man
 SWI 3
 back ADR R0,went
      SWI 3
 
 ADR R0,meadow
 SWI 3
 
 
 back1 MOV R0,R1
 SWI 4
 CMP R5,R1
 BNE mens
 
 ADR R0,man
 SWI 3
 ADR R0,dog
 SWI 3

 ADR R0,meadow
 SWI 3
 
 ADD R6,R6,#1
 SUB R1,R7,R6
 ADR R0,nl
 SWI 3
 CMP R6,R7
 BNE again
 
SWI 2


mens ADR R0,men
SWI 3
ADR R0,comma
SWI 3
MOV R4,#1
SUB R1,R1,R4
B back1

menh ADR R0,men
SWI 3
ADR R0,space
 SWI 3
B back
 
end SWI 2
