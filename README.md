# LM2021

   nasm -f win32 main.asm
   nasm -f win32 asm_io.asm
   gcc -c -o driver.obj driver.c
   gcc -o main driver.obj main.obj asm_io.obj
