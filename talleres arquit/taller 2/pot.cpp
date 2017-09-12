#include <conio.h>
#include <stdio.h>

int pot(int num, int exp){

int  resul=0;

   

    if ( num  >0 && exp == 0 )
    {
    	resul=1;  
}

    if(exp==1){
    	resul=num;
    	
      }
      
      if(num>1&&exp>1){
      int	inc=1;
      resul=1;
      	while(inc<=exp)
      	
      	{
      		resul=resul*num;
      		inc++;
		  }
     
	  }
	  return resul;
	  
}



int main()
{
  int x=5;
  int y=2;
  int result = 0;
  result=pot(x,y);
    return result;
}
