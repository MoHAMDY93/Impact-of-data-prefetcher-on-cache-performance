gcc2_compiled.:
___gnu_compiled_c:
.text
	.align 4
	.proc	0110
_label_rtx:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ldub [%i0+12],%o0
	cmp %o0,40
	be,a L2
	ld [%i0+64],%o0
	call _abort,0
	nop
L2:
	cmp %o0,0
	bne,a L4
	ld [%i0+64],%i0
	call _gen_label_rtx,0
	nop
	st %o0,[%i0+64]
	mov %o0,%i0
L4:
	ret
	restore
	.align 4
	.global _emit_jump
	.proc	020
_emit_jump:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _do_pending_stack_adjust,0
	nop
	call _gen_jump,0
	mov %i0,%o0
	call _emit_jump_insn,0
	nop
	call _emit_barrier,0
	nop
	ret
	restore
	.align 4
	.global _expand_label
	.proc	020
_expand_label:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _do_pending_stack_adjust,0
	sethi %hi(_stack_block_stack),%l0
	call _label_rtx,0
	mov %i0,%o0
	call _emit_label,0
	nop
	ld [%l0+%lo(_stack_block_stack)],%o0
	cmp %o0,0
	be L7
	nop
	call _oballoc,0
	mov 8,%o0
	ld [%l0+%lo(_stack_block_stack)],%o2
	ld [%o2+36],%o1
	st %o1,[%o0]
	st %o0,[%o2+36]
	st %i0,[%o0+4]
L7:
	ret
	restore
	.align 4
	.global _expand_goto
	.proc	020
_expand_goto:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _label_rtx,0
	mov %i0,%o0
	mov %o0,%o1
	mov %i0,%o0
	call _expand_goto_internal,0
	mov 0,%o2
	ret
	restore
	.align 8
LC0:
	.ascii "jump to `%s' invalidly jumps into binding contour\0"
	.align 4
	.proc	020
_expand_goto_internal:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov %i2,%o2
	lduh [%i1],%o0
	cmp %o0,17
	be L10
	mov 0,%l0
	call _abort,0
	nop
L10:
	ld [%i1+8],%o0
	cmp %o0,0
	be L11
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%i2
	cmp %i2,0
	be L24
	cmp %l0,0
	ld [%i2+20],%o0
L26:
	ld [%o0+4],%o1
	ld [%i1+4],%o0
	cmp %o1,%o0
	bl L24
	cmp %l0,0
	ld [%i2+16],%o0
	cmp %o0,0
	bne,a L16
	mov %o0,%l0
L16:
	ld [%i2+28],%o0
	cmp %o0,0
	be,a L25
	ld [%i2+4],%i2
	call _expand_cleanups,0
	mov 0,%o1
	ld [%i2+4],%i2
L25:
	cmp %i2,0
	bne,a L26
	ld [%i2+20],%o0
	cmp %l0,0
L24:
	be L19
	sethi %hi(_stack_pointer_rtx),%o0
	ld [%o0+%lo(_stack_pointer_rtx)],%o0
	call _emit_move_insn,0
	mov %l0,%o1
L19:
	cmp %i0,0
	be L21
	sethi %hi(524288),%o0
	ld [%i0+12],%o1
	andcc %o1,%o0,%g0
	be L21
	sethi %hi(LC0),%o0
	ld [%i0+36],%o1
	or %o0,%lo(LC0),%o0
	call _error,0
	ld [%o1+20],%o1
	b,a L21
L11:
	mov %i0,%o0
	call _expand_fixup,0
	mov %i1,%o1
	cmp %o0,0
	bne L21
	cmp %i0,0
	be L21
	sethi %hi(16384),%o1
	ld [%i0+12],%o0
	or %o0,%o1,%o0
	st %o0,[%i0+12]
L21:
	call _emit_jump,0
	mov %i1,%o0
	ret
	restore
	.align 4
	.proc	04
_expand_fixup:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_cond_stack),%o0
	ld [%o0+%lo(_cond_stack)],%o1
	cmp %o1,0
	be L28
	mov %i0,%l1
	ld [%o1+16],%o0
	cmp %i1,%o0
	be L58
	sethi %hi(_cond_stack),%o0
	ld [%o1+20],%o0
	cmp %i1,%o0
	bne L59
	sethi %hi(_loop_stack),%o0
	sethi %hi(_cond_stack),%o0
L58:
	b L30
	ld [%o0+%lo(_cond_stack)],%o2
L28:
	sethi %hi(_loop_stack),%o0
L59:
	ld [%o0+%lo(_loop_stack)],%o1
	cmp %o1,0
	be L30
	mov 0,%o2
	ld [%o1+16],%o0
	cmp %i1,%o0
	be L60
	sethi %hi(_loop_stack),%o0
	ld [%o1+20],%o0
	cmp %i1,%o0
	be L60
	sethi %hi(_loop_stack),%o0
	ld [%o1+24],%o0
	cmp %i1,%o0
	bne L61
	cmp %o2,0
	sethi %hi(_loop_stack),%o0
L60:
	ld [%o0+%lo(_loop_stack)],%o2
L30:
	cmp %o2,0
L61:
	be L34
	sethi %hi(_block_stack),%o0
	ld [%o2],%o1
	ld [%o0+%lo(_block_stack)],%i0
L37:
	cmp %o1,0
	be L36
	cmp %o1,%i0
	bne,a L37
	ld [%o1],%o1
L36:
	cmp %o1,0
	be L38
	sethi %hi(_block_stack),%o0
	b L56
	mov 0,%i0
L38:
	ld [%o0+%lo(_block_stack)],%o0
	mov %o0,%i0
	cmp %i0,%o2
	be L40
	ld [%o0+4],%o1
	cmp %i0,%o1
L62:
	be,a L41
	ld [%i0+4],%o1
L41:
	ld [%i0],%i0
	cmp %i0,%o2
	bne L62
	cmp %i0,%o1
L40:
	mov %o1,%o2
L34:
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%i0
	cmp %i0,%o2
	be L65
	subcc %g0,%i0,%g0
	ld [%i0+16],%o0
L64:
	cmp %o0,0
	bne L63
	cmp %i0,%o2
	ld [%i0+28],%o0
	cmp %o0,0
	bne L63
	cmp %i0,%o2
	ld [%i0+4],%i0
	cmp %i0,%o2
	bne,a L64
	ld [%i0+16],%o0
	cmp %i0,%o2
L63:
	be L65
	subcc %g0,%i0,%g0
	call _oballoc,0
	mov 24,%o0
	call _do_pending_stack_adjust,0
	mov %o0,%l0
	cmp %i2,0
	be L51
	nop
	b L52
	st %i2,[%l0+4]
L51:
	call _get_last_insn,0
	nop
	st %o0,[%l0+4]
L52:
	st %l1,[%l0+8]
	st %i1,[%l0+12]
	st %g0,[%l0+16]
	ld [%i0+32],%o0
	cmp %o0,0
	bne L66
	mov 0,%o0
	ld [%i0+28],%o0
	cmp %o0,0
	be L53
	mov 0,%o0
L66:
	ld [%i0+28],%o1
	call _tree_cons,0
	ld [%i0+32],%o2
	b L67
	st %o0,[%l0+20]
L53:
	st %o0,[%l0+20]
L67:
	sethi %hi(_goto_fixup_chain),%o1
	ld [%o1+%lo(_goto_fixup_chain)],%o0
	st %o0,[%l0]
	st %l0,[%o1+%lo(_goto_fixup_chain)]
	subcc %g0,%i0,%g0
L65:
	addx %g0,0,%i0
L56:
	ret
	restore
	.align 8
LC1:
	.ascii "label `%s' used before containing binding contour\0"
	.align 4
	.proc	020
_fixup_gotos:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_goto_fixup_chain),%o0
	ld [%o0+%lo(_goto_fixup_chain)],%l1
	cmp %l1,0
	be L70
	mov 0,%o1
	sethi %hi(16384),%l2
	ld [%l1+4],%o0
L103:
	cmp %o0,0
	bne,a L72
	ld [%l1+12],%o0
	cmp %o1,0
	be,a L94
	mov %l1,%o1
	ld [%l1],%o0
	b L71
	st %o0,[%o1]
