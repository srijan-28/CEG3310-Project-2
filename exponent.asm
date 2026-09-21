
.ORIG x3000

; Load x and y from memory
LD R0, X
LD R1, Y

; Start with result = 1
AND R3, R3, #0
ADD R3, R3, #1

; Check if exponent is zero
ADD R1, R1, #0
BRz DONE

; Outer loop for exponent
OUTER
AND R4, R4, #0
ADD R4, R0, #0

AND R5, R5, #0

; Multiply using repeated addition
INNER
ADD R4, R4, #0
BRz MULTDONE

ADD R5, R5, R3
ADD R4, R4, #-1
BRnzp INNER

MULTDONE
ADD R3, R5, #0

ADD R1, R1, #-1
BRp OUTER

; Store result at x8000
DONE
LD R6, ADDRESS
STR R3, R6, #0
HALT

X .FILL #2
Y .FILL #3
ADDRESS .FILL x8000

.END