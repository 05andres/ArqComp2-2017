#include <conio.h>
#include <stdio.h>
#include <iostream>
using namespace std;

int factorial (int a){

  int b,factorial=1;
  for (b=1 ; b<=a ; b++)
    {
         factorial=b*factorial;
    }
    return factorial;
    
}

int main ()

{
int x=3;
int result=0;

result=factorial(x);
return result;	
 
}
