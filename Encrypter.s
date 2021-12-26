B main

msg		DEFB 	"Gentleman, ladies, may I have your attention please? Well, you've heard the backroom boys, "
		DEFB	"now it's about time for my turn. C Day, that is Computer Day, will be next Monday, July the 16th, "
		DEFB	"that is in four days time. Now on that date all the computer systems in this country, and subsequently "
		DEFB	"in the whole world will come under the control of this central computer which we call WOTAN.",0

encMsg	DEFB	31,46,37,44,40,51,59,46,61,44,52,37,124,47,37,47,40,57,49,47,124,61,46,57,124,62,61,47,57,56,124,51,50,124
		DEFB	49,61,40,52,57,49,61,40,53,63,61,48,124,44,46,51,62,48,57,49,47,124,47,51,124,63,51,49,44,48,57,36,124,40
		DEFB	52,57,37,124,63,61,50,50,51,40,124,62,57,124,47,51,48,42,57,56,124,43,53,40,52,51,41,40,124,61,124
		DEFB	55,57,37,114,0
		ALIGN

msgSize	DEFW	385
encSize	DEFW	103
encKey	DEFW	92
msgKey	DEFW	63


main    ADR R0, msg
		LDR R1, msgSize
		LDR R2, msgKey
		ADR R3,msg
;; Modify the above to use encMsg, encSize, and encKey to check whether your program decrypts correctly
;;; Insert the ARM code to call you crypt procedure here
; Print out the (en|de)cyrpted message
;; R0 <- address of message to encode
;; R1 <- size of message in bytes
;; R2 <- key (between 0 and 255)
BL crypt

 SWI 2

crypt
 LDRB R0,[R3],#1
 CMP R0,#0
 BEQ crypt
 CMP R0,R2
 BEQ crypt
 EOR R0,R0,R2
 SWI 0
SUB R1,R1,#1
CMP R1,#0
BNE crypt

MOV PC,R14