L72:
	ld [%o0+8],%o0
	cmp %o0,0
	be L75
	cmp %i0,0
	ld [%l1+8],%o0
	cmp %o0,0
	be L76
	cmp %i4,0
	bne,a L95
	ld [%l1+4],%o0
	cmp %i1,0
	bne,a L95
	ld [%l1+4],%o0
	cmp %i2,0
	be,a L96
	ld [%l1+20],%o0
	ld [%l1+4],%o0
L95:
	ld [%i3+4],%o1
	ld [%o0+4],%o0
	cmp %o1,%o0
	ble,a L96
	ld [%l1+20],%o0
	ld [%l1+8],%o1
	ld [%o1+12],%o0
	andcc %o0,%l2,%g0
	bne,a L96
	ld [%l1+20],%o0
	mov %o1,%o0
	sethi %hi(LC1),%o1
	call _error_with_decl,0
	or %o1,%lo(LC1),%o1
	ld [%l1+8],%o1
	ld [%o1+12],%o0
	or %o0,%l2,%o0
	st %o0,[%o1+12]
L76:
	ld [%l1+20],%o0
L96:
	cmp %o0,0
	be,a L97
	ld [%l1+16],%o1
	mov %o0,%l0
	ld [%l0+12],%o0
L99:
	andcc %o0,%l2,%g0
	be,a L98
	ld [%l0+4],%l0
	ld [%l0+20],%o0
	cmp %o0,0
	be,a L98
	ld [%l0+4],%l0
	call _fixup_cleanups,0
	add %l1,4,%o1
	ld [%l0+4],%l0
L98:
	cmp %l0,0
	bne,a L99
	ld [%l0+12],%o0
	ld [%l1+16],%o1
L97:
	cmp %o1,0
	be L84
	sethi %hi(_stack_pointer_rtx),%o0
	call _gen_move_insn,0
	ld [%o0+%lo(_stack_pointer_rtx)],%o0
	call _emit_insn_after,0
	ld [%l1+4],%o1
L84:
	b L71
	st %g0,[%l1+4]
L75:
	be L94
	mov %l1,%o1
	ld [%l1+20],%o2
	cmp %o2,0
	be L100
	cmp %i1,0
	ld [%o2+4],%o1
L102:
	ld [%i0+32],%o0
	cmp %o1,%o0
	bne,a L101
	ld [%o2+4],%o2
	ld [%o2+12],%o0
	or %o0,%l2,%o0
	st %o0,[%o2+12]
	ld [%o2+4],%o2
L101:
	cmp %o2,0
	bne,a L102
	ld [%o2+4],%o1
	cmp %i1,0
L100:
	bne,a L71
	st %i1,[%l1+16]
L71:
	mov %l1,%o1
L94:
	ld [%l1],%l1
	cmp %l1,0
	bne,a L103
	ld [%l1+4],%o0
L70:
	ret
	restore
	.align 4
	.global _expand_asm
	.proc	020
_expand_asm:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov 21,%o0
	mov 0,%o1
	call _gen_rtx,0
	ld [%i0+24],%o2
	call _emit_insn,0
	nop
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	ret
	restore
	.align 8
LC2:
	.ascii "input operand constraint contains `+'\0"
	.align 8
LC3:
	.ascii "output operand constraint lacks `='\0"
	.align 8
LC4:
	.ascii "more than %d operands in `asm'\0"
	.align 8
LC5:
	.ascii "\0"
	.align 8
LC6:
	.ascii "hard register `%s' listed as input operand to `asm'\0"
	.align 8
LC7:
	.ascii "input operand constraint contains `%c'\0"
	.align 8
LC8:
	.ascii "unknown register name `%s' in `asm'\0"
	.align 4
	.global _expand_asm_operands
	.proc	020
_expand_asm_operands:
	!#PROLOGUE# 0
	save %sp,-168,%sp
	!#PROLOGUE# 1
	st %i0,[%fp-20]
	st %i1,[%fp-28]
	st %i2,[%fp-36]
	st %i3,[%fp-44]
	st %i4,[%fp-52]
	ld [%fp+92],%i4
	call _list_length,0
	ld [%fp-36],%o0
	mov %o0,%l7
	call _list_length,0
	ld [%fp-28],%o0
	mov %o0,%l5
	call _list_length,0
	ld [%fp-44],%o0
	mov %o0,%i2
	sll %l5,2,%o0
	add %o0,122,%o0
	and %o0,-8,%o0
	sub %sp,%o0,%sp
	add %sp,112,%l6
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	ld [%fp-28],%l2
	cmp %l2,0
	be L107
	mov 0,%l3
	sethi %hi(_error_mark_node),%i1
	sethi %hi(_save_expr_regs),%i0
L118:
	ld [%l2+20],%l4
	ld [%l4+8],%o1
	ld [%i1+%lo(_error_mark_node)],%o0
	cmp %o1,%o0
	be L105
	mov 0,%o3
	ld [%l2+16],%o0
	mov %o0,%o1
	ld [%o0+20],%o0
	cmp %o3,%o0
	bge L111
	mov 0,%o2
	ld [%o1+24],%o0
L164:
	ldsb [%o0+%o2],%o0
	cmp %o0,43
	be L160
	sethi %hi(LC2),%o0
	ld [%l2+16],%o0
	ld [%o0+24],%o0
	ldsb [%o0+%o2],%o0
	cmp %o0,61
	be,a L112
	mov 1,%o3
L112:
	add %o2,1,%o2
	ld [%l2+16],%o1
	ld [%o1+20],%o0
	cmp %o2,%o0
	bl,a L164
	ld [%o1+24],%o0
L111:
	cmp %o3,0
	be L161
	sethi %hi(LC3),%o0
	ldub [%l4+12],%o1
	add %o1,-43,%o0
	and %o0,0xff,%o0
	cmp %o0,1
	bleu L117
	cmp %o1,49
	be,a L165
	ld [%l2+20],%o0
	ld [%l4+8],%o0
	call _gen_reg_rtx,0
	ldub [%o0+28],%o0
	mov %o0,%l0
	mov 112,%o0
	mov %l4,%o1
	call _build_nt,0
	mov %l0,%o2
	mov %o0,%l1
	mov 2,%o0
	mov 0,%o1
	mov %l0,%o2
	call _gen_rtx,0
	ld [%i0+%lo(_save_expr_regs)],%o3
	st %o0,[%i0+%lo(_save_expr_regs)]
	st %l1,[%l2+20]
	ld [%l4+8],%o0
	st %o0,[%l1+8]
L117:
	ld [%l2+20],%o0
L165:
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	sll %l3,2,%o1
	st %o0,[%l6+%o1]
	ld [%l2+4],%l2
	cmp %l2,0
	bne L118
	add %l3,1,%l3
L107:
	add %l7,%l5,%o0
	cmp %o0,5
	ble L119
	nop
	sethi %hi(LC4),%o0
	or %o0,%lo(LC4),%o0
	call _error,0
	mov 5,%o1
	b,a L105
L119:
	call _rtvec_alloc,0
	mov %l7,%o0
	mov %o0,%i1
	call _rtvec_alloc,0
	mov %l7,%o0
	mov %o0,%i0
	st %i0,[%sp+92]
	st %i5,[%sp+96]
	st %i4,[%sp+100]
	mov 22,%o0
	mov 0,%o1
	ld [%fp-20],%g2
	ld [%g2+24],%o2
	sethi %hi(LC5),%o3
	or %o3,%lo(LC5),%o3
	mov 0,%o4
	call _gen_rtx,0
	mov %i1,%o5
	mov %o0,%l4
	ld [%fp-52],%g2
	and %g2,1,%o1
	sll %o1,4,%o1
	ld [%l4],%o0
	and %o0,-17,%o0
	or %o0,%o1,%o0
	st %o0,[%l4]
	ld [%fp-36],%l2
	cmp %l2,0
	be L121
	mov 0,%l3
	sethi %hi(_error_mark_node),%i3
	sethi %hi(LC7),%l1
L131:
	ld [%l2+20],%o2
	ld [%o2+8],%o1
	ld [%i3+%lo(_error_mark_node)],%o0
	cmp %o1,%o0
	be L105
	nop
	ld [%l2+16],%o0
	cmp %o0,0
	be L162
	mov %o0,%o1
	mov 0,%o2
	ld [%o0+20],%o0
	cmp %o2,%o0
	bge,a L166
	ld [%l2+20],%o0
	ld [%o1+24],%o0
