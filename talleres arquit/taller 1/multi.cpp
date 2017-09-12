#include <conio.h>
#include <stdio.h>
#include <iostream>

 int multipli(int num,int multi){
 int resul=0;
    if ( num == 0 || multi == 0 )
    {
    	resul=0;
      
       
}

    if(num==1){
    	resul=multi;
    	
    
    	
      }
      
      if(num>1&&num>1){
      int	inc=1;
      resul=0;
      	while(inc<=multi)
      	
      	{
      		resul=resul+num;
      		inc +=1;
		  }
      	return resul;
      	 
	  }
}

  
int main()
{
	int x = 5;
	int y= 0;
	int result=0;
	result= multipli(x,y);
    
	
    return result;
}
