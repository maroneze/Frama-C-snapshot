/* Generated by Frama-C */
#include "stdio.h"
#include "stdlib.h"
int main(void)
{
  int __retres;
  __e_acsl_memory_init((int *)0,(char ***)0,(size_t)8);
  int x = 0;
  int y = 1;
  /*@ assert x < y; */
  __e_acsl_assert(x < y,(char *)"Assertion",(char *)"main",(char *)"x < y",7);
  /*@ requires x ≡ 0;
      ensures x ≥ 1; */
  {
    __e_acsl_assert(x == 0,(char *)"Precondition",(char *)"main",
                    (char *)"x == 0",8);
    if (x) 
      /*@ assert \false; */
      __e_acsl_assert(0,(char *)"Assertion",(char *)"main",(char *)"\\false",
                      11);
    else {
      /*@ requires x ≡ 0;
          ensures x ≡ 1; */
      {
        __e_acsl_assert(x == 0,(char *)"Precondition",(char *)"main",
                        (char *)"x == 0",13);
        x ++;
        __e_acsl_assert(x == 1,(char *)"Postcondition",(char *)"main",
                        (char *)"x == 1",14);
      }
      if (x) {
        /*@ requires x ≡ 1;
            ensures x ≡ 2; */
        {
          __e_acsl_assert(x == 1,(char *)"Precondition",(char *)"main",
                          (char *)"x == 1",17);
          x ++;
          __e_acsl_assert(x == 2,(char *)"Postcondition",(char *)"main",
                          (char *)"x == 2",18);
        }
      }
      else 
        /*@ assert \false; */
        __e_acsl_assert(0,(char *)"Assertion",(char *)"main",
                        (char *)"\\false",21);
    }
    __e_acsl_assert(x >= 1,(char *)"Postcondition",(char *)"main",
                    (char *)"x >= 1",9);
  }
  __retres = 0;
  return __retres;
}


