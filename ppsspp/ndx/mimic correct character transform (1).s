//s0 character ptr of mimic
0x9F02200:
  lbu t0,0x9CE(s0) //load shortcut user
  lbu t1,0x5(s0) //load ID
  
  beq t0,t1,self_use
  nop
  
  j return
  lbu a0,0x9CE(s0) //original code, fixed to use shortcut slot
self_use:
  addiu sp,sp,-0x4
  sw a0,0x0(sp)

  move a0,t1 //Couleur
  jal 0x9F01900 //closest chara func
  li a1,1 //ally only
  
  lw a0,0x0(sp)
  addiu sp,sp,0x4
  
  //no error handling cause this shouldn't run if there was no target?
  //beq v0,t1,return //same so we skip
  //nop

  move a0,v0 //copy new target
return:
  j 0x08857340
  lui a1,0x8AF //original code
 