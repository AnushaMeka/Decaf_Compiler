	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _foo:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# IfZ c Goto _L0
	  lw $t0, 8($fp)	# fill c to $t0 from $fp+8
	  beqz $t0, _L0	# branch if c is zero 
	# _tmp0 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = a + _tmp0
	  lw $t0, 4($fp)	# fill a to $t0 from $fp+4
	  lw $t1, -8($fp)	# fill _tmp0 to $t1 from $fp-8
	  add $t2, $t0, $t1	
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# Return _tmp1
	  lw $t2, -12($fp)	# fill _tmp1 to $t2 from $fp-12
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L1
	  b _L1		# unconditional branch
  _L0:
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# fill a to $t0 from $fp+4
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = " wacky.\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz " wacky.\n"
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L1:
	# _tmp3 = 18
	  li $t2, 18		# load constant value 18 into $t2
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# Return _tmp3
	  lw $t2, -20($fp)	# fill _tmp3 to $t2 from $fp-20
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
  main:
	# BeginFunc 84
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp4 = 10
	  li $t2, 10		# load constant value 10 into $t2
	  sw $t2, -12($fp)	# spill _tmp4 from $t2 to $fp-12
	# a = _tmp4
	  lw $t2, -12($fp)	# fill _tmp4 to $t2 from $fp-12
	  sw $t2, 0($gp)	# spill a from $t2 to $gp+0
	# _tmp5 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -16($fp)	# spill _tmp5 from $t2 to $fp-16
	# _tmp6 = a / _tmp5
	  lw $t0, 0($gp)	# fill a to $t0 from $gp+0
	  lw $t1, -16($fp)	# fill _tmp5 to $t1 from $fp-16
	  div $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp6 from $t2 to $fp-20
	# b = _tmp6
	  lw $t2, -20($fp)	# fill _tmp6 to $t2 from $fp-20
	  sw $t2, -8($fp)	# spill b from $t2 to $fp-8
	# _tmp7 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -24($fp)	# spill _tmp7 from $t2 to $fp-24
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -24($fp)	# fill _tmp7 to $t0 from $fp-24
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 0($gp)	# fill a to $t0 from $gp+0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _foo
	  jal _foo           	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -28($fp)	# spill _tmp8 from $t2 to $fp-28
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp9 = 2
	  li $t2, 2		# load constant value 2 into $t2
	  sw $t2, -32($fp)	# spill _tmp9 from $t2 to $fp-32
	# _tmp10 = b + _tmp9
	  lw $t0, -8($fp)	# fill b to $t0 from $fp-8
	  lw $t1, -32($fp)	# fill _tmp9 to $t1 from $fp-32
	  add $t2, $t0, $t1	
	  sw $t2, -36($fp)	# spill _tmp10 from $t2 to $fp-36
	# _tmp11 = a < b
	  lw $t0, 0($gp)	# fill a to $t0 from $gp+0
	  lw $t1, -8($fp)	# fill b to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp11 from $t2 to $fp-40
	# _tmp12 = a == b
	  lw $t0, 0($gp)	# fill a to $t0 from $gp+0
	  lw $t1, -8($fp)	# fill b to $t1 from $fp-8
	  seq $t2, $t0, $t1	
	  sw $t2, -44($fp)	# spill _tmp12 from $t2 to $fp-44
	# _tmp13 = _tmp11 || _tmp12
	  lw $t0, -40($fp)	# fill _tmp11 to $t0 from $fp-40
	  lw $t1, -44($fp)	# fill _tmp12 to $t1 from $fp-44
	  or $t2, $t0, $t1	
	  sw $t2, -48($fp)	# spill _tmp13 from $t2 to $fp-48
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -48($fp)	# fill _tmp13 to $t0 from $fp-48
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -36($fp)	# fill _tmp10 to $t0 from $fp-36
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp14 = LCall _foo
	  jal _foo           	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -52($fp)	# spill _tmp14 from $t2 to $fp-52
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp15 = 3
	  li $t2, 3		# load constant value 3 into $t2
	  sw $t2, -56($fp)	# spill _tmp15 from $t2 to $fp-56
	# _tmp16 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -60($fp)	# spill _tmp16 from $t2 to $fp-60
	# _tmp17 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -64($fp)	# spill _tmp17 from $t2 to $fp-64
	# _tmp18 = _tmp16 && _tmp17
	  lw $t0, -60($fp)	# fill _tmp16 to $t0 from $fp-60
	  lw $t1, -64($fp)	# fill _tmp17 to $t1 from $fp-64
	  and $t2, $t0, $t1	
	  sw $t2, -68($fp)	# spill _tmp18 from $t2 to $fp-68
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -68($fp)	# fill _tmp18 to $t0 from $fp-68
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -56($fp)	# fill _tmp15 to $t0 from $fp-56
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp19 = LCall _foo
	  jal _foo           	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -72($fp)	# spill _tmp19 from $t2 to $fp-72
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp20 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -76($fp)	# spill _tmp20 from $t2 to $fp-76
	# _tmp21 = 0
	  li $t2, 0		# load constant value 0 into $t2
	  sw $t2, -80($fp)	# spill _tmp21 from $t2 to $fp-80
	# _tmp22 = _tmp20 == _tmp21
	  lw $t0, -76($fp)	# fill _tmp20 to $t0 from $fp-76
	  lw $t1, -80($fp)	# fill _tmp21 to $t1 from $fp-80
	  seq $t2, $t0, $t1	
	  sw $t2, -84($fp)	# spill _tmp22 from $t2 to $fp-84
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -84($fp)	# fill _tmp22 to $t0 from $fp-84
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -72($fp)	# fill _tmp19 to $t0 from $fp-72
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp23 = LCall _foo
	  jal _foo           	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -88($fp)	# spill _tmp23 from $t2 to $fp-88
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
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
  __foo:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# IfZ c Goto _L1
	  lw $t0, 4($fp)	# load c from $fp+4 into $t0
	  beqz $t0, _L1	# branch if c is zero 
	# _tmp0 = 2
	  li $t0, 2		# load constant value 2 into $t0
	# _tmp1 = a + _tmp0
	  lw $t1, 8($fp)	# load a from $fp+8 into $t1
	  add $t2, $t1, $t0	
	# Return _tmp1
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L0
	  b _L0		# unconditional branch
  _L1:
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# load a from $fp+8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = " wacky.\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz " wacky.\n"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp2 from $t0 to $fp-16
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L0:
	# _tmp3 = 18
	  li $t0, 18		# load constant value 18 into $t0
	# Return _tmp3
	  move $v0, $t0		# assign return value into $v0
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
  main:
	# BeginFunc 88
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 88	# decrement sp to make space for locals/temps
	# _tmp4 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# a = _tmp4
	  move $t1, $t0		# copy value
	# _tmp5 = 2
	  li $t2, 2		# load constant value 2 into $t2
	# _tmp6 = a / _tmp5
	  div $t3, $t1, $t2	
	# b = _tmp6
	  move $t4, $t3		# copy value
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp7 = 1
	  li $t5, 1		# load constant value 1 into $t5
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# _tmp8 = LCall __foo
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp4 from $t0 to $fp-12
	  sw $t1, 0($gp)	# spill a from $t1 to $gp+0
	  sw $t2, -16($fp)	# spill _tmp5 from $t2 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp6 from $t3 to $fp-20
	  sw $t4, -8($fp)	# spill b from $t4 to $fp-8
	  sw $t5, -24($fp)	# spill _tmp7 from $t5 to $fp-24
	  jal __foo          	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp9 = 2
	  li $t1, 2		# load constant value 2 into $t1
	# _tmp10 = b + _tmp9
	  lw $t2, -8($fp)	# load b from $fp-8 into $t2
	  add $t3, $t2, $t1	
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp11 = a < b
	  lw $t4, 0($gp)	# load a from $gp+0 into $t4
	  slt $t5, $t4, $t2	
	# _tmp12 = a == b
	  seq $t6, $t4, $t2	
	# _tmp13 = _tmp11 || _tmp12
	  or $t7, $t5, $t6	
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# _tmp14 = LCall __foo
	# (save modified registers before flow of control change)
	  sw $t0, -28($fp)	# spill _tmp8 from $t0 to $fp-28
	  sw $t1, -32($fp)	# spill _tmp9 from $t1 to $fp-32
	  sw $t3, -36($fp)	# spill _tmp10 from $t3 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp11 from $t5 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp12 from $t6 to $fp-44
	  sw $t7, -48($fp)	# spill _tmp13 from $t7 to $fp-48
	  jal __foo          	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp15 = 3
	  li $t1, 3		# load constant value 3 into $t1
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp16 = 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp17 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp18 = _tmp16 && _tmp17
	  and $t4, $t2, $t3	
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp19 = LCall __foo
	# (save modified registers before flow of control change)
	  sw $t0, -52($fp)	# spill _tmp14 from $t0 to $fp-52
	  sw $t1, -56($fp)	# spill _tmp15 from $t1 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp16 from $t2 to $fp-60
	  sw $t3, -64($fp)	# spill _tmp17 from $t3 to $fp-64
	  sw $t4, -68($fp)	# spill _tmp18 from $t4 to $fp-68
	  jal __foo          	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp21 = 1
	  li $t1, 1		# load constant value 1 into $t1
	# IfZ _tmp21 Goto _L3
	# (save modified registers before flow of control change)
	  sw $t0, -72($fp)	# spill _tmp19 from $t0 to $fp-72
	  sw $t1, -80($fp)	# spill _tmp21 from $t1 to $fp-80
	  beqz $t1, _L3	# branch if _tmp21 is zero 
	# _tmp22 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp20 = _tmp22
	  move $t1, $t0		# copy value
	# Goto _L2
	# (save modified registers before flow of control change)
	  sw $t0, -84($fp)	# spill _tmp22 from $t0 to $fp-84
	  sw $t1, -76($fp)	# spill _tmp20 from $t1 to $fp-76
	  b _L2		# unconditional branch
  _L3:
	# _tmp23 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp20 = _tmp23
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -88($fp)	# spill _tmp23 from $t0 to $fp-88
	  sw $t1, -76($fp)	# spill _tmp20 from $t1 to $fp-76
  _L2:
	# PushParam _tmp20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# load _tmp20 from $fp-76 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp24 = LCall __foo
	  jal __foo          	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
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
  __foo:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# IfZ c Goto _L1
	  lw $t0, 4($fp)	# load c from $fp+4 into $t0
	  beqz $t0, _L1	# branch if c is zero 
	# _tmp0 = 2
	  li $t0, 2		# load constant value 2 into $t0
	# _tmp1 = a + _tmp0
	  lw $t1, 8($fp)	# load a from $fp+8 into $t1
	  add $t2, $t1, $t0	
	# Return _tmp1
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L0
	  b _L0		# unconditional branch
  _L1:
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# load a from $fp+8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = " wacky.\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz " wacky.\n"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp2
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp2 from $t0 to $fp-16
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L0:
	# _tmp3 = 18
	  li $t0, 18		# load constant value 18 into $t0
	# Return _tmp3
	  move $v0, $t0		# assign return value into $v0
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
  main:
	# BeginFunc 88
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 88	# decrement sp to make space for locals/temps
	# _tmp4 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# a = _tmp4
	  move $t1, $t0		# copy value
	# _tmp5 = 2
	  li $t2, 2		# load constant value 2 into $t2
	# _tmp6 = a / _tmp5
	  div $t3, $t1, $t2	
	# b = _tmp6
	  move $t4, $t3		# copy value
	# PushParam a
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp7 = 1
	  li $t5, 1		# load constant value 1 into $t5
	# PushParam _tmp7
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# _tmp8 = LCall __foo
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp4 from $t0 to $fp-12
	  sw $t1, 0($gp)	# spill a from $t1 to $gp+0
	  sw $t2, -16($fp)	# spill _tmp5 from $t2 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp6 from $t3 to $fp-20
	  sw $t4, -8($fp)	# spill b from $t4 to $fp-8
	  sw $t5, -24($fp)	# spill _tmp7 from $t5 to $fp-24
	  jal __foo          	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp9 = 2
	  li $t1, 2		# load constant value 2 into $t1
	# _tmp10 = b + _tmp9
	  lw $t2, -8($fp)	# load b from $fp-8 into $t2
	  add $t3, $t2, $t1	
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp11 = a < b
	  lw $t4, 0($gp)	# load a from $gp+0 into $t4
	  slt $t5, $t4, $t2	
	# _tmp12 = a == b
	  seq $t6, $t4, $t2	
	# _tmp13 = _tmp11 || _tmp12
	  or $t7, $t5, $t6	
	# PushParam _tmp13
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# _tmp14 = LCall __foo
	# (save modified registers before flow of control change)
	  sw $t0, -28($fp)	# spill _tmp8 from $t0 to $fp-28
	  sw $t1, -32($fp)	# spill _tmp9 from $t1 to $fp-32
	  sw $t3, -36($fp)	# spill _tmp10 from $t3 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp11 from $t5 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp12 from $t6 to $fp-44
	  sw $t7, -48($fp)	# spill _tmp13 from $t7 to $fp-48
	  jal __foo          	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp15 = 3
	  li $t1, 3		# load constant value 3 into $t1
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp16 = 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp17 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp18 = _tmp16 && _tmp17
	  and $t4, $t2, $t3	
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp19 = LCall __foo
	# (save modified registers before flow of control change)
	  sw $t0, -52($fp)	# spill _tmp14 from $t0 to $fp-52
	  sw $t1, -56($fp)	# spill _tmp15 from $t1 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp16 from $t2 to $fp-60
	  sw $t3, -64($fp)	# spill _tmp17 from $t3 to $fp-64
	  sw $t4, -68($fp)	# spill _tmp18 from $t4 to $fp-68
	  jal __foo          	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# PushParam _tmp19
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp21 = 1
	  li $t1, 1		# load constant value 1 into $t1
	# IfZ _tmp21 Goto _L3
	# (save modified registers before flow of control change)
	  sw $t0, -72($fp)	# spill _tmp19 from $t0 to $fp-72
	  sw $t1, -80($fp)	# spill _tmp21 from $t1 to $fp-80
	  beqz $t1, _L3	# branch if _tmp21 is zero 
	# _tmp22 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp20 = _tmp22
	  move $t1, $t0		# copy value
	# Goto _L2
	# (save modified registers before flow of control change)
	  sw $t0, -84($fp)	# spill _tmp22 from $t0 to $fp-84
	  sw $t1, -76($fp)	# spill _tmp20 from $t1 to $fp-76
	  b _L2		# unconditional branch
  _L3:
	# _tmp23 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp20 = _tmp23
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -88($fp)	# spill _tmp23 from $t0 to $fp-88
	  sw $t1, -76($fp)	# spill _tmp20 from $t1 to $fp-76
  _L2:
	# PushParam _tmp20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -76($fp)	# load _tmp20 from $fp-76 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp24 = LCall __foo
	  jal __foo          	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
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
