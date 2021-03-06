; Core state machine for the link menu

INCLUDE "game/src/common/constants.asm"

SECTION "Link Menu State Machine", ROMX[$4000], BANK[$7]
LinkMenuStateMachine:: ; 1c000 (7:4000)
  ld a, [CoreSubStateIndex]
  sub $14
  jr c, .jump_to_state
  ld a, [CoreSubStateIndex]
  sub $30
  jr nc, .jump_to_state
  call $607f
  ld a, [$c64e]
  or a
  jr z, .jump_to_state
  xor a
  ld [CoreStateIndex], a
  ld [CoreSubStateIndex], a
  ret
.jump_to_state
  call $5310
  ld a, [CoreSubStateIndex]
  ld hl, .table
  ld d, $00
  ld e, a
  sla e
  rl d
  add hl, de
  ld a, [hli]
  ld h, [hl]
  ld l, a
  jp hl
.table
  dw LinkMenuStateMachineInitialize
  dw $40c1
  dw $40f4
  dw $40ff
  dw $4135
  dw $414a
  dw $415f
  dw LinkMenuStateMachineRet
  dw $4177
  dw $40f4
  dw $40ff
  dw LinkMenuStateMachineDrawSavingTileset
  dw $41bf
  dw $41dc
  dw $41ea
  dw $4200
  dw $4220
  dw $422b
  dw $423c
  dw $40a5
  dw LinkMenuStateMachineLoadMainTilemap
  dw $409b
  dw LinkMenuStateMachineMainMenuSteadyState
  dw LinkMenuStateMachineMainMenuOptionSelected
  dw $438f
  dw $43e8
  dw $441b
  dw $40a5
  dw $4440
  dw LinkMenuStateMachineRet
  dw LinkMenuStateMachineRet
  dw LinkMenuStateMachineRet
  dw $44d6
  dw $44ff
  dw LinkMenuStateBattleEncounterScreenLoadPortraits
  dw $409b
  dw $45d3
  dw $45f3
  dw $460e
  dw $461a
  dw $463b
  dw $464f
  dw $40a5
  dw $4667
  dw LinkMenuStateMachineRet
  dw LinkMenuStateMachineRet
  dw LinkMenuStateMachineRet
  dw LinkMenuStateMachineRet
  dw $4671
  dw $4679
  dw $468c
LinkMenuStateMachineRet::
  ret

SECTION "Link Menu States Partial 1", ROMX[$40af], BANK[$7]
LinkMenuStateMachineInitialize:: ; 1c0af (7:40af)
  ld b, $03
  call JumpLoadMainDialogTileset
  ld a, [$c64e]
  or a
  ret nz
  ld a, $01
  call JumpSetupDialog
  jp JumpIncSubStateIndexWrapper

SECTION "Link Menu States Partial 2", ROMX[$4185], BANK[$7]
LinkMenuStateMachineDrawSavingTileset: ; 1c185 (7:4185)
  ld a, [$c6f0]
  or a
  jp nz, .selected_no
  ld a, $02
  ld [$ffa0], a
  ld a, $01
  call JumpSetupDialog
  call $535d
  xor a
  ld [$c740], a
  ld a, [$c0d4]
  ld [$c900], a
  ld a, [$c0d5]
  ld [$c901], a
  ld a, $00
  ld [$c797], a
  ld b, $01
  ld c, $01
  ld e, $3a
  call JumpTable_183
  jp JumpIncSubStateIndexWrapper
.selected_no
  ld a, $05
  ld [CoreSubStateIndex], a
  ret
; 0x1c1bb

