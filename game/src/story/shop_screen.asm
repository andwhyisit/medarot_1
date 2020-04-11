SECTION "Load Shop Menu - Parts", ROMX[$45af], BANK[$3]
LoadShopPartsMenu:
  call $47a0
  ld [$c883], a
  ld a, [$c88a]
  ld c, a
  ld a, [hli]
  cp $ff
  jp z, $469f
  push hl
  push af
  ld b, $0
  call $0294
  ld hl, cBUF01
  ld b, $4
  ld c, $4
  call $02f4
  pop af
  call $4593
  ld b, $c
  ld c, $4
  call $01dd
  push hl
  pop bc
  ld h, $0
  ld a, [$c884]
  ld l, a
  call $01ec
  ld b, $10
  ld c, $4
  ld e, $19
  call $02ca
  pop hl
  ld a, [$c88a]
  ld c, a
  ld a, [hli]
  cp $ff
  jp z, $469f
  push hl
  push af
  ld b, $0
  call $0294
  ld hl, cBUF01
  ld b, $4
  ld c, $6
  call $02f4
  pop af
  call $4593
  ld b, $c
  ld c, $6
  call $01dd
  push hl
  pop bc
  ld h, $0
  ld a, [$c884]
  ld l, a
  call $01ec
  ld b, $10
  ld c, $6
  ld e, $19
  call $02ca
  pop hl
  ld a, [$c88a]
  ld c, a
  ld a, [hli]
  cp $ff
  jp z, $469f
  push hl
  push af
  ld b, $0
  call $0294
  ld hl, cBUF01
  ld b, $4
  ld c, $8
  call $02f4
  pop af
  call $4593
  ld b, $c
  ld c, $8
  call $01dd
  push hl
  pop bc
  ld h, $0
  ld a, [$c884]
  ld l, a
  call $01ec
  ld b, $10
  ld c, $8
  ld e, $19
  call $02ca
  pop hl
  ld a, [$c88a]
  ld c, a
  ld a, [hli]
  cp $ff
  jp z, $469f
  push af
  ld b, $0
  call $0294
  ld hl, cBUF01
  ld b, $4
  ld c, $a
  call $02f4
  pop af
  call $4593
  ld b, $c
  ld c, $a
  call $01dd
  push hl
  pop bc
  ld h, $0
  ld a, [$c884]
  ld l, a
  call $01ec
  ld b, $10
  ld c, $a
  ld e, $19
  call $02ca
  ret
; 0xc6a0
LoadShopPartsMenuSell:
  ld a, [$c88a]
  ld c, a
  call $016b
  ld [$c883], a
  call $4815
  cp $ff
  jp z, $479f
  push af
  ld a, [$c88a]
  ld c, a
  ld a, [$c886]
  ld b, $0
  call $0294
  ld hl, cBUF01
  ld b, $4
  ld c, $4
  call $02f4
  ld b, $d
  ld c, $4
  call $01dd
  push hl
  pop bc
  pop af
  ld h, $0
  ld l, a
  call $01ec
  ld b, $11
  ld c, $4
  ld e, $18
  call $02ca
  ld a, [$c886]
  inc a
  ld [$c886], a
  call $4815
  cp $ff
  jp z, $479f
  push af
  ld a, [$c88a]
  ld c, a
  ld a, [$c886]
  ld b, $0
  call $0294
  ld hl, cBUF01
  ld b, $4
  ld c, $6
  call $02f4
  ld b, $d
  ld c, $6
  call $01dd
  push hl
  pop bc
  pop af
  ld h, $0
  ld l, a
  call $01ec
  ld b, $11
  ld c, $6
  ld e, $18
  call $02ca
  ld a, [$c886]
  inc a
  ld [$c886], a
  call $4815
  cp $ff
  jp z, $479f
  push af
  ld a, [$c88a]
  ld c, a
  ld a, [$c886]
  ld b, $0
  call $0294
  ld hl, cBUF01
  ld b, $4
  ld c, $8
  call $02f4
  ld b, $d
  ld c, $8
  call $01dd
  push hl
  pop bc
  pop af
  ld h, $0
  ld l, a
  call $01ec
  ld b, $11
  ld c, $8
  ld e, $18
  call $02ca
  ld a, [$c886]
  inc a
  ld [$c886], a
  call $4815
  cp $ff
  jp z, $479f
  push af
  ld a, [$c88a]
  ld c, a
  ld a, [$c886]
  ld b, $0
  call $0294
  ld hl, cBUF01
  ld b, $4
  ld c, $a
  call $02f4
  ld b, $d
  ld c, $a
  call $01dd
  push hl
  pop bc
  pop af
  ld h, $0
  ld l, a
  call $01ec
  ld b, $11
  ld c, $a
  ld e, $18
  call $02ca
  ret
; 0xc7a0