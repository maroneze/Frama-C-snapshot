int t1[]  = {1,2,3,4,5,6,7,8,9};
int t2[]  = {11,12,13,14,15,16,17,18,19};
#include "any_int.c"
void main () {
  int i,j=10,k=88,c,*p,LT[10]={1};
  i = any_int(); c= any_int();
  if (i>=0 && i<=8 ) 
    {CEA_I(i);p=(c?t1:t2)+i;j = *p+1-1;
    k = LT[-i-1] + 1 -1 ;
      }

}