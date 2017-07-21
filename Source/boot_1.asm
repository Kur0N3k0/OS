[org 0]
  jmp 0x07c0:start
[bits 16]

;
; Kernel Load MBR
; ah : Service Number, BIOS Call number
; al : NumOfSector
; ch : Sylinder
; cl : Sector Idx
; dh : Head
; dl : Drive Type
;

start:
  mov ax, 0x1000
  mov es, ax
  mov bx, 0x00

  mov ah, 2
  mov al, 1
  mov ch, 0
  mov cl, 2
  mov dh, 0
  mov dl, 0
  int 0x13  ; read
  jc start  ; If error, set cf.

  jmp 0x1000:0000 ; goto Kernel.bin

times 510-($-$$) db 0
dw 0xAA55
