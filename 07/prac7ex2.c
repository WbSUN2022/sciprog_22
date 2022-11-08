#include <stdio.h>
#include <stdlib.h>

int* allocatearray(int n);
void fillwithones(int *p, int n);
void printarray(int *p, int n);
void freearray(int *p);


void main()
{
  int *p;
  int n;
  
  printf("Enter the array size\n");
  scanf("%d",&n);
  
  p = allocatearray(n);
  fillwithones(p,n);
  printarray(p,n);
  freearray(p);
  


}

//allocate the array
int* allocatearray(int n)
{
  int *p;
  p = (int *) malloc( n*sizeof(int));
  return p;
}

//fill with ones
void fillwithones(int *p, int n)
{
  int i;
  for(i=0; i<n; i++){
     p[i]=1;
  }
}

//print the array
void printarray(int *p, int n)
{
  int i;
  for(i=0; i<n; i++){
    printf("a[%d]=%d\n",i,p[i]);
  }
}

//Deallocate the array
void freearray(int *p)
{
  free(p);
}
