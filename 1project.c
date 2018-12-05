/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, PHP, Ruby, 
C#, VB, Perl, Swift, Prolog, Javascript, Pascal, HTML, CSS, JS
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
#include <stdio.h>
int power(int x, int i)
{
   int k;
    int tmp =1;
    for(k=0; k<i; k++)
    {
        tmp= tmp*x;       
    }
        return tmp;
}

void fillarray(int x, int a[], int n){
    int i;
    for( i=0; i<n; i++)
    {
        a[i]=power(x,i);
    }
}

void fillarray2(int x, int a[], int n){
    int i;
    int tmp =1;
    a[0]=tmp;
    for(i =1; i<n; i++){
        tmp= tmp*x;
        a[i]=tmp;
    }
}
int compare(int a[], int b[], int n)
{
    int i;
    for(i=0; i<n; i++)
    {
        if(a[i] !=b[i])
        return 0;
    }
    return 1;
}
int main(){
    int j =0;
    int x =2;
    int i =9;
    int w;
    w=power(x,i);
    printf("w= %d\n",w);
    int array[10];
    fillarray(2, array, 10);
    for(j=0; j<=10; j++)
    {
        array[i];
    }
    int array2[10];
    fillarray2(2, array2, 10);
    for(j=0; j<=10; j++)
    {
       
        array[j];
         printf("array[%d]=%d\n", j, array2[j]);
    }
    int check= compare(array, array2, 10);
    printf("check=%d", check);
    return 0;
}

