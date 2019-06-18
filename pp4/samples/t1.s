	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  main:
	# BeginFunc 24
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 24	# decrement sp to make space for locals/temps
	# _tmp0 = "hello"
	  .data			# create string constant marked with label
	  _string1: .asciiz "hello"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -16($fp)	# spill _tmp0 from $t2 to $fp-16
	# s = _tmp0
	  lw $t2, -16($fp)	# fill _tmp0 to $t2 from $fp-16
	  sw $t2, -12($fp)	# spill s from $t2 to $fp-12
	# _tmp1 = 4
	  li $t2, 4		# load constant value 4 into $t2
	  sw $t2, -20($fp)	# spill _tmp1 from $t2 to $fp-20
	# _tmp2 = 5
	  li $t2, 5		# load constant value 5 into $t2
	  sw $t2, -24($fp)	# spill _tmp2 from $t2 to $fp-24
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp2 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -20($fp)	# fill _tmp1 to $t0 from $fp-20
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp3 = LCall _test
	  jal _test          	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -28($fp)	# spill _tmp3 from $t2 to $fp-28
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# c = _tmp3
	  lw $t2, -28($fp)	# fill _tmp3 to $t2 from $fp-28
	  sw $t2, -8($fp)	# spill c from $t2 to $fp-8
	# PushParam c
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill c to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill s to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _test:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp4 = a + b
	  lw $t0, 4($fp)	# fill a to $t0 from $fp+4
	  lw $t1, 8($fp)	# fill b to $t1 from $fp+8
	  add $t2, $t0, $t1	
	  sw $t2, -8($fp)	# spill _tmp4 from $t2 to $fp-8
	# Return _tmp4
	  lw $t2, -8($fp)	# fill _tmp4 to $t2 from $fp-8
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# Alloc (BuiltIn)
  _Alloc:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 9	# set syscall code
	  lw $a0, 4($fp)	# load argument
	  sle $t0, $a0, 0	# compare size to zero
	  beqz $t0, _Alloc_syscall	# if size greater than zero, execute alloc
	  .data			# create string constant marked with label
	  bad_size: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  li $v0, 4		# set syscall code
	  la $a0, bad_size	# load address to string of runtime error
	  syscall		# execute syscall
	  li $v0, 10		# halt execution when runtime error occur
	  syscall		# execute syscall
  _Alloc_syscall:
	  addu $a0, $a0, 4	# add space for length storage
	  syscall		# execute syscall
	  subu $a0, $a0, 4	# compute bytes for array storage
	  sw $a0, 0($v0)	# store array length
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# ReadLine (BuiltIn)
  _ReadLine:
	  .data			# create buffer marked with label
	  buffer: .space 80
	  .text
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 8		# set syscall code
	  la $a0, buffer	# load byte space into address
	  li $a1, 80	# allot the byte space for string
	  syscall		# execute syscall
	  move $v0, $a0	# return address to buffer
  _ReadLine_loop:
	  lb $t0, 0($a0)		# load character from string
	  seq $t1, $t0, 10	# compare character to newline
	  bnez $t1, _ReadLine_done	# if equal to newline, loop done
	  addu $a0, $a0, 1	# increment pointer
	  b _ReadLine_loop		# unconditional branch
  _ReadLine_done:
	  sb $0, 0($a0)	# change newline to null
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# ReadInteger (BuiltIn)
  _ReadInteger:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 5		# set syscall code
	  syscall		# execute syscall
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# StringEqual (BuiltIn)
  _StringEqual:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  lw $t0, 4($fp)		# load string1
	  lw $t1, 8($fp)		# load string2
  _StringEqual_loop:
	  lb $t2, 0($t0)		# load character from string1
	  lb $t3, 0($t1)		# load character from string2
	  seq $v0, $t2, $t3	# compare characters
	  beqz $v0, _StringEqual_done	# if not equal, done
	  beqz $t2, _StringEqual_done	# if null, terminate
	  addu $t0, $t0, 1	# increment pointer1
	  addu $t1, $t1, 1	# increment pointer2
	  b _StringEqual_loop		# unconditional branch
  _StringEqual_done:
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# PrintInt (BuiltIn)
  _PrintInt:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 1		# set syscall code
	  lw $a0, 4($fp)	# load argument
	  syscall		# execute syscall
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# PrintString (BuiltIn)
  _PrintString:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 4		# set syscall code
	  lw $a0, 4($fp)	# load argument
	  syscall		# execute syscall
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# PrintBool (BuiltIn)
  _PrintBool:
	  .data			# create string constant marked with label
	  _string_true: .asciiz "true"
	  _string_false: .asciiz "false"
	  .text
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 4		# set syscall code
	  lw $t0, 4($fp)	# load argument
	  beqz $t0, _false	# test bool value
	  la $a0, _string_true	# print true
	  b _PrintBoolStr	# go on to call syscall
  _false:
	  la $a0, _string_false	# print false
  _PrintBoolStr:
	  syscall		# execute syscall
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Halt (BuiltIn)
  _Halt:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 10		# halt execution when runtime error occur
	  syscall		# execute syscall
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 24
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 24	# decrement sp to make space for locals/temps
	# _tmp0 = "hello"
	  .data			# create string constant marked with label
	  _string1: .asciiz "hello"
	  .text
	  la $t0, _string1	# load label
	# s = _tmp0
	  move $t1, $t0		# copy value
	# _tmp1 = 4
	  li $t2, 4		# load constant value 4 into $t2
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp2 = 5
	  li $t3, 5		# load constant value 5 into $t3
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp3 = LCall __test
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp0 from $t0 to $fp-16
	  sw $t1, -12($fp)	# spill s from $t1 to $fp-12
	  sw $t2, -20($fp)	# spill _tmp1 from $t2 to $fp-20
	  sw $t3, -24($fp)	# spill _tmp2 from $t3 to $fp-24
	  jal __test         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# c = _tmp3
	  move $t1, $t0		# copy value
	# PushParam c
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -28($fp)	# spill _tmp3 from $t0 to $fp-28
	  sw $t1, -8($fp)	# spill c from $t1 to $fp-8
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# load s from $fp-12 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  __test:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp4 = a + b
	  lw $t0, 8($fp)	# load a from $fp+8 into $t0
	  lw $t1, 4($fp)	# load b from $fp+4 into $t1
	  add $t2, $t0, $t1	
	# Return _tmp4
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# Alloc (BuiltIn)
  _Alloc:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 9	# set syscall code
	  lw $a0, 4($fp)	# load argument
	  sle $t0, $a0, 0	# compare size to zero
	  beqz $t0, _Alloc_syscall	# if size greater than zero, execute alloc
	  .data			# create string constant marked with label
	  bad_size: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  li $v0, 4		# set syscall code
	  la $a0, bad_size	# load address to string of runtime error
	  syscall		# execute syscall
	  li $v0, 10		# halt execution when runtime error occur
	  syscall		# execute syscall
  _Alloc_syscall:
	  addu $a0, $a0, 4	# add space for length storage
	  syscall		# execute syscall
	  subu $a0, $a0, 4	# compute bytes for array storage
	  sw $a0, 0($v0)	# store array length
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# ReadLine (BuiltIn)
  _ReadLine:
	  .data			# create buffer marked with label
	  buffer: .space 80
	  .text
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 8		# set syscall code
	  la $a0, buffer	# load byte space into address
	  li $a1, 80	# allot the byte space for string
	  syscall		# execute syscall
	  move $v0, $a0	# return address to buffer
  _ReadLine_loop:
	  lb $t0, 0($a0)		# load character from string
	  seq $t1, $t0, 10	# compare character to newline
	  bnez $t1, _ReadLine_done	# if equal to newline, loop done
	  addu $a0, $a0, 1	# increment pointer
	  b _ReadLine_loop		# unconditional branch
  _ReadLine_done:
	  sb $0, 0($a0)	# change newline to null
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# ReadInteger (BuiltIn)
  _ReadInteger:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 5		# set syscall code
	  syscall		# execute syscall
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# StringEqual (BuiltIn)
  _StringEqual:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  lw $t0, 4($fp)		# load string1
	  lw $t1, 8($fp)		# load string2
  _StringEqual_loop:
	  lb $t2, 0($t0)		# load character from string1
	  lb $t3, 0($t1)		# load character from string2
	  seq $v0, $t2, $t3	# compare characters
	  beqz $v0, _StringEqual_done	# if not equal, done
	  beqz $t2, _StringEqual_done	# if null, terminate
	  addu $t0, $t0, 1	# increment pointer1
	  addu $t1, $t1, 1	# increment pointer2
	  b _StringEqual_loop		# unconditional branch
  _StringEqual_done:
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# PrintInt (BuiltIn)
  _PrintInt:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 1		# set syscall code
	  lw $a0, 4($fp)	# load argument
	  syscall		# execute syscall
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# PrintString (BuiltIn)
  _PrintString:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 4		# set syscall code
	  lw $a0, 4($fp)	# load argument
	  syscall		# execute syscall
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# PrintBool (BuiltIn)
  _PrintBool:
	  .data			# create string constant marked with label
	  _string_true: .asciiz "true"
	  _string_false: .asciiz "false"
	  .text
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 4		# set syscall code
	  lw $t0, 4($fp)	# load argument
	  beqz $t0, _false	# test bool value
	  la $a0, _string_true	# print true
	  b _PrintBoolStr	# go on to call syscall
  _false:
	  la $a0, _string_false	# print false
  _PrintBoolStr:
	  syscall		# execute syscall
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Halt (BuiltIn)
  _Halt:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 10		# halt execution when runtime error occur
	  syscall		# execute syscall
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 24
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 24	# decrement sp to make space for locals/temps
	# _tmp0 = "hello"
	  .data			# create string constant marked with label
	  _string1: .asciiz "hello"
	  .text
	  la $t0, _string1	# load label
	# s = _tmp0
	  move $t1, $t0		# copy value
	# _tmp1 = 4
	  li $t2, 4		# load constant value 4 into $t2
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp2 = 5
	  li $t3, 5		# load constant value 5 into $t3
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp3 = LCall __test
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp0 from $t0 to $fp-16
	  sw $t1, -12($fp)	# spill s from $t1 to $fp-12
	  sw $t2, -20($fp)	# spill _tmp1 from $t2 to $fp-20
	  sw $t3, -24($fp)	# spill _tmp2 from $t3 to $fp-24
	  jal __test         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# c = _tmp3
	  move $t1, $t0		# copy value
	# PushParam c
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -28($fp)	# spill _tmp3 from $t0 to $fp-28
	  sw $t1, -8($fp)	# spill c from $t1 to $fp-8
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# load s from $fp-12 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  __test:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp4 = a + b
	  lw $t0, 8($fp)	# load a from $fp+8 into $t0
	  lw $t1, 4($fp)	# load b from $fp+4 into $t1
	  add $t2, $t0, $t1	
	# Return _tmp4
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
_PrintInt:
        subu $sp, $sp, 8
        sw $fp, 8($sp)
        sw $ra, 4($sp)
        addiu $fp, $sp, 8
        li   $v0, 1
        lw   $a0, 4($fp)
        syscall
        move $sp, $fp
        lw $ra, -4($fp)
        lw $fp, 0($fp)
        jr $ra
                                
