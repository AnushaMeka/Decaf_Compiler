	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _factorial:
	# BeginFunc 36
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 36	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -8($fp)	# spill _tmp0 from $t2 to $fp-8
	# _tmp1 = n < _tmp0
	  lw $t0, 4($fp)	# fill n to $t0 from $fp+4
	  lw $t1, -8($fp)	# fill _tmp0 to $t1 from $fp-8
	  slt $t2, $t0, $t1	
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	# _tmp2 = n == _tmp0
	  lw $t0, 4($fp)	# fill n to $t0 from $fp+4
	  lw $t1, -8($fp)	# fill _tmp0 to $t1 from $fp-8
	  seq $t2, $t0, $t1	
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	# _tmp3 = _tmp1 || _tmp2
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  lw $t1, -16($fp)	# fill _tmp2 to $t1 from $fp-16
	  or $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp3 from $t2 to $fp-20
	# IfZ _tmp3 Goto _L0
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
	  beqz $t0, _L0	# branch if _tmp3 is zero 
	# _tmp4 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -24($fp)	# spill _tmp4 from $t2 to $fp-24
	# Return _tmp4
	  lw $t2, -24($fp)	# fill _tmp4 to $t2 from $fp-24
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L0:
	# _tmp5 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	# _tmp6 = n - _tmp5
	  lw $t0, 4($fp)	# fill n to $t0 from $fp+4
	  lw $t1, -28($fp)	# fill _tmp5 to $t1 from $fp-28
	  sub $t2, $t0, $t1	
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp6 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp7 = LCall _factorial
	  jal _factorial     	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -36($fp)	# spill _tmp7 from $t2 to $fp-36
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp8 = n * _tmp7
	  lw $t0, 4($fp)	# fill n to $t0 from $fp+4
	  lw $t1, -36($fp)	# fill _tmp7 to $t1 from $fp-36
	  mul $t2, $t0, $t1	
	  sw $t2, -40($fp)	# spill _tmp8 from $t2 to $fp-40
	# Return _tmp8
	  lw $t2, -40($fp)	# fill _tmp8 to $t2 from $fp-40
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
	# BeginFunc 48
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 48	# decrement sp to make space for locals/temps
	# _tmp9 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -12($fp)	# spill _tmp9 from $t2 to $fp-12
	# n = _tmp9
	  lw $t2, -12($fp)	# fill _tmp9 to $t2 from $fp-12
	  sw $t2, -8($fp)	# spill n from $t2 to $fp-8
  _L1:
	# _tmp10 = 15
	  li $t2, 15		# load constant value 15 into $t2
	  sw $t2, -16($fp)	# spill _tmp10 from $t2 to $fp-16
	# _tmp11 = n < _tmp10
	  lw $t0, -8($fp)	# fill n to $t0 from $fp-8
	  lw $t1, -16($fp)	# fill _tmp10 to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	  sw $t2, -20($fp)	# spill _tmp11 from $t2 to $fp-20
	# _tmp12 = n == _tmp10
	  lw $t0, -8($fp)	# fill n to $t0 from $fp-8
	  lw $t1, -16($fp)	# fill _tmp10 to $t1 from $fp-16
	  seq $t2, $t0, $t1	
	  sw $t2, -24($fp)	# spill _tmp12 from $t2 to $fp-24
	# _tmp13 = _tmp11 || _tmp12
	  lw $t0, -20($fp)	# fill _tmp11 to $t0 from $fp-20
	  lw $t1, -24($fp)	# fill _tmp12 to $t1 from $fp-24
	  or $t2, $t0, $t1	
	  sw $t2, -28($fp)	# spill _tmp13 from $t2 to $fp-28
	# IfZ _tmp13 Goto _L2
	  lw $t0, -28($fp)	# fill _tmp13 to $t0 from $fp-28
	  beqz $t0, _L2	# branch if _tmp13 is zero 
	# _tmp14 = "Factorial("
	  .data			# create string constant marked with label
	  _string1: .asciiz "Factorial("
	  .text
	  la $t2, _string1	# load label
	  sw $t2, -32($fp)	# spill _tmp14 from $t2 to $fp-32
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -32($fp)	# fill _tmp14 to $t0 from $fp-32
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill n to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = ") = "
	  .data			# create string constant marked with label
	  _string2: .asciiz ") = "
	  .text
	  la $t2, _string2	# load label
	  sw $t2, -36($fp)	# spill _tmp15 from $t2 to $fp-36
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -36($fp)	# fill _tmp15 to $t0 from $fp-36
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill n to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp16 = LCall _factorial
	  jal _factorial     	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -40($fp)	# spill _tmp16 from $t2 to $fp-40
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -40($fp)	# fill _tmp16 to $t0 from $fp-40
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $t2, _string3	# load label
	  sw $t2, -44($fp)	# spill _tmp17 from $t2 to $fp-44
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -44($fp)	# fill _tmp17 to $t0 from $fp-44
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp18 = 1
	  li $t2, 1		# load constant value 1 into $t2
	  sw $t2, -48($fp)	# spill _tmp18 from $t2 to $fp-48
	# _tmp19 = n + _tmp18
	  lw $t0, -8($fp)	# fill n to $t0 from $fp-8
	  lw $t1, -48($fp)	# fill _tmp18 to $t1 from $fp-48
	  add $t2, $t0, $t1	
	  sw $t2, -52($fp)	# spill _tmp19 from $t2 to $fp-52
	# n = _tmp19
	  lw $t2, -52($fp)	# fill _tmp19 to $t2 from $fp-52
	  sw $t2, -8($fp)	# spill n from $t2 to $fp-8
	# Goto _L1
	  b _L1		# unconditional branch
  _L2:
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
  __factorial:
	# BeginFunc 36
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 36	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp1 = n < _tmp0
	  lw $t1, 4($fp)	# load n from $fp+4 into $t1
	  slt $t2, $t1, $t0	
	# _tmp2 = n == _tmp0
	  seq $t3, $t1, $t0	
	# _tmp3 = _tmp1 || _tmp2
	  or $t4, $t2, $t3	
	# IfZ _tmp3 Goto _L0
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp0 from $t0 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp2 from $t3 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp3 from $t4 to $fp-20
	  beqz $t4, _L0	# branch if _tmp3 is zero 
	# _tmp4 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# Return _tmp4
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L0:
	# _tmp5 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp6 = n - _tmp5
	  lw $t1, 4($fp)	# load n from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp7 = LCall __factorial
	# (save modified registers before flow of control change)
	  sw $t0, -28($fp)	# spill _tmp5 from $t0 to $fp-28
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	  jal __factorial    	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp8 = n * _tmp7
	  lw $t1, 4($fp)	# load n from $fp+4 into $t1
	  mul $t2, $t1, $t0	
	# Return _tmp8
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
	# BeginFunc 48
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 48	# decrement sp to make space for locals/temps
	# _tmp9 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# n = _tmp9
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp9 from $t0 to $fp-12
	  sw $t1, -8($fp)	# spill n from $t1 to $fp-8
  _L1:
	# _tmp10 = 15
	  li $t0, 15		# load constant value 15 into $t0
	# _tmp11 = n < _tmp10
	  lw $t1, -8($fp)	# load n from $fp-8 into $t1
	  slt $t2, $t1, $t0	
	# _tmp12 = n == _tmp10
	  seq $t3, $t1, $t0	
	# _tmp13 = _tmp11 || _tmp12
	  or $t4, $t2, $t3	
	# IfZ _tmp13 Goto _L2
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp10 from $t0 to $fp-16
	  sw $t2, -20($fp)	# spill _tmp11 from $t2 to $fp-20
	  sw $t3, -24($fp)	# spill _tmp12 from $t3 to $fp-24
	  sw $t4, -28($fp)	# spill _tmp13 from $t4 to $fp-28
	  beqz $t4, _L2	# branch if _tmp13 is zero 
	# _tmp14 = "Factorial("
	  .data			# create string constant marked with label
	  _string1: .asciiz "Factorial("
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -32($fp)	# spill _tmp14 from $t0 to $fp-32
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# load n from $fp-8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = ") = "
	  .data			# create string constant marked with label
	  _string2: .asciiz ") = "
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -36($fp)	# spill _tmp15 from $t0 to $fp-36
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# load n from $fp-8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp16 = LCall __factorial
	  jal __factorial    	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -40($fp)	# spill _tmp16 from $t0 to $fp-40
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -44($fp)	# spill _tmp17 from $t0 to $fp-44
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp18 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp19 = n + _tmp18
	  lw $t1, -8($fp)	# load n from $fp-8 into $t1
	  add $t2, $t1, $t0	
	# n = _tmp19
	  move $t1, $t2		# copy value
	# Goto _L1
	# (save modified registers before flow of control change)
	  sw $t0, -48($fp)	# spill _tmp18 from $t0 to $fp-48
	  sw $t1, -8($fp)	# spill n from $t1 to $fp-8
	  sw $t2, -52($fp)	# spill _tmp19 from $t2 to $fp-52
	  b _L1		# unconditional branch
  _L2:
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
  __factorial:
	# BeginFunc 36
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 36	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp1 = n < _tmp0
	  lw $t1, 4($fp)	# load n from $fp+4 into $t1
	  slt $t2, $t1, $t0	
	# _tmp2 = n == _tmp0
	  seq $t3, $t1, $t0	
	# _tmp3 = _tmp1 || _tmp2
	  or $t4, $t2, $t3	
	# IfZ _tmp3 Goto _L0
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp0 from $t0 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp2 from $t3 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp3 from $t4 to $fp-20
	  beqz $t4, _L0	# branch if _tmp3 is zero 
	# _tmp4 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# Return _tmp4
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L0:
	# _tmp5 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp6 = n - _tmp5
	  lw $t1, 4($fp)	# load n from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp7 = LCall __factorial
	# (save modified registers before flow of control change)
	  sw $t0, -28($fp)	# spill _tmp5 from $t0 to $fp-28
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	  jal __factorial    	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp8 = n * _tmp7
	  lw $t1, 4($fp)	# load n from $fp+4 into $t1
	  mul $t2, $t1, $t0	
	# Return _tmp8
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
	# BeginFunc 48
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 48	# decrement sp to make space for locals/temps
	# _tmp9 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# n = _tmp9
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp9 from $t0 to $fp-12
	  sw $t1, -8($fp)	# spill n from $t1 to $fp-8
  _L1:
	# _tmp10 = 15
	  li $t0, 15		# load constant value 15 into $t0
	# _tmp11 = n < _tmp10
	  lw $t1, -8($fp)	# load n from $fp-8 into $t1
	  slt $t2, $t1, $t0	
	# _tmp12 = n == _tmp10
	  seq $t3, $t1, $t0	
	# _tmp13 = _tmp11 || _tmp12
	  or $t4, $t2, $t3	
	# IfZ _tmp13 Goto _L2
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp10 from $t0 to $fp-16
	  sw $t2, -20($fp)	# spill _tmp11 from $t2 to $fp-20
	  sw $t3, -24($fp)	# spill _tmp12 from $t3 to $fp-24
	  sw $t4, -28($fp)	# spill _tmp13 from $t4 to $fp-28
	  beqz $t4, _L2	# branch if _tmp13 is zero 
	# _tmp14 = "Factorial("
	  .data			# create string constant marked with label
	  _string1: .asciiz "Factorial("
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -32($fp)	# spill _tmp14 from $t0 to $fp-32
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# load n from $fp-8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = ") = "
	  .data			# create string constant marked with label
	  _string2: .asciiz ") = "
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -36($fp)	# spill _tmp15 from $t0 to $fp-36
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# load n from $fp-8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp16 = LCall __factorial
	  jal __factorial    	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -40($fp)	# spill _tmp16 from $t0 to $fp-40
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -44($fp)	# spill _tmp17 from $t0 to $fp-44
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp18 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp19 = n + _tmp18
	  lw $t1, -8($fp)	# load n from $fp-8 into $t1
	  add $t2, $t1, $t0	
	# n = _tmp19
	  move $t1, $t2		# copy value
	# Goto _L1
	# (save modified registers before flow of control change)
	  sw $t0, -48($fp)	# spill _tmp18 from $t0 to $fp-48
	  sw $t1, -8($fp)	# spill n from $t1 to $fp-8
	  sw $t2, -52($fp)	# spill _tmp19 from $t2 to $fp-52
	  b _L1		# unconditional branch
  _L2:
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
  __factorial:
	# BeginFunc 36
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 36	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp1 = n < _tmp0
	  lw $t1, 4($fp)	# load n from $fp+4 into $t1
	  slt $t2, $t1, $t0	
	# _tmp2 = n == _tmp0
	  seq $t3, $t1, $t0	
	# _tmp3 = _tmp1 || _tmp2
	  or $t4, $t2, $t3	
	# IfZ _tmp3 Goto _L0
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp0 from $t0 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp2 from $t3 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp3 from $t4 to $fp-20
	  beqz $t4, _L0	# branch if _tmp3 is zero 
	# _tmp4 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# Return _tmp4
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L0:
	# _tmp5 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp6 = n - _tmp5
	  lw $t1, 4($fp)	# load n from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# PushParam _tmp6
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp7 = LCall __factorial
	# (save modified registers before flow of control change)
	  sw $t0, -28($fp)	# spill _tmp5 from $t0 to $fp-28
	  sw $t2, -32($fp)	# spill _tmp6 from $t2 to $fp-32
	  jal __factorial    	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp8 = n * _tmp7
	  lw $t1, 4($fp)	# load n from $fp+4 into $t1
	  mul $t2, $t1, $t0	
	# Return _tmp8
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
	# BeginFunc 48
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 48	# decrement sp to make space for locals/temps
	# _tmp9 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# n = _tmp9
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp9 from $t0 to $fp-12
	  sw $t1, -8($fp)	# spill n from $t1 to $fp-8
  _L1:
	# _tmp10 = 15
	  li $t0, 15		# load constant value 15 into $t0
	# _tmp11 = n < _tmp10
	  lw $t1, -8($fp)	# load n from $fp-8 into $t1
	  slt $t2, $t1, $t0	
	# _tmp12 = n == _tmp10
	  seq $t3, $t1, $t0	
	# _tmp13 = _tmp11 || _tmp12
	  or $t4, $t2, $t3	
	# IfZ _tmp13 Goto _L2
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp10 from $t0 to $fp-16
	  sw $t2, -20($fp)	# spill _tmp11 from $t2 to $fp-20
	  sw $t3, -24($fp)	# spill _tmp12 from $t3 to $fp-24
	  sw $t4, -28($fp)	# spill _tmp13 from $t4 to $fp-28
	  beqz $t4, _L2	# branch if _tmp13 is zero 
	# _tmp14 = "Factorial("
	  .data			# create string constant marked with label
	  _string1: .asciiz "Factorial("
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -32($fp)	# spill _tmp14 from $t0 to $fp-32
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# load n from $fp-8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = ") = "
	  .data			# create string constant marked with label
	  _string2: .asciiz ") = "
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -36($fp)	# spill _tmp15 from $t0 to $fp-36
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# load n from $fp-8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp16 = LCall __factorial
	  jal __factorial    	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -40($fp)	# spill _tmp16 from $t0 to $fp-40
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp17
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -44($fp)	# spill _tmp17 from $t0 to $fp-44
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp18 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp19 = n + _tmp18
	  lw $t1, -8($fp)	# load n from $fp-8 into $t1
	  add $t2, $t1, $t0	
	# n = _tmp19
	  move $t1, $t2		# copy value
	# Goto _L1
	# (save modified registers before flow of control change)
	  sw $t0, -48($fp)	# spill _tmp18 from $t0 to $fp-48
	  sw $t1, -8($fp)	# spill n from $t1 to $fp-8
	  sw $t2, -52($fp)	# spill _tmp19 from $t2 to $fp-52
	  b _L1		# unconditional branch
  _L2:
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