L167:
	ldsb [%o0+%o2],%o0
	cmp %o0,61
	be L129
	cmp %o0,43
	bne,a L127
	add %o2,1,%o2
L129:
	ld [%l2+16],%o0
	ld [%o0+24],%o1
	or %l1,%lo(LC7),%o0
	call _error,0
	ldsb [%o1+%o2],%o1
	b,a L105
L127:
	ld [%l2+16],%o1
	ld [%o1+20],%o0
	cmp %o2,%o0
	bl,a L167
	ld [%o1+24],%o0
	ld [%l2+20],%o0
L166:
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	ld [%l4+16],%o1
	sll %l3,2,%l0
	add %o1,%l0,%o1
	st %o0,[%o1+4]
	ld [%l2+20],%o0
	ld [%o0+8],%o1
	ld [%l2+16],%o2
	mov 21,%o0
	ldub [%o1+28],%o1
	call _gen_rtx,0
	ld [%o2+24],%o2
	ld [%l4+20],%o1
	add %o1,%l0,%o1
	st %o0,[%o1+4]
	ld [%l2+4],%l2
	cmp %l2,0
	bne L131
	add %l3,1,%l3
L121:
	mov 0,%l3
	cmp %l3,%l7
	bge L168
	cmp %l3,%l5
L135:
	ld [%l4+16],%o0
	sll %l3,2,%l0
	add %o0,%l0,%o0
	ld [%o0+4],%o0
	call _protect_from_queue,0
	mov 0,%o1
	ld [%l4+16],%o1
	add %o1,%l0,%o1
	add %l3,1,%l3
	cmp %l3,%l7
	bl L135
	st %o0,[%o1+4]
	mov 0,%l3
	cmp %l3,%l5
L168:
	bge L169
	cmp %l5,1
L139:
	sll %l3,2,%l0
	ld [%l6+%l0],%o0
	call _protect_from_queue,0
	mov 1,%o1
	add %l3,1,%l3
	cmp %l3,%l5
	bl L139
	st %o0,[%l6+%l0]
	cmp %l5,1
L169:
	bne L170
	cmp %l5,0
	cmp %i2,0
	bne L170
	cmp %l5,0
	ld [%fp-28],%g2
	ld [%g2+16],%o0
	ld [%o0+24],%o0
	st %o0,[%l4+8]
	mov 25,%o0
	mov 0,%o1
	ld [%l6],%o2
	call _gen_rtx,0
	mov %l4,%o3
	call _emit_insn,0
	nop
	b L171
	sethi %hi(_last_expr_type),%o0
L170:
	bne L172
	mov %l5,%o0
	cmp %i2,0
	bne L173
	cmp %o0,0
	b,a L151
L160:
	call _error,0
	or %o0,%lo(LC2),%o0
	b,a L105
L161:
	call _error,0
	or %o0,%lo(LC3),%o0
	b,a L105
L162:
	sethi %hi(LC6),%o0
	or %o0,%lo(LC6),%o0
	call _error,0
	ld [%o2+24],%o1
	b,a L105
L163:
	sethi %hi(LC8),%o0
	or %o0,%lo(LC8),%o0
	call _error,0
	mov %l1,%o1
	b,a L105
L172:
	cmp %o0,0
L173:
	bne L144
	mov %l4,%l7
	mov 1,%o0
L144:
	call _rtvec_alloc,0
	add %o0,%i2,%o0
	mov %o0,%o2
	mov 20,%o0
	call _gen_rtx,0
	mov 0,%o1
	mov %o0,%l4
	ld [%fp-28],%l2
	cmp %l2,0
	be L146
	mov 0,%l3
	ld [%fp-52],%g2
	and %g2,1,%o0
	sll %o0,4,%l1
L148:
	sll %l3,2,%l0
	ld [%l2+16],%o3
	st %i0,[%sp+92]
	st %i5,[%sp+96]
	st %i4,[%sp+100]
	mov 22,%o0
	mov 0,%o1
	ld [%fp-20],%g2
	ld [%g2+24],%o2
	ld [%o3+24],%o3
	mov %l3,%o4
	call _gen_rtx,0
	mov %i1,%o5
	mov %o0,%o3
	mov 25,%o0
	mov 0,%o1
	call _gen_rtx,0
	ld [%l6+%l0],%o2
	ld [%l4+4],%o1
	add %o1,%l0,%o1
	st %o0,[%o1+4]
	ld [%l4+4],%o0
	add %o0,%l0,%o0
	ld [%o0+4],%o0
	ld [%o0+8],%o1
	ld [%o1],%o0
	and %o0,-17,%o0
	or %o0,%l1,%o0
	st %o0,[%o1]
	ld [%l2+4],%l2
	cmp %l2,0
	bne L148
	add %l3,1,%l3
L146:
	cmp %l3,0
	bne L174
	ld [%fp-44],%l2
	ld [%l4+4],%o0
	st %l7,[%o0+4]
	mov 1,%l3
	ld [%fp-44],%l2
L174:
	cmp %l2,0
	be L151
	sethi %hi(_reg_names),%o0
	or %o0,%lo(_reg_names),%l5
L159:
	ld [%l2+20],%o0
	ld [%o0+24],%l1
	mov 0,%l0
	sll %l0,2,%o1
L176:
	mov %l1,%o0
	call _strcmp,0
	ld [%o1+%l5],%o1
	cmp %o0,0
	be L175
	cmp %l0,56
	add %l0,1,%l0
	cmp %l0,55
	ble,a L176
	sll %l0,2,%o1
	cmp %l0,56
L175:
	be L163
	mov 34,%o0
	mov 1,%o1
	call _gen_rtx,0
	mov %l0,%o2
	mov %o0,%o2
	mov 27,%o0
	call _gen_rtx,0
	mov 0,%o1
	ld [%l4+4],%o1
	sll %l3,2,%o2
	add %o1,%o2,%o1
	st %o0,[%o1+4]
	ld [%l2+4],%l2
	cmp %l2,0
	bne L159
	add %l3,1,%l3
L151:
	call _emit_insn,0
	mov %l4,%o0
	sethi %hi(_last_expr_type),%o0
L171:
	st %g0,[%o0+%lo(_last_expr_type)]
L105:
	ret
	restore
	.align 8
LC9:
	.ascii "statement with no effect\0"
	.align 4
	.global _expand_expr_stmt
	.proc	020
_expand_expr_stmt:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_extra_warnings),%o0
	ld [%o0+%lo(_extra_warnings)],%o0
	cmp %o0,0
	be L178
	sethi %hi(_expr_stmts_for_value),%o0
	ld [%o0+%lo(_expr_stmts_for_value)],%o0
	cmp %o0,0
	bne,a L182
	ld [%i0+8],%o0
	ld [%i0+12],%o1
	sethi %hi(1048576),%o0
	andcc %o1,%o0,%g0
	bne,a L182
	ld [%i0+8],%o0
	sethi %hi(_error_mark_node),%o0
	ld [%o0+%lo(_error_mark_node)],%o0
	cmp %i0,%o0
	be L178
	sethi %hi(_emit_filename),%o0
	sethi %hi(_emit_lineno),%o1
	ld [%o0+%lo(_emit_filename)],%o0
	ld [%o1+%lo(_emit_lineno)],%o1
	sethi %hi(LC9),%o2
	call _warning_with_file_and_line,0
	or %o2,%lo(LC9),%o2
L178:
	ld [%i0+8],%o0
L182:
	sethi %hi(_last_expr_type),%o1
	st %o0,[%o1+%lo(_last_expr_type)]
	sethi %hi(_flag_syntax_only),%o0
	ld [%o0+%lo(_flag_syntax_only)],%o0
	cmp %o0,0
	bne L179
	sethi %hi(_expr_stmts_for_value),%o0
	ld [%o0+%lo(_expr_stmts_for_value)],%o0
	cmp %o0,0
	bne L181
	mov 0,%o1
	sethi %hi(_const0_rtx),%o0
	ld [%o0+%lo(_const0_rtx)],%o1
