[org 0]
  jmp 0x07c0:start
[bits 16]
start:
  mov ax, cs ;cs = 0x7c00
  mov ds, ax

  mov ax, 0xB800
  mov es, ax
  mov di, 0x00
  mov ax, word[BackMsg]
  mov cx, 0x7ff

paint:
  mov word[es:di], ax
  add di, 2
  dec cx
  jnz paint

  mov di, 0x00
  mov byte[es:di], 'K'
  inc di
  mov byte[es:di], 0x06
  inc di
  mov byte[es:di], 'u'
  inc di
  mov byte[es:di], 0x06
  inc di
  mov byte[es:di], 'r'
  inc di
  mov byte[es:di], 0x06
  inc di
  mov byte[es:di], 'o'
  inc di
  mov byte[es:di], 0x06
  inc di
  mov byte[es:di], 'N'
  inc di
  mov byte[es:di], 0x06
  inc di
  mov byte[es:di], 'e'
  inc di
  mov byte[es:di], 0x06
  inc di
  mov byte[es:di], 'k'
  inc di
  mov byte[es:di], 0x06
  inc di
  mov byte[es:di], 'o'
  inc di
  mov byte[es:di], 0x06
  inc di

BackMsg db '.', 0x67
times 510-($-$$) db 0
dw 0xAA55