_PrintString:
        subu $sp, $sp, 8
        sw $fp, 8($sp)
        sw $ra, 4($sp)
        addiu $fp, $sp, 8
        li   $v0, 4
        lw $a0, 4($fp)
        syscall
        move $sp, $fp
        lw $ra, -4($fp)
        lw $fp, 0($fp)
        jr $ra
        
_PrintBool:
	subu $sp, $sp, 8
	sw $fp, 8($sp)
	sw $ra, 4($sp)
        addiu $fp, $sp, 8
	lw $t1, 4($fp)
	blez $t1, fbr
	li   $v0, 4		# system call for print_str
	la   $a0, TRUE		# address of str to print
	syscall			
	b end
fbr:	li   $v0, 4		# system call for print_str
	la   $a0, FALSE		# address of str to print
	syscall				
end:	move $sp, $fp
	lw $ra, -4($fp)
	lw $fp, 0($fp)
	jr $ra

_Alloc:
        subu $sp, $sp, 8
        sw $fp, 8($sp)
        sw $ra, 4($sp)
        addiu $fp, $sp, 8
        li   $v0, 9
        lw $a0, 4($fp)
	syscall
        move $sp, $fp
        lw $ra, -4($fp)
        lw $fp, 0($fp) 
        jr $ra


_StringEqual:
	subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	sw $fp, 8($sp)        # save fp
	sw $ra, 4($sp)        # save ra
	addiu $fp, $sp, 8     # set up new fp
	subu $sp, $sp, 4      # decrement sp to make space for locals/temps

	li $v0,0

	#Determine length string 1
	lw $t0, 4($fp)       
	li $t3,0