L181:
	mov %i0,%o0
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	sethi %hi(_last_expr_value),%o1
	st %o0,[%o1+%lo(_last_expr_value)]
L179:
	call _emit_queue,0
	nop
	ret
	restore
	.align 4
	.global _clear_last_expr
	.proc	020
_clear_last_expr:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_last_expr_type),%g2
	st %g0,[%g2+%lo(_last_expr_type)]
	ret
	restore
	.align 4
	.global _expand_start_stmt_expr
	.proc	0111
_expand_start_stmt_expr:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _start_sequence,0
	nop
	call _suspend_momentary,0
	mov %o0,%l1
	mov %o0,%l0
	call _make_node,0
	mov 113,%o0
	mov %o0,%i0
	call _resume_momentary,0
	mov %l0,%o0
	st %l1,[%i0+24]
	sethi %hi(_expr_stmts_for_value),%o1
	ld [%o1+%lo(_expr_stmts_for_value)],%o0
	add %o0,1,%o0
	st %o0,[%o1+%lo(_expr_stmts_for_value)]
	ret
	restore
	.align 4
	.global _expand_end_stmt_expr
	.proc	0111
_expand_end_stmt_expr:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _do_pending_stack_adjust,0
	ld [%i0+24],%l3
	sethi %hi(_last_expr_type),%o1
	ld [%o1+%lo(_last_expr_type)],%o0
	cmp %o0,0
	bne L186
	sethi %hi(_last_expr_type),%l2
	sethi %hi(_void_type_node),%o0
	ld [%o0+%lo(_void_type_node)],%o0
	st %o0,[%o1+%lo(_last_expr_type)]
	sethi %hi(_const0_rtx),%o0
	ld [%o0+%lo(_const0_rtx)],%o0
	sethi %hi(_last_expr_value),%o1
	st %o0,[%o1+%lo(_last_expr_value)]
L186:
	ld [%l2+%lo(_last_expr_type)],%o0
	st %o0,[%i0+8]
	sethi %hi(_last_expr_value),%l1
	ld [%l1+%lo(_last_expr_value)],%o0
	call _get_insns,0
	st %o0,[%i0+24]
	st %o0,[%i0+20]
	sethi %hi(_rtl_expr_chain),%l0
	mov 0,%o0
	mov %i0,%o1
	call _tree_cons,0
	ld [%l0+%lo(_rtl_expr_chain)],%o2
	st %o0,[%l0+%lo(_rtl_expr_chain)]
	call _end_sequence,0
	mov %l3,%o0
	ld [%i0+12],%o0
	sethi %hi(1048576),%o1
	or %o0,%o1,%o0
	st %o0,[%i0+12]
	call _volatile_refs_p,0
	ld [%l1+%lo(_last_expr_value)],%o0
	and %o0,1,%o0
	sll %o0,12,%o0
	ld [%i0+12],%o2
	sethi %hi(4096),%o1
	andn %o2,%o1,%o1
	or %o1,%o0,%o1
	st %o1,[%i0+12]
	st %g0,[%l2+%lo(_last_expr_type)]
	sethi %hi(_expr_stmts_for_value),%o1
	ld [%o1+%lo(_expr_stmts_for_value)],%o0
	add %o0,-1,%o0
	st %o0,[%o1+%lo(_expr_stmts_for_value)]
	ret
	restore
	.align 4
	.global _expand_start_cond
	.proc	020
_expand_start_cond:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _xmalloc,0
	mov 40,%o0
	mov %o0,%l0
	sethi %hi(_cond_stack),%o0
	ld [%o0+%lo(_cond_stack)],%o0
	st %o0,[%l0+4]
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	st %o0,[%l0]
	sethi %hi(_nesting_depth),%o1
	ld [%o1+%lo(_nesting_depth)],%o0
	add %o0,1,%o0
	st %o0,[%o1+%lo(_nesting_depth)]
	st %o0,[%l0+8]
	call _gen_label_rtx,0
	st %g0,[%l0+20]
	cmp %i1,0
	be L188
	st %o0,[%l0+16]
	b L189
	st %o0,[%l0+12]
L188:
	st %g0,[%l0+12]
L189:
	sethi %hi(_cond_stack),%o0
	st %l0,[%o0+%lo(_cond_stack)]
	sethi %hi(_nesting_stack),%o0
	st %l0,[%o0+%lo(_nesting_stack)]
	mov %i0,%o0
	ld [%l0+16],%o1
	call _do_jump,0
	mov 0,%o2
	ret
	restore
	.align 4
	.global _expand_end_cond
	.proc	020
_expand_end_cond:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_cond_stack),%o0
	call _do_pending_stack_adjust,0
	ld [%o0+%lo(_cond_stack)],%l0
	call _emit_label,0
	ld [%l0+16],%o0
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	ld [%o0+8],%l2
	sethi %hi(_cond_stack),%l1
	sethi %hi(_nesting_stack),%l3
	sethi %hi(_nesting_depth),%l0
	ld [%l1+%lo(_cond_stack)],%o0
L197:
	ld [%o0+4],%o1
	st %o1,[%l1+%lo(_cond_stack)]
	ld [%o0],%o1
	st %o1,[%l3+%lo(_nesting_stack)]
	ld [%o0+8],%o1
	call _free,0
	st %o1,[%l0+%lo(_nesting_depth)]
	ld [%l0+%lo(_nesting_depth)],%o0
	cmp %o0,%l2
	bg L197
	ld [%l1+%lo(_cond_stack)],%o0
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	ret
	restore
	.align 4
	.global _expand_start_else
	.proc	020
_expand_start_else:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _gen_label_rtx,0
	nop
	mov %o0,%o2
	sethi %hi(_cond_stack),%o0
	ld [%o0+%lo(_cond_stack)],%o1
	st %o2,[%o1+20]
	ld [%o1+12],%o0
	cmp %o0,0
	bne,a L199
	st %o2,[%o1+12]
L199:
	sethi %hi(_cond_stack),%l0
	ld [%l0+%lo(_cond_stack)],%o0
	call _emit_jump,0
	ld [%o0+20],%o0
	ld [%l0+%lo(_cond_stack)],%o0
	ld [%o0+16],%o0
	cmp %o0,0
	be L200
	nop
	call _emit_label,0
	nop
L200:
	ret
	restore
	.align 4
	.global _expand_end_else
	.proc	020
_expand_end_else:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_cond_stack),%o0
	call _do_pending_stack_adjust,0
	ld [%o0+%lo(_cond_stack)],%l0
	ld [%l0+20],%o0
	cmp %o0,0
	be L202
	sethi %hi(_cond_stack),%l1
	call _emit_label,0
	nop
L202:
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	ld [%o0+8],%l2
	sethi %hi(_nesting_stack),%l3
	sethi %hi(_nesting_depth),%l0
	ld [%l1+%lo(_cond_stack)],%o0
L209:
	ld [%o0+4],%o1
	st %o1,[%l1+%lo(_cond_stack)]
	ld [%o0],%o1
	st %o1,[%l3+%lo(_nesting_stack)]
	ld [%o0+8],%o1
	call _free,0
	st %o1,[%l0+%lo(_nesting_depth)]
	ld [%l0+%lo(_nesting_depth)],%o0
	cmp %o0,%l2
	bg L209
	ld [%l1+%lo(_cond_stack)],%o0
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	ret
	restore
	.align 4
	.global _expand_start_loop
	.proc	020
_expand_start_loop:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _xmalloc,0
	mov 40,%o0
	mov %o0,%l0
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o0
	st %o0,[%l0+4]
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	st %o0,[%l0]
	sethi %hi(_nesting_depth),%o1
	ld [%o1+%lo(_nesting_depth)],%o0
	add %o0,1,%o0
	st %o0,[%o1+%lo(_nesting_depth)]
	call _gen_label_rtx,0
	st %o0,[%l0+8]
	call _gen_label_rtx,0
	st %o0,[%l0+16]
	st %o0,[%l0+20]
	ld [%l0+16],%o0
	cmp %i0,0
	be L211
	st %o0,[%l0+24]
	ld [%l0+20],%o0
	b L212
	st %o0,[%l0+12]
L211:
	st %g0,[%l0+12]
