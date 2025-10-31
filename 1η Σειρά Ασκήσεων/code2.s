.data
x: .word 74 # el22674 -> last two digits = 74
.text
.globl main

main:
    lw  $a0, x        
    jal BitCount        
    move $a0, $v0
    li   $v0, 1          
    syscall
    li   $v0, 10         
    syscall
    
BitCount:
    andi $s0, $a0, 1
    addi $sp, $sp, -12
    sw   $ra, 0($sp)
    sw   $a0, 4($sp)
    sw   $s0, 8($sp)
    beq  $a0, $zero, return
    srl  $a0, $a0, 1      
    jal  BitCount
    lw   $s0, 8($sp)
    lw   $a0, 4($sp)
    lw   $ra, 0($sp)
    addi $sp, $sp, 12
    add  $v0, $v0, $s0     
    jr   $ra
    
return:
    add  $v0, $zero, $zero
    addi $sp, $sp, 12
    jr   $ra
