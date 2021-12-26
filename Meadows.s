B main
men DEFB " men",0
comma DEFB ", ",0
dog DEFB " man and his dog",0
mow DEFB " went to mow",0
Mow DEFB "Went to mow",0
Spot DEFB "Spot",0
NEWLINE DEFB "\n",0
meadow DEFB " a meadow",0

; define your strings here

		ALIGN

    main MOV R0,#4
     SWI 4
    ADR R0, men
    SWI 3
    ADR R0, mow
    SWI 3
     ADR R0, NEWLINE
    SWI 3

    ADR R0, Mow
    SWI 3
     ADR R0, meadow
    SWI 3

    ADR R0, NEWLINE
    SWI 3

    MOV R0,#4
     SWI 4
      ADR R0, men
    SWI 3
     ADR R0, comma
     SWI 3

     MOV R0,#3
     SWI 4
      ADR R0, men
    SWI 3
    ADR R0, comma
     SWI 3

    MOV R0,#2
     SWI 4
      ADR R0, men
    SWI 3
    ADR R0, comma
     SWI 3

   MOV R0,#1
     SWI 4
     ADR R0, dog
    SWI 3
     ADR R0, comma
     SWI 3
     ADR R0, Spot
     SWI 3
       ADR R0, NEWLINE
    SWI 3


      ADR R0, Mow
     SWI 3
     ADR R0, meadow
     SWI 3
     SWI 2
