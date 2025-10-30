min:
    lw   $t0, 0($a0) # minimum = array[0]
    li   $t1, 1 # i = 1

loop:
    bge  $t1, $a1, end # αν i >= size, τερματισμός
    sll  $t2, $t1, 2 # t2 = i * 4 (offset, επειδή int=4 bytes)
    add  $t3, $a0, $t2 # διεύθυνση array[i]
    lw   $t4, 0($t3) # t4 = array[i]
    blt  $t4, $t0, update # αν array[i] < minimum, πήγαινε στο update
    j    next

update:
    move $t0, $t4 # minimum = array[i]

next:
    addi $t1, $t1, 1 # i++
    j    loop

end:
    move $v0, $t0 # επιστροφή minimum
    jr   $ra # επιστροφή στον καλούντα
