global _start

section .data
    largestNum db 0  ; Variable to store the largest number
    largestInput db 0 ; Variable to store the corresponding input letter
    
section .text
    global _start

_start:
    ; Define fixed values A = 7, B = 15, C = 21
    mov al, 7
    mov bl, 15
    mov cl, 21

    ; Assume A is the largest
    mov [largestNum], al
    mov byte [largestInput], 'A'

    ; Compare with B
    cmp bl, al
    jbe check_C  ; If A >= B, skip updating
    mov [largestNum], bl
    mov byte [largestInput], 'B'

check_C:
    cmp cl, [largestNum]
    jbe exit_here ; If largestNum >= C, skip updating
    mov [largestNum], cl
    mov byte [largestInput], 'C'

exit_here:
    ; Exit program
    mov eax, 1   ; sys_exit
    xor ebx, ebx ; status 0
    int 0x80
