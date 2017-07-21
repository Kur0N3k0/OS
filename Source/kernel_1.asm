[org 0]
[bits 16]

start:
  mov ax, cs  ; cs = 0x1000
  mov ds, ax
  xor ax, ax
  mov ss, ax
  lea esi, [msgData]
  mov ax, 0xb800
  mov es, ax
  mov edi, 0
  call printf
  jmp $

printf:
  push eax

printf_loop:
  mov al, byte[esi]
  mov byte[es:edi], al
  or al, al
  jz printf_end
  inc edi
  mov byte[es:edi], 0x06
  inc esi
  inc edi
  jmp printf_loop

printf_end:
  pop eax
  ret

msgData db "KuroNeko's Kenrel.. WOW!", 0