L212:
	sethi %hi(_loop_stack),%o0
	st %l0,[%o0+%lo(_loop_stack)]
	sethi %hi(_nesting_stack),%o0
	call _do_pending_stack_adjust,0
	st %l0,[%o0+%lo(_nesting_stack)]
	call _emit_queue,0
	nop
	mov 0,%o0
	call _emit_note,0
	mov -4,%o1
	call _emit_label,0
	ld [%l0+16],%o0
	ret
	restore
	.align 4
	.global _expand_start_loop_continue_elsewhere
	.proc	020
_expand_start_loop_continue_elsewhere:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _expand_start_loop,0
	mov %i0,%o0
	call _gen_label_rtx,0
	nop
	sethi %hi(_loop_stack),%o1
	ld [%o1+%lo(_loop_stack)],%o1
	st %o0,[%o1+24]
	ret
	restore
	.align 4
	.global _expand_loop_continue_here
	.proc	020
_expand_loop_continue_here:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _do_pending_stack_adjust,0
	nop
	mov 0,%o0
	call _emit_note,0
	mov -8,%o1
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o0
	call _emit_label,0
	ld [%o0+24],%o0
	ret
	restore
	.align 4
	.global _expand_end_loop
	.proc	020
_expand_end_loop:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _get_last_insn,0
	nop
	mov %o0,%l1
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o0
	call _do_pending_stack_adjust,0
	ld [%o0+16],%l2
	sethi %hi(_optimize),%o0
	ld [%o0+%lo(_optimize)],%o0
	cmp %o0,0
	be L216
	nop
	lduh [%l1],%o0
	cmp %o0,14
	bne L232
	sethi %hi(_loop_stack),%o0
	ld [%l1+16],%o2
	lduh [%o2],%o0
	cmp %o0,25
	bne L232
	sethi %hi(_loop_stack),%o0
	sethi %hi(_pc_rtx),%o0
	ld [%o2+4],%o1
	ld [%o0+%lo(_pc_rtx)],%o0
	cmp %o1,%o0
	bne L232
	sethi %hi(_loop_stack),%o0
	ld [%o2+8],%o0
	lduh [%o0],%o0
	cmp %o0,42
	be L216
	nop
	sethi %hi(_loop_stack),%o0
L232:
	ld [%o0+%lo(_loop_stack)],%o0
	ld [%o0+16],%l1
	cmp %l1,0
	be L235
	sethi %hi(_pc_rtx),%o0
	ld [%o0+%lo(_pc_rtx)],%o3
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o2
	lduh [%l1],%o0
L236:
	cmp %o0,14
	bne,a L233
	ld [%l1+12],%l1
	ld [%l1+16],%o1
	lduh [%o1],%o0
	cmp %o0,25
	bne,a L233
	ld [%l1+12],%l1
	ld [%o1+4],%o0
	cmp %o0,%o3
	bne,a L233
	ld [%l1+12],%l1
	ld [%o1+8],%o1
	lduh [%o1],%o0
	cmp %o0,42
	bne,a L233
	ld [%l1+12],%l1
	ld [%o1+8],%o1
	lduh [%o1],%o0
	cmp %o0,38
	bne,a L234
	ld [%l1+16],%o0
	ld [%o1+4],%o1
	ld [%o2+20],%o0
	cmp %o1,%o0
	be L235
	cmp %l1,0
	ld [%l1+16],%o0
L234:
	ld [%o0+8],%o0
	ld [%o0+12],%o1
	lduh [%o1],%o0
	cmp %o0,38
	bne,a L233
	ld [%l1+12],%l1
	ld [%o1+4],%o1
	ld [%o2+20],%o0
	cmp %o1,%o0
	be L235
	cmp %l1,0
	ld [%l1+12],%l1
L233:
	cmp %l1,0
	bne,a L236
	lduh [%l1],%o0
	cmp %l1,0
L235:
	be L216
	nop
	call _gen_label_rtx,0
	nop
	mov %o0,%l0
	call _emit_label_after,0
	ld [%l2+8],%o1
	call _get_last_insn,0
	nop
	mov %o0,%o2
	mov %l2,%o0
	call _reorder_insns,0
	mov %l1,%o1
	call _gen_jump,0
	mov %l2,%o0
	call _emit_jump_insn_after,0
	ld [%l0+8],%o1
	call _emit_barrier_after,0
	ld [%l0+8],%o0
	mov %l0,%l2
L216:
	call _emit_jump,0
	mov %l2,%o0
	mov 0,%o0
	call _emit_note,0
	mov -5,%o1
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o0
	call _emit_label,0
	ld [%o0+20],%o0
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	ld [%o0+8],%l2
	sethi %hi(_loop_stack),%l1
	sethi %hi(_nesting_stack),%l3
	sethi %hi(_nesting_depth),%l0
	ld [%l1+%lo(_loop_stack)],%o0
L237:
	ld [%o0+4],%o1
	st %o1,[%l1+%lo(_loop_stack)]
	ld [%o0],%o1
	st %o1,[%l3+%lo(_nesting_stack)]
	ld [%o0+8],%o1
	call _free,0
	st %o1,[%l0+%lo(_nesting_depth)]
	ld [%l0+%lo(_nesting_depth)],%o0
	cmp %o0,%l2
	bg L237
	ld [%l1+%lo(_loop_stack)],%o0
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	ret
	restore
	.align 4
	.global _expand_continue_loop
	.proc	04
_expand_continue_loop:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o1
	cmp %o1,0
	be L240
	mov 0,%i0
	mov 0,%o0
	ld [%o1+24],%o1
	call _expand_goto_internal,0
	mov 0,%o2
	mov 1,%i0
L240:
	ret
	restore
	.align 4
	.global _expand_exit_loop
	.proc	04
_expand_exit_loop:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o1
	cmp %o1,0
	be L243
	mov 0,%i0
	mov 0,%o0
	ld [%o1+20],%o1
	call _expand_goto_internal,0
	mov 0,%o2
	mov 1,%i0
L243:
	ret
	restore
	.align 4
	.global _expand_exit_loop_if_false
	.proc	04
_expand_exit_loop_if_false:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	sethi %hi(_loop_stack),%o0
	ld [%o0+%lo(_loop_stack)],%o1
	cmp %o1,0
	be,a L246
	mov 0,%i0
	mov %i0,%o0
	ld [%o1+20],%o1
	call _do_jump,0
	mov 0,%o2
	mov 1,%i0
L246:
	ret
	restore
	.align 4
	.global _expand_exit_something
	.proc	04
_expand_exit_something:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	cmp %o0,0
	be L253
	mov 0,%i0
	ld [%o0+12],%o1
L254:
	cmp %o1,0
	be,a L250
	ld [%o0],%o0
	mov 0,%o0
	call _expand_goto_internal,0
	mov 0,%o2
	b L253
	mov 1,%i0
L250:
	cmp %o0,0
	bne,a L254
	ld [%o0+12],%o1
	mov 0,%i0
L253:
	ret
	restore
	.align 4
	.global _expand_null_return
	.proc	020
_expand_null_return:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _expand_null_return_1,0
	mov 0,%o0
	ret
	restore
	.align 4
	.proc	020
_expand_null_return_1:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _clear_pending_stack_adjust,0
	nop
	call _do_pending_stack_adjust,0
	nop
	sethi %hi(_last_expr_type),%o0
	st %g0,[%o0+%lo(_last_expr_type)]
	sethi %hi(_return_label),%o1
	mov 0,%o0
	ld [%o1+%lo(_return_label)],%o1
	call _expand_goto_internal,0
	mov %i0,%o2
	ret
	restore
	.align 4
	.global _expand_return
	.proc	020
_expand_return:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%o1
	cmp %o1,0
	be L261
	mov 0,%l1
	ld [%o1+28],%o0
L294:
	cmp %o0,0
	bne,a L261
	mov 1,%l1
	ld [%o1+4],%o1
	cmp %o1,0
	bne,a L294
	ld [%o1+28],%o0
L261:
	ldub [%i0+12],%o0
	cmp %o0,45
	bne,a L265
	ldub [%i0+12],%o0
	b L266
	mov %i0,%l0
L265:
	add %o0,-55,%o0
	and %o0,0xff,%o0
	cmp %o0,1
	bgu L295
	sethi %hi(_void_type_node),%o0
	ld [%i0+20],%o0
	ldub [%o0+12],%o0
	cmp %o0,45
	bne L295
	sethi %hi(_void_type_node),%o0
	b L266
	ld [%i0+24],%l0
