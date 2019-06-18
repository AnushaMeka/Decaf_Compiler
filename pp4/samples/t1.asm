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