bloop1: 
	lb $t5, ($t0) 
	beqz $t5, eloop1	
	addi $t0, 1
	addi $t3, 1
	b bloop1
eloop1:

	#Determine length string 2
	lw $t1, 8($fp)
	li $t4,0
bloop2: 
	lb $t5, ($t1) 
	beqz $t5, eloop2	
	addi $t1, 1
	addi $t4, 1
	b bloop2
eloop2:
	bne $t3,$t4,end1       #Check String Lengths Same

	lw $t0, 4($fp)       
	lw $t1, 8($fp)
	li $t3, 0     		
bloop3:	
	lb $t5, ($t0) 
	lb $t6, ($t1) 
	bne $t5, $t6, end1
	addi $t3, 1
	addi $t0, 1
	addi $t1, 1
	bne $t3,$t4,bloop3
eloop3:	li $v0,1

end1:	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra                # return from function

_Halt:
        li $v0, 10
        syscall

_ReadInteger:
	subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	sw $fp, 8($sp)        # save fp
	sw $ra, 4($sp)        # save ra
	addiu $fp, $sp, 8     # set up new fp
	subu $sp, $sp, 4      # decrement sp to make space for locals/temps
	li $v0, 5
	syscall
	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra
        

_ReadLine:
	subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	sw $fp, 8($sp)        # save fp
	sw $ra, 4($sp)        # save ra
	addiu $fp, $sp, 8     # set up new fp
	subu $sp, $sp, 4      # decrement sp to make space for locals/temps
	li $a1, 40
	la $a0, SPACE
	li $v0, 8
	syscall

	la $t1, SPACE
bloop4: 
	lb $t5, ($t1) 
	beqz $t5, eloop4	
	addi $t1, 1
	b bloop4
eloop4:
	addi $t1,-1
	li $t6,0
        sb $t6, ($t1)

	la $v0, SPACE
	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra
	

	.data
TRUE:.asciiz "true"
FALSE:.asciiz "false"
SPACE:.asciiz "Making Space For Inputed Values Is Fun."