L295:
	ld [%i0+8],%o1
	ld [%o0+%lo(_void_type_node)],%o0
	xor %o1,%o0,%o1
	subcc %g0,%o1,%g0
	addx %g0,-1,%o1
	and %o1,%i0,%l0
L266:
	sethi %hi(_optimize),%o0
	ld [%o0+%lo(_optimize)],%o0
	cmp %o0,0
	be L273
	cmp %l0,0
	be L273
	sethi %hi(_frame_offset),%o0
	ld [%o0+%lo(_frame_offset)],%o0
	cmp %o0,0
	bne L296
	cmp %l1,0
	ldub [%l0+12],%o0
	cmp %o0,60
	bne L296
	cmp %l1,0
	ld [%l0+20],%o1
	ldub [%o1+12],%o0
	cmp %o0,114
	bne L296
	cmp %l1,0
	sethi %hi(_this_function),%o0
	ld [%o1+20],%o1
	ld [%o0+%lo(_this_function)],%o0
	cmp %o1,%o0
	bne L296
	cmp %l1,0
	ld [%l0+24],%o0
	call _tail_recursion_args,0
	ld [%o1+52],%o1
	cmp %o0,0
	be L296
	cmp %l1,0
	sethi %hi(_tail_recursion_label),%l0
	ld [%l0+%lo(_tail_recursion_label)],%o0
	cmp %o0,0
	bne L272
	nop
	call _gen_label_rtx,0
	nop
	st %o0,[%l0+%lo(_tail_recursion_label)]
	sethi %hi(_tail_recursion_reentry),%o1
	call _emit_label_after,0
	ld [%o1+%lo(_tail_recursion_reentry)],%o1
L272:
	call _get_last_insn,0
	sethi %hi(_tail_recursion_label),%l0
	mov %o0,%o2
	mov 0,%o0
	call _expand_goto_internal,0
	ld [%l0+%lo(_tail_recursion_label)],%o1
	call _emit_barrier,0
	add %o7,(L259-.-4),%o7
L273:
	cmp %l1,0
L296:
	be L289
	cmp %l0,0
	be L289
	sethi %hi(_void_type_node),%o0
	ld [%l0+8],%o1
	ld [%o0+%lo(_void_type_node)],%o0
	cmp %o1,%o0
	be L289
	sethi %hi(_this_function),%l1
	ld [%l1+%lo(_this_function)],%o0
	ld [%o0+56],%o0
	ld [%o0+64],%o0
	lduh [%o0],%o0
	cmp %o0,34
	bne L297
	mov %i0,%o0
	mov %l0,%o0
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	call _emit_queue,0
	mov %o0,%l0
	call _get_last_insn,0
	nop
	mov %o0,%i0
	ld [%l1+%lo(_this_function)],%o0
	ld [%o0+56],%o0
	ld [%o0+64],%o0
	call _emit_move_insn,0
	mov %l0,%o1
	ld [%l1+%lo(_this_function)],%o0
	ld [%o0+56],%o0
	ld [%o0+64],%l0
	lduh [%l0],%o0
	cmp %o0,34
	bne L290
	mov 26,%o0
	mov 0,%o1
	call _gen_rtx,0
	mov %l0,%o2
	call _emit_insn,0
	nop
L290:
	call _expand_null_return_1,0
	mov %i0,%o0
	b,a L259
L289:
	mov %i0,%o0
L297:
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	call _emit_queue,0
	nop
	sethi %hi(_this_function),%o0
	ld [%o0+%lo(_this_function)],%o0
	ld [%o0+56],%o0
	ld [%o0+64],%l0
	lduh [%l0],%o0
	cmp %o0,34
	bne L292
	mov 26,%o0
	mov 0,%o1
	call _gen_rtx,0
	mov %l0,%o2
	call _emit_insn,0
	nop
L292:
	call _expand_null_return,0
	nop
L259:
	ret
	restore
	.align 4
	.global _drop_through_at_end_p
	.proc	04
_drop_through_at_end_p:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _get_last_insn,0
	nop
	mov %o0,%o1
L301:
	cmp %o1,0
	be L304
	mov 0,%i0
	lduh [%o1],%o0
	cmp %o0,18
	be,a L301
	ld [%o1+8],%o1
	cmp %o1,0
L304:
	be L302
	nop
	lduh [%o1],%o0
	xor %o0,16,%o0
	subcc %g0,%o0,%g0
	addx %g0,0,%i0
L302:
	ret
	restore
	.align 4
	.proc	04
_tail_recursion_args:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov %i0,%l3
	mov %i1,%l0
	b L337
	mov 0,%l2
L312:
	ld [%o0+8],%o1
	ld [%l0+8],%o0
	cmp %o1,%o0
	bne,a L335
	mov 0,%i0
	ld [%l0+64],%o0
	lduh [%o0],%o0
	cmp %o0,34
	bne,a L335
	mov 0,%i0
	ld [%l0+28],%o0
	cmp %o0,26
	be L336
	add %l2,1,%l2
	ld [%l3+4],%l3
	ld [%l0+4],%l0
L337:
	cmp %l3,0
	be L307
	cmp %l0,0
	bne,a L312
	ld [%l3+20],%o0
L307:
	cmp %l3,0
	bne,a L335
	mov 0,%i0
	cmp %l0,0
	be L313
	sll %l2,2,%o0
L336:
	b L335
	mov 0,%i0
L313:
	add %o0,106,%o0
	and %o0,-8,%o0
	sub %sp,%o0,%sp
	add %sp,96,%l6
	orcc %i0,%g0,%l3
	be L340
	mov 0,%l2
L318:
	ld [%l3+20],%o0
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	sll %l2,2,%o1
	st %o0,[%l6+%o1]
	ld [%l3+4],%l3
	cmp %l3,0
	bne L318
	add %l2,1,%l2
	orcc %i0,%g0,%l3
L340:
	be L320
	mov 0,%l2
L328:
	mov 0,%l4
	mov %i1,%l0
	cmp %l4,%l2
	bge L323
	mov 0,%l1
	sll %l2,2,%l5
L326:
	ld [%l0+64],%o0
	call _reg_mentioned_p,0
	ld [%l6+%l5],%o1
	cmp %o0,0
	be,a L324
	add %l1,1,%l1
	b L323
	mov 1,%l4
L324:
	cmp %l1,%l2
	bl L326
	ld [%l0+4],%l0
L323:
	cmp %l4,0
	be L321
	sll %l2,2,%l0
	call _copy_to_reg,0
	ld [%l6+%l0],%o0
	st %o0,[%l6+%l0]
L321:
	ld [%l3+4],%l3
	cmp %l3,0
	bne L328
	add %l2,1,%l2
L320:
	mov %i1,%l0
	mov %i0,%l3
	cmp %l0,0
	be L330
	mov 0,%l2
L334:
	sll %l2,2,%o0
	ld [%l6+%o0],%o2
	ldub [%o2+2],%o1
	ld [%l0+28],%o0
	cmp %o0,%o1
	bne L332
	sll %l2,2,%o1
	ld [%l0+64],%o0
	call _emit_move_insn,0
	mov %o2,%o1
	b L338
	ld [%l0+4],%l0
L332:
	ld [%l3+20],%o0
	ld [%o0+8],%o0
	ld [%o0+12],%o2
	srl %o2,11,%o2
	ld [%l0+64],%o0
	ld [%l6+%o1],%o1
	call _convert_move,0
	and %o2,1,%o2
	ld [%l0+4],%l0
L338:
	ld [%l3+4],%l3
	cmp %l0,0
	bne L334
	add %l2,1,%l2
L330:
	mov 1,%i0
L335:
	ret
	restore
	.align 4
	.global _expand_start_bindings
	.proc	020
