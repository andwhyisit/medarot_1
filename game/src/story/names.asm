SECTION "Setup Initial Name Screen", ROMX[$4a9f], BANK[$1]
SetupInitialNameScreen: ;4a9f
  xor a
  ld hl, $c5c9
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld hl, cNAME
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [$c6c6], a
  ld hl, cBUF01
  ld a, $7
  rst $8 ; SetInitialName
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  ld a, $2
  call $015f
  ld a, $3
  call $015f
  ld b, $0
  ld c, $0
  ld e, $2
  call $015c
  ld b, $2
  ld c, $6
  ld e, $2b
  call $015c
  ld b, $1
  ld c, $1
  ld e, $29
  call $015c
  ld hl, cBUF01
  ld bc, $984a
  call $0264
  call $5213
  ld a, $1
  ld [$ffa0], a
  ld a, $4
  call $017d
  ld b, $5
  ld c, $5
  ld d, $5
  ld e, $5
  ld a, $2
  call $0309
  jp $0168

;TODO: Properly disassemble this routine which draws the OAM for the setup screen
SECTION "Setup Initial Name Screen OAM", ROMX[$4b2e], BANK[$1]
  ld a, $88 ; Initial tilemap position for spinning coin marker

SECTION "Copy from buffer to &NAME", ROMX[$4f1d], BANK[$1]
  ld hl, cBUF01
  ld de, cNAME
  ld b, $9
.asm_4f25
  ld a, [hli]
  ld [de], a
  inc de
  dec b
  jr nz, .asm_4f25 ; 0x4f29 $fa
  ret
; 0x4f2c

SECTION "Clear Buffer", ROMX[$4efc], BANK[$1]
ClearBuf: ; 4efc
  ld hl, $c757
  xor a
  ld b, $8
.asm_4f02
  ld [hli], a
  dec b
  jr nz, .asm_4f02 ; 0x4f04 $fc
  xor a
  ld hl, $c5c9
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld hl, cBUF01
  ld [hli], a ; Empty string
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ret
; 0x4f1d

SECTION "Save name screen to buf", ROMX[$5058], BANK[$1]
NameScreenSaveToBuf: ; 5058
  ld a, $5
  ld [$ffa1], a
  ld a, [$c222]
  ld [$ff8f], a
  ld a, [$c223]
  add $4
  ld [$ff8e], a
  call $01b3
  di
  call $016e
  ld a, [hl]
  ei
  cp $ec
  jp z, $50cc
  cp $ed
  jp z, $5129
  cp $fc
  jp z, $51ac
  ld a, [$c5ce]
  cp $8
  jp z, $5187
  di
  call $016e
  ld a, [hl]
  ei
  ld [$c64e], a
  ld hl, cBUF01
  ld a, [$c5ce]
  ld b, $0
  ld c, a
  add hl, bc
  ld a, [$c64e]
  ld [hl], a
  ld hl, $984a
  ld a, [$c5ce]
  ld b, $0
  ld c, a
  add hl, bc
  ld a, [$c64e]
  di
  call $016e
  ld [hl], a
  ei
  ld a, [$c5ce]
  inc a
  ld [$c5ce], a
  ld a, [$c1e2]
  add $8
  ld [$c1e2], a
  ld a, $1
  ld [$c600], a
  call $5213
  jp $5187
; 0x50cc

SECTION "Load name from buffer", ROMX[$6549], BANK[$1b] ; Happens when you get initial set of parts
NameToBuf: ; 5058
  ld a, $1
  ld [de], a
  ld hl, $0001
  add hl, de
  ld a, [$c756]
  ld [hl], a
  ld hl, $000d
  add hl, de
  ld a, $bc
  ld [hli], a
  ld [hli], a
  ld [hli], a
  ld [hl], a
  ld hl, $0002
  add hl, de
  ld de, cBUF01
  ld b, $9
.asm_6e567
  ld a, [de]
  inc de
  ld [hli], a
  dec b
  jr nz, .asm_6e567 ; 0x6e56b $fa
  xor a
  pop bc
  pop de
  pop hl
  ret
; 0x6e572