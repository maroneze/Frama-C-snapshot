/* Generated by Frama-C */
#include "stdio.h"
#include "stdlib.h"
void __e_acsl_globals_init(void)
{
  static char __e_acsl_already_run = 0;
  if (! __e_acsl_already_run) {
    __e_acsl_already_run = 1;
    __e_acsl_store_block((void *)(& stdout),(size_t)8);
    __e_acsl_full_init((void *)(& stdout));
    __e_acsl_store_block((void *)(& stdin),(size_t)8);
    __e_acsl_full_init((void *)(& stdin));
    __e_acsl_store_block((void *)(& stderr),(size_t)8);
    __e_acsl_full_init((void *)(& stderr));
  }
  return;
}

int main(void)
{
  int __retres;
  __e_acsl_memory_init((int *)0,(char ***)0,(size_t)8);
  __e_acsl_globals_init();
  /*@ assert \valid(__fc_stderr); */
  {
    int __gen_e_acsl_valid;
    __gen_e_acsl_valid = __e_acsl_valid((void *)stderr,sizeof(FILE),
                                        (void *)stderr,(void *)(& stderr));
    __e_acsl_assert(__gen_e_acsl_valid,(char *)"Assertion",(char *)"main",
                    (char *)"\\valid(__fc_stderr)",8);
  }
  /*@ assert \valid(__fc_stdin); */
  {
    int __gen_e_acsl_valid_2;
    __gen_e_acsl_valid_2 = __e_acsl_valid((void *)stdin,sizeof(FILE),
                                          (void *)stdin,(void *)(& stdin));
    __e_acsl_assert(__gen_e_acsl_valid_2,(char *)"Assertion",(char *)"main",
                    (char *)"\\valid(__fc_stdin)",9);
  }
  /*@ assert \valid(__fc_stdout); */
  {
    int __gen_e_acsl_valid_3;
    __gen_e_acsl_valid_3 = __e_acsl_valid((void *)stdout,sizeof(FILE),
                                          (void *)stdout,(void *)(& stdout));
    __e_acsl_assert(__gen_e_acsl_valid_3,(char *)"Assertion",(char *)"main",
                    (char *)"\\valid(__fc_stdout)",10);
  }
  __retres = 0;
  __e_acsl_delete_block((void *)(& stdout));
  __e_acsl_delete_block((void *)(& stdin));
  __e_acsl_delete_block((void *)(& stderr));
  __e_acsl_memory_clean();
  return __retres;
}