_expand_start_bindings:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _xmalloc,0
	mov 40,%o0
	mov %o0,%l0
	mov 0,%o0
	call _emit_note,0
	mov -2,%o1
	mov %o0,%l1
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%o2
	st %o2,[%l0+4]
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	st %o0,[%l0]
	sethi %hi(_nesting_depth),%o1
	ld [%o1+%lo(_nesting_depth)],%o0
	add %o0,1,%o0
	st %o0,[%o1+%lo(_nesting_depth)]
	st %o0,[%l0+8]
	st %g0,[%l0+16]
	cmp %o2,0
	be L342
	st %g0,[%l0+28]
	mov 0,%o0
	ld [%o2+28],%o1
	call _tree_cons,0
	ld [%o2+32],%o2
	b L346
	st %o0,[%l0+32]
L342:
	mov 0,%o0
	st %o0,[%l0+32]
L346:
	st %g0,[%l0+36]
	sethi %hi(_stack_block_stack),%o0
	ld [%o0+%lo(_stack_block_stack)],%o0
	st %o0,[%l0+24]
	cmp %i0,0
	be L344
	st %l1,[%l0+20]
	call _gen_label_rtx,0
	nop
	b L345
	st %o0,[%l0+12]
L344:
	st %g0,[%l0+12]
L345:
	sethi %hi(_block_stack),%o0
	st %l0,[%o0+%lo(_block_stack)]
	sethi %hi(_nesting_stack),%o0
	st %l0,[%o0+%lo(_nesting_stack)]
	ret
	restore
	.align 4
	.global _use_variable
	.proc	020
_use_variable:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov %i0,%o2
	lduh [%o2],%o0
	cmp %o0,34
	be L351
	cmp %o0,37
	bne L349
	nop
	ld [%o2+4],%o2
	lduh [%o2],%o0
	cmp %o0,34
	bne L349
	sethi %hi(_frame_pointer_rtx),%o0
	ld [%o0+%lo(_frame_pointer_rtx)],%o0
	cmp %o2,%o0
	be L349
	sethi %hi(_arg_pointer_rtx),%o0
	ld [%o0+%lo(_arg_pointer_rtx)],%o0
	cmp %o2,%o0
	be L349
	nop
L351:
	mov 26,%o0
	call _gen_rtx,0
	mov 0,%o1
	call _emit_insn,0
	nop
L349:
	ret
	restore
	.align 4
	.proc	020
_use_variable_after:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov %i0,%o2
	lduh [%o2],%o0
	cmp %o0,34
	be L356
	cmp %o0,37
	bne L354
	nop
	ld [%o2+4],%o2
	lduh [%o2],%o0
	cmp %o0,34
	bne L354
	sethi %hi(_frame_pointer_rtx),%o0
	ld [%o0+%lo(_frame_pointer_rtx)],%o0
	cmp %o2,%o0
	be L354
	sethi %hi(_arg_pointer_rtx),%o0
	ld [%o0+%lo(_arg_pointer_rtx)],%o0
	cmp %o2,%o0
	be L354
	nop
L356:
	mov 26,%o0
	call _gen_rtx,0
	mov 0,%o1
	call _emit_insn_after,0
	mov %i1,%o1
L354:
	ret
	restore
	.align 8
LC10:
	.ascii "unused variable `%s'\0"
	.align 4
	.global _expand_end_bindings
	.proc	020
_expand_end_bindings:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_block_stack),%o0
	ld [%o0+%lo(_block_stack)],%l1
	sethi %hi(_warn_unused),%o0
	ld [%o0+%lo(_warn_unused)],%o0
	cmp %o0,0
	be L358
	cmp %i0,0
	mov %i0,%l0
	be L358
	sethi %hi(-16776960),%o0
	or %o0,%lo(-16776960),%l4
	sethi %hi(721420288),%l3
	sethi %hi(LC10),%l2
	ld [%l0+12],%o0
L390:
	and %o0,%l4,%o0
	cmp %o0,%l3
	bne,a L389
	ld [%l0+4],%l0
	mov %l0,%o0
	call _warning_with_decl,0
	or %l2,%lo(LC10),%o1
	ld [%l0+4],%l0
L389:
	cmp %l0,0
	bne,a L390
	ld [%l0+12],%o0
L358:
	cmp %i1,0
	be L364
	mov 0,%o0
	call _emit_note,0
	mov -3,%o1
	b L391
	ld [%l1+12],%o0
L364:
	ld [%l1+20],%o1
	mov -1,%o0
	st %o0,[%o1+20]
	ld [%l1+12],%o0
L391:
	cmp %o0,0
	be L392
	cmp %i2,0
	call _do_pending_stack_adjust,0
	nop
	call _emit_label,0
	ld [%l1+12],%o0
	cmp %i2,0
L392:
	bne,a L393
	ld [%l1+36],%l0
	ld [%l1+16],%o0
	cmp %o0,0
	bne,a L393
	ld [%l1+36],%l0
	ld [%l1+28],%o0
	cmp %o0,0
	be,a L394
	ld [%l1+16],%o0
	ld [%l1+36],%l0
L393:
	cmp %l0,0
	be,a L394
	ld [%l1+16],%o0
	sethi %hi(524288),%l4
	sethi %hi(16384),%l3
	sethi %hi(LC1),%l2
	ld [%l0+4],%o0
L395:
	ld [%o0+12],%o1
	or %o1,%l4,%o1
	st %o1,[%o0+12]
	ld [%l0+4],%o1
	ld [%o1+12],%o0
	andcc %o0,%l3,%g0
	be L371
	mov %o1,%o0
	call _error_with_decl,0
	or %l2,%lo(LC1),%o1
L371:
	ld [%l0],%l0
	cmp %l0,0
	bne,a L395
	ld [%l0+4],%o0
	ld [%l1+16],%o0
L394:
	cmp %o0,0
	bne,a L396
	ld [%l1+28],%o0
	ld [%l1+28],%o0
	cmp %o0,0
	be,a L397
	sethi %hi(_obey_regdecls),%o0
L396:
	call _expand_cleanups,0
	mov 0,%o1
	ld [%l1+16],%o0
	cmp %o0,0
	be L398
	mov %l1,%o0
	call _do_pending_stack_adjust,0
	nop
	sethi %hi(_stack_pointer_rtx),%o0
	ld [%o0+%lo(_stack_pointer_rtx)],%o0
	call _emit_move_insn,0
	ld [%l1+16],%o1
	mov %l1,%o0
L398:
	ld [%l1+16],%o1
	ld [%l1+28],%o2
	ld [%l1+20],%o3
	call _fixup_gotos,0
	mov %i2,%o4
	sethi %hi(_obey_regdecls),%o0
L397:
	ld [%o0+%lo(_obey_regdecls)],%o0
	cmp %o0,0
	be L377
	mov %i0,%l0
	cmp %l0,0
	be,a L399
	ld [%l1+24],%o0
	ldub [%l0+12],%o0
L401:
	cmp %o0,43
	bne L380
	ld [%l0+64],%o1
	cmp %o1,0
	be,a L400
	ld [%l0+4],%l0
	call _use_variable,0
	mov %o1,%o0
L380:
	ld [%l0+4],%l0
L400:
	cmp %l0,0
	bne,a L401
	ldub [%l0+12],%o0
L377:
	ld [%l1+24],%o0
L399:
	sethi %hi(_stack_block_stack),%o1
	st %o0,[%o1+%lo(_stack_block_stack)]
	sethi %hi(_nesting_stack),%o0
	ld [%o0+%lo(_nesting_stack)],%o0
	ld [%o0+8],%i1
	sethi %hi(_block_stack),%i0
	sethi %hi(_nesting_stack),%l1
	sethi %hi(_nesting_depth),%l0
	ld [%i0+%lo(_block_stack)],%o0
L402:
	ld [%o0+4],%o1
	st %o1,[%i0+%lo(_block_stack)]
	ld [%o0],%o1
	st %o1,[%l1+%lo(_nesting_stack)]
	ld [%o0+8],%o1
	call _free,0
	st %o1,[%l0+%lo(_nesting_depth)]
	ld [%l0+%lo(_nesting_depth)],%o0
	cmp %o0,%i1
	bg L402
	ld [%i0+%lo(_block_stack)],%o0
	ret
	restore
	.align 4
	.global _expand_decl
	.proc	020
_expand_decl:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_block_stack),%o0
	cmp %i1,0
	be L404
	ld [%o0+%lo(_block_stack)],%l0
	mov %i0,%o0
	mov %i1,%o1
	call _temp_tree_cons,0
	ld [%l0+28],%o2
	st %o0,[%l0+28]
	sethi %hi(_stack_block_stack),%o0
	st %l0,[%o0+%lo(_stack_block_stack)]
