#include <conio.h>
#include <stdio.h>
#include <iostream>


int main()
{
    int num, multi, resul;

    printf( "\n   Introduzca dividendo (entero): " );
    scanf( "%d", &num );
    printf( "\n   Introduzca divisor (entero): " );
    scanf( "%d", &multi );

    if ( num == 0 || multi == 0 )
    {
    	resul=0;
       printf( "\n  %d mult %d = %d.",num,multi,resul ,163 );
       
}

    if(num==1){
    	resul=multi;
    	
    	 printf( "\n  %d mult %d = %d.",num,multi,resul ,163 );
    	
      }
      
      if(num>1&&num>1){
      int	inc=1;
      resul=0;
      	while(inc<=multi)
      	
      	{
      		resul=resul+num;
      		inc +=1;
		  }
      	
      	 printf( "\n  %d mult %d = %d.",num,multi,resul ,163 );
	  }

    return 0;
}
