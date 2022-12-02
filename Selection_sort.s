#selection srt
.data
arr: .word -1,3,4096,16,256

.text
main:
        la x3, arr #base address
        addi x5, x0, 0 #int i

Loop1: 
       #outer loop
       # get the mid_id
        addi x7, x5, 0
        #for loop j = i + 1
        addi x6, x5, 1

Loop2:
        #inner loop
        #get arr[j] address offset and address
        slli x29, x6, 2
        add x13, x3, x29
        lw x10, 0(x13)
        #get arr[id] address offset and address
        slli x30, x7, 2
        add x14, x3, x30
        lw x11, 0(x14)
        #check if condition x10 = arr[j] ; x11 = arr[id]
        bge x10, x11, nochange
        addi x7, x6, 0
nochange:
        #j++
        addi x6, x6, 1
        addi x19, x0, 5
        blt x6, x19, Loop2
        #get arr[i] address offset and address
        slli x28, x5, 2
        add x12, x3, x28
        #get arr[mid_id] address offset and address
        slli x30, x7, 2
        add x14, x3, x30
        # temp = arr[i]
        lw x10, 0(x12)
        # arr[i] = arr[mid_id]
        lw x11, 0(x14)
        sw x11, 0(x12)
        # arr[mid_id] = temp
        sw x10, 0(x14)
        #i++
        addi x5, x5, 1
        addi x18, x0, 4
        blt x5, x18, Loop1