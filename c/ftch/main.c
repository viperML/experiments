#include <stdio.h>

extern int integrate(int from, int to);
_Noreturn extern void myexit(void);

int main() {
  int res = integrate(0, 10);
  printf("%d\n", res);

  myexit();
}

// void _start(void) {
//     myexit();
// }
