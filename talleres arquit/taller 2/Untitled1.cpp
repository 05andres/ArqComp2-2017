#include <iostream>
#include <stdio.h>
#include <stdlib.h>

	

int divi(int a, int b){
	int z=0;
	for(int cont=1;cont<=b;cont+=1){
		z=z+a;
	}
	
	return z;
	
}
	
int main(){	
	int x=5;
	int y=4;
	
	int result = divi(x,y);	
	
	return result;
}		
