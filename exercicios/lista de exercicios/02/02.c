#include <stdio.h>
#include <stdlib.h>

main(){
    int num[10];
    unsigned int i,min,soma;
    soma = 0; min = ~0;
    for(i = 0 ; i <= 3 ; i++){
        printf("%d - Informe %d Numero: ",i,i+1);
        scanf("%d",&num[i]);
    }
    for (i = 0; i <= 3; i++){
        if (min > num[i]){
            min = num[i];
        }   
    }
    for ( i = 0; i <= 3; i++){
        if (min != num[i]){
            soma += num[i];
        }
        
    }
    
    printf("menor: %d \n",min);
    printf("soma: %d",soma);
}