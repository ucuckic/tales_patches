//s5 is main ptr
//+119E is party formation
0x9F01800:
  lbu a2,0x5(s0) //slot of chara, original code, should be Couleur himself
  lbu t0,0x9CE(s0) //caster slot, original code
  bne a2,t0,return //original code-ish
  nop
  addiu sp,sp,-0xC
  sw a0,0x0(sp)
  sw a1,0x4(sp)
  
  //code for getting closest chara
  move a0,a2 //Couleur as the character
  jal 0x9F01900 //closest chara func
  li a1,1 //allies only
  
  beq v0,a2,return_cleanup //no other character found
  nop
  
  j skip
  nop

return_cleanup:
  lw a1,0x4(sp)
  lw a0,0x0(sp)
  addiu sp,sp,0xC
return:
  move t0,v0
  j 0x08857F10
  nop
skip:
  lw a1,0x4(sp)
  lw a0,0x0(sp)
  addiu sp,sp,0xC
  j 0x08857F48
  lb a2,0x9CD(s0) //original code
  