SECTION "Link Menu States Partial 3", ROMX[$4272], BANK[$7]
LinkMenuStateMachineLoadMainTilemap:: ; 1c272 (7:4272)
  xor a
  ld [$c765], a
  ld [$c766], a
  ld [$c767], a
  call JumpTable_156
  ld b, $00
  ld c, $00
  ld e, $b5
  call JumpLoadTilemap
  ld b, $05
  ld c, $03
  ld e, $b2
  call JumpLoadTilemap
  ld a, $01
  ld [$c5c8], a
  xor a
  ld [$c5c7], a
  call JumpTable_1ce
  xor a
  ld [$c5a2], a
  ld [$c5a3], a
  ld [$c6f0], a
  ld b, $05
  ld c, $05
  ld d, $05
  ld e, $05
  ld a, $02
  call JumpTable_309
  ld a, $05
  ld [$ffa0], a
  ld a, $08
  call JumpTable_17d
  jp JumpIncSubStateIndexWrapper
; 0x1c2c0
LinkMenuStateMachineMainMenuSteadyState:: ; 1c2c0 (7:42c0)
  ld a, [SerIO_ProcessInByte]
  sub $02
  ld b, a
  jr c, .asm_1c2e2
  push bc
  ld a, [$c6f0]
  ld b, a
  ld a, $01
  call LinkMenuLoadSelectorTilemap
  pop bc
  ld a, b
  ld [$c6f0], a
  xor a
  ld [$c740], a
  ld a, $04
  ld [$ffa1], a
  jp JumpIncSubStateIndexWrapper
.asm_1c2e2
  ld a, [$c6f0]
  ld b, a
  ld a, $00
  call LinkMenuLoadSelectorTilemap
  ld a, [hJPInputChanged]
  and hJPInputA | hJPInputStart
  jp nz, $4301
  ld a, [hJPInputChanged]
  and hJPInputUp
  jp nz, $431e
  ld a, [hJPInputChanged]
  and hJPInputDown
  jp nz, $4338
  ret
; 0x1c301

SECTION "Link Menu States Partial 4", ROMX[$4356], BANK[$7]
LinkMenuStateMachineMainMenuOptionSelected:: ; 1c356 (7:4356)
  ld a, [$c740]
  inc a
  ld [$c740], a
  sub $14
  jr c, .asm_1c377
  ld a, [$c6f0]
  ld b, a
  ld a, $00
  call LinkMenuLoadSelectorTilemap
  ld a, [$c740]
  sub $3c
  ret c
  xor a
  ld [$c740], a
  jp JumpIncSubStateIndexWrapper
.asm_1c377
  ld a, [SerIO_Connected]
  or a
  jr z, .asm_1c385
  ld a, [$c6f0]
  inc a
  ld [SerIO_ProcessOutByte], a
  ret
.asm_1c385
  ld a, [SerIO_ProcessInByte]
  or a
  ret z
  dec a
  ld [$c6f0], a
  ret
; 0x1c38f

SECTION "Link Menu States Partial 5", ROMX[$459E], BANK[$7]
LinkMenuStateBattleEncounterScreenLoadPortraits::
  call JumpTable_255
  ld a, [$C740]
  cp $FF
  ret nz
  ld a, $20
  ld [$C5AA], a
  ld a, 1
  ld [$C6BF], a
  ld hl, $C6B0
  ld a, $40
  ld [hli], a
  xor a
  ld [hli], a
  ld a, $E0
  ld [hli], a
  ld a, $60
  ld [hli], a
  xor a
  ld [hli], a
  ld a, $20
  ld [hli], a
  ld a, 2
  call JumpTable_17d
  ld a, $1C
  ldh [$FFA0], a
  call LinkMenu_GetCurrentRecvBufferOffset
  jp JumpIncSubStateIndexWrapper

SECTION "Link Menu States Partial 6", ROMX[$5377], BANK[$7]
LinkMenuLoadSelectorTilemap: ; 1d377 (7:5377)
  ld e, $b3
  add e
  ld e, a
  ld a, b
  sla b
  add b
  ld b, a
  ld a, $02
  add b
  ld c, a
  ld b, $04
  call JumpLoadTilemap
  ret
; 0x1d34b

SECTION "Link Menu Buffer String Position Tracking", ROMX[$5D2C], BANK[$7]
LinkMenu_GetCurrentRecvBufferOffset::
  ld a, [SerIO_RecvBufferRead]
  ld [$DA3E], a
  ret
