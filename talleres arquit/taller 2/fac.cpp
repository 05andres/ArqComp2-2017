#include <conio.h>
#include <stdio.h>
#include <iostream>
using namespace std;

int a,b,factorial;

int main (void)
{
    cout << "Este programa calculara el factorial del numero entero que ingrese \nPor favor ingrese su numero " <<endl;
    cin >> a;
    factorial=1;
    for (b=1 ; b<=a ; b++)
    {
         factorial=b*factorial;
    }
    
    cout << "El factorial del numero ingresado es " <<factorial<<endl;
    
    system("pause");
    return 0;
}
