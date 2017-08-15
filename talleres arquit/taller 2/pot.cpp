#include <conio.h>
#include <stdio.h>

int main()
{
    int num, exp, resul;

    printf( "\n   Introduzca numero (entero): " );
    scanf( "%d", &num );
    printf( "\n   Introduzca exp (entero): " );
    scanf( "%d", &exp );

    if ( num  >0 && exp == 0 )
    {
    	resul=1;
       printf( "\n  %d pot %d = %d.",num,exp,resul ,163 );
       
}

    if(exp==1){
    	resul=num;
    	
    	 printf( "\n  %d pot %d = %d.",num,exp,resul ,163 );
    	
      }
      
      if(num>1&&exp>1){
      int	inc=1;
      resul=1;
      	while(inc<=exp)
      	
      	{
      		resul=resul*num;
      		inc++;
		  }
      	
      	 printf( "\n  %d pot %d = %d.",num,exp,resul ,163 );
	  }

    return 0;
}
