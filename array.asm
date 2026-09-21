
.ORIG x3000

; Set up the array
LEA R1, ARRAY
LD R2, SIZE

; Start the loop
LOOP
LEA R0, PROMPT
PUTS

; Get one digit from the user
GETC
OUT

; Convert ASCII to a number
LD R4, ASCII
NOT R4, R4
ADD R4, R4, #1
ADD R0, R0, R4

; Store number in array
STR R0, R1, #0

; Move to next array position
ADD R1, R1, #1

; Count down
ADD R2, R2, #-1
BRp LOOP

HALT

PROMPT .STRINGZ "Enter a number (0-9): "
ASCII .FILL x0030
SIZE .FILL #5
ARRAY .BLKW #5

.END