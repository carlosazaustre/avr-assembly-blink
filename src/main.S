;
;  Program: Blink.S
;  Description: Blink a LED connected to the port B of the ATmega328P
;  Author: Carlos Azaustre
;  Created: 06/05/2024
;

#include <avr/io.h>

.org 0      ; Dirección de reset del microcontrolador (0x0000)
rjmp setup  ; Salta a la función setup

setup: 
.global main ; Indica que la función máin es global y puede ser llamada desde C

main:
  ; Configura el bit 2 (PB2) y el 5 (PB5) del puerto B como salida
  ldi r16, 0b00100100         
  out _SFR_IO_ADDR(DDRB), r16 

  ; Inicializa el puerto B a 0
  ldi r17, 0x00
  out _SFR_IO_ADDR(PORTB), r17 

loop:
  ; Enciende los LED conectados a PB2 y PB5 (Pin 10 y 13 de Arduino UNO)
  out _SFR_IO_ADDR(PORTB), r16 
  call delay_2s
  ; Apaga los LED conectados a PB2 y PB5
  out _SFR_IO_ADDR(PORTB), r17
  call delay_2s
  ; Salta a la etiqueta loop y vuelve a ejecutar el bucle
  rjmp loop

delay_2s:
  ; Assembly code auto-generated
  ; by utility from Bret Mulvey
  ; Delay 16 000 000 cycles
  ; 2s at 8.0 MHz

    ldi  r20, 82
    ldi  r21, 43
    ldi  r22, 0
L1: dec  r22
    brne L1
    dec  r21
    brne L1
    dec  r20
    brne L1
    lpm
    nop
    ret
