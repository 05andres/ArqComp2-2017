/* Programa: División entera con restas sucesivas */

#include <conio.h>
#include <stdio.h>

#include <iostream>
using namespace std;


    int div(int  dividendo, int divisor){
	
    
    int resto=0;
    int cociente=0;
    
    if(divisor==0){
     cout<<"error"<<endl;	
    exit(0);
	}

    if ( dividendo > 0 && divisor > 0 )
    {
        cociente = 0;
        resto = dividendo;

        while ( resto >= divisor )
        {
            resto -= divisor;
            cociente++;
        }

        return cociente;
    }
   
}

int main()
{
  int x=6;
  int y=0;
  int result=0;
  
  
  result=div(x,y);

    return result;
}
