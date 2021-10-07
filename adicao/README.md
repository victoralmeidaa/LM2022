# 
Este programa demonstra como funciona a instrução de Adição e Impressão
de valores inteiros

 ------------------------------
 Como compilar o programa(Usando o programa cygwin terminal do desktop ou linux):

 Sao umas 5 rotinas

 Estrelas e o codigo a ser executado
 O menos embaixo e o comentario

 * nasm -f win32 Adicao.asm				
 - arquivo: Adicao.obj e criado			

 * nasm -f win32 asm_io.asm              
 - arquivo: asm_io.obj e criado			

 * gcc -c -o driver.obj driver.c							
 - driver.c e compilado e arquivo driver.obj e criado		

 * gcc -o Adicao driver.obj Adicao.obj asm_io.obj			
 - os arquivos objeto sao ligados / 						
 - linkados e o executuvel Adicao.exe e criado

 * ./Adicao.exe
 - arquivo .exe gerado é executado 
 -----------------------------