L404:
	cmp %i0,0
	bne,a L405
	ldub [%i0+12],%o0
	cmp %i1,0
	bne L403
	nop
	call _abort,0
	nop
L405:
	cmp %o0,43
	bne L403
	ld [%i0+8],%i1
	ld [%i0+12],%o1
	sethi %hi(10485760),%o0
	andcc %o1,%o0,%g0
	bne L403
	sethi %hi(_error_mark_node),%o0
	ld [%o0+%lo(_error_mark_node)],%o0
	cmp %i1,%o0
	bne,a L409
	ld [%i0+24],%o0
	sethi %hi(_const0_rtx),%o2
	mov 37,%o0
	mov 26,%o1
	call _gen_rtx,0
	ld [%o2+%lo(_const0_rtx)],%o2
	b L410
	st %o0,[%i0+64]
L409:
	cmp %o0,0
	bne,a L411
	ld [%i0+28],%o0
	ld [%i0+60],%o0
	cmp %o0,0
	bne L412
	nop
	ld [%i0+28],%o0
	call _assign_stack_local,0
	mov 0,%o1
	b L410
	st %o0,[%i0+64]
L412:
	call _gen_reg_rtx,0
	mov 4,%o0
	mov %o0,%o2
	mov 37,%o0
	call _gen_rtx,0
	mov 26,%o1
	b L410
	st %o0,[%i0+64]
L411:
	cmp %o0,26
	be L415
	sethi %hi(_flag_float_store),%o0
	ld [%o0+%lo(_flag_float_store)],%o0
	cmp %o0,0
	be,a L435
	ld [%i0+12],%o1
	ldub [%i1+12],%o0
	cmp %o0,6
	be,a L436
	ld [%i0+24],%o0
	ld [%i0+12],%o1
L435:
	sethi %hi(1064960),%o0
	andcc %o1,%o0,%g0
	bne,a L436
	ld [%i0+24],%o0
	sethi %hi(8192),%o0
	andcc %o1,%o0,%g0
	bne L417
	sethi %hi(_obey_regdecls),%o0
	ld [%o0+%lo(_obey_regdecls)],%o0
	cmp %o0,0
	bne,a L436
	ld [%i0+24],%o0
L417:
	call _gen_reg_rtx,0
	ld [%i0+28],%o0
	mov %o0,%o1
	st %o1,[%i0+64]
	ldub [%i1+12],%o0
	cmp %o0,11
	bne,a L437
	ld [%i0+64],%o1
	call _mark_reg_pointer,0
	mov %o1,%o0
	ld [%i0+64],%o1
L437:
	ld [%o1],%o0
	or %o0,16,%o0
	b L410
	st %o0,[%o1]
L415:
	ld [%i0+24],%o0
L436:
	ld [%o0+12],%o1
	sethi %hi(131072),%o0
	andcc %o1,%o0,%g0
	be,a L420
	mov 1,%o0
	ld [%i0+64],%o1
	cmp %o1,0
	be L421
	mov 0,%i1
	lduh [%o1],%o0
	cmp %o0,37
	bne L423
	nop
	ld [%o1+4],%o0
	lduh [%o0],%o0
	cmp %o0,34
	be,a L422
	ld [%i0+64],%o0
L423:
	call _abort,0
	nop
L422:
	ld [%o0+4],%i1
L421:
	ld [%i0+24],%o1
	ldub [%i0+32],%o0
	call .umul,0
	ld [%o1+16],%o1
	addcc %o0,7,%o1
	bneg,a L424
	add %o0,14,%o1
L424:
	ld [%i0+28],%o0
	call _assign_stack_local,0
	sra %o1,3,%o1
	cmp %i1,0
	be L425
	st %o0,[%i0+64]
	ld [%o0+4],%o0
	call _force_operand,0
	mov %i1,%o1
	mov %o0,%o1
	call _emit_move_insn,0
	mov %i1,%o0
L425:
	ld [%i0+64],%o2
	ld [%i0+8],%o0
	ldub [%o0+12],%o0
	cmp %o0,16
	be L427
	mov 0,%o1
	add %o0,-19,%o0
	and %o0,0xff,%o0
	cmp %o0,1
	bgu L438
	sll %o1,3,%o1
L427:
	mov 1,%o1
	sll %o1,3,%o1
L438:
	ld [%o2],%o0
	and %o0,-9,%o0
	or %o0,%o1,%o0
	b L410
	st %o0,[%o2]
L420:
	sethi %hi(_frame_pointer_needed),%o1
	st %o0,[%o1+%lo(_frame_pointer_needed)]
	ld [%l0+16],%o0
	cmp %o0,0
	bne,a L439
	ld [%i0+24],%o0
	call _do_pending_stack_adjust,0
	nop
	sethi %hi(_stack_pointer_rtx),%o0
	call _copy_to_reg,0
	ld [%o0+%lo(_stack_pointer_rtx)],%o0
	st %o0,[%l0+16]
	sethi %hi(_stack_block_stack),%o0
	st %l0,[%o0+%lo(_stack_block_stack)]
	ld [%i0+24],%o0
L439:
	ldub [%i0+32],%o1
	call _convert_units,0
	mov 8,%o2
	mov 0,%o1
	mov 0,%o2
	call _expand_expr,0
	mov 0,%o3
	mov %o0,%o1
	ldub [%i0+32],%o0
	andcc %o0,15,%g0
	be L430
	nop
	call _round_push,0
	mov %o1,%o0
	mov %o0,%o1
L430:
	call _anti_adjust_stack,0
	mov %o1,%o0
	sethi %hi(_stack_pointer_rtx),%o0
	call _copy_to_reg,0
	ld [%o0+%lo(_stack_pointer_rtx)],%o0
	mov %o0,%o2
	mov 37,%o0
	call _gen_rtx,0
	ld [%i0+28],%o1
	st %o0,[%i0+64]
L410:
	ld [%i0+12],%o1
	sethi %hi(1048576),%o0
	andcc %o1,%o0,%g0
	be L440
	sethi %hi(262144),%o0
	ld [%i0+64],%o1
	ld [%o1],%o0
	or %o0,16,%o0
	st %o0,[%o1]
	ld [%i0+12],%o1
	sethi %hi(262144),%o0
L440:
	andcc %o1,%o0,%g0
	be L441
	sethi %hi(_obey_regdecls),%o0
	ld [%i0+64],%o1
	ld [%o1],%o0
	or %o0,32,%o0
	st %o0,[%o1]
	sethi %hi(_obey_regdecls),%o0
L441:
	ld [%o0+%lo(_obey_regdecls)],%o0
	cmp %o0,0
	be L403
	nop
	call _use_variable,0
	ld [%i0+64],%o0
L403:
	ret
	restore
	.align 4
	.global _expand_decl_init
	.proc	020
_expand_decl_init:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ld [%i0+12],%o1
	sethi %hi(2097152),%o0
	andcc %o1,%o0,%g0
	bne L442
	sethi %hi(_error_mark_node),%o0
	ld [%i0+60],%o1
	ld [%o0+%lo(_error_mark_node)],%o0
	cmp %o1,%o0
	bne,a L444
	ld [%i0+60],%o0
	ld [%i0+8],%o0
	ldub [%o0+12],%o1
	add %o1,-5,%o0
	cmp %o0,1
	bleu L446
	cmp %o1,8
	be L446
	cmp %o1,11
	bne L449
	nop
L446:
	sethi %hi(_integer_zero_node),%o1
	ld [%i0+8],%o0
	call _convert,0
	ld [%o1+%lo(_integer_zero_node)],%o1
	mov %o0,%o1
	b L450
	mov %i0,%o0
L444:
	cmp %o0,0
	be L442
	nop
	ldub [%o0+12],%o0
	cmp %o0,3
	be L442
	nop
	ld [%i0+16],%o0
	call _emit_line_note,0
	ld [%i0+20],%o1
	mov %i0,%o0
	ld [%i0+60],%o1
L450:
	mov 0,%o2
	call _expand_assignment,0
	mov 0,%o3
L449:
	call _emit_queue,0
	nop
L442:
	ret
	restore
