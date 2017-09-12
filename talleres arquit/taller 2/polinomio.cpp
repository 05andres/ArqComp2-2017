#include <iostream> 
#include <string> 
# include<tgmath.h> 
#include <vector>


using namespace std;

int OperaT( vector<int>k, int n, int x) {
   int v;
   int p = x;
   vector<int>l;
   
   for (int i = 0; i < n; i++) 
   {
      v= pow(k[i],p);
      p--;
      l.push_back(v);
      
   }
    int sum=0;

   for (int j = 0;j <l.size(); j++)
   {
    sum = sum + l[j];
   }
return sum;

}

int calcuPoli(int n){

 int  i;
 
   vector<int>coe; 
   
 
   int t;
 
   for (int i = 1; i <= n; i++) 
   {
      cout<<"El coeficiente a " <<i<< " = ";
      cin>>t; 
      coe.push_back(t);
   }
   
   int valor=OperaT(coe, n, coe.size());
  return valor;
}

int main()
{
  int x =3;
  int result=0;
  result=calcuPoli(x);
  return result;
   
   
   
}
 
