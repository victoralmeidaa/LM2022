#include <stdio.h>
#include <stdlib.h>

main (){
    int op = 0;
    int taxa, gasto, consumo, cont;
    printf("Informe tipo de consumidor\n1 - Residencial\n2 - Comercial\n3 - Industrial\nOpcao:");
    scanf("%d",&op);
    printf("Informe o consumo em metros cubicos: ");
    scanf("%d",&consumo);

    
    switch (op)
    {
    case 1:
        taxa = 5;
        gasto = taxa + (2*consumo);
        break;
    case 2:
        if (consumo <= 80){
            taxa = 500;
            gasto = taxa;
        }else {
            taxa = 500;
            cont = consumo - 80;
            gasto = taxa + (25*cont);
        }
        break;
    case 3: 
        if(consumo <= 100){
            taxa = 800;
            gasto = taxa;
        }else{
            taxa = 800;
            cont = consumo - 100;
            gasto = taxa + (40*cont);
        }
        break;   
    default:
        break;
    }
    printf("Conta: %d",gasto);
}