#include <stdio.h>

int function1(int a, int b);
int function2(int a, int b, int c);

int main()
{
        int a =4;
        int b =6;
        int c =5;

    int result= function1(a,b);
    int result1= function2(a,b,c);
}

int function1(int a, int b)
{
        if(a>=b)
            return a;
        else
            return b;
}

int function2(int c, int b, int a)
{
      int result = function1(b, c);
      result = function1(a, result);
      return result;
}

