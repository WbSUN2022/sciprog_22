/* 
   Ubuntu commandline to compile:
   $ gcc -o pracFour ./pracFour.c -lm
   
   commandline to run
   $ ./pracFour
   
   output:
   $ the calculated area= 0.695045
*/

#include <stdio.h>
#include <math.h>

/* global array to store tan(x) at points */
float y[20];

/* pi accessible in every function */
float pi;

/* state the function */
float cal_area(int n);

int main(void) {
  
  int i,n;
  float a,area;
  
  /* initialize the pi value */
  pi= acos(-1.);
  
  /* division number */
  n=12;
  
  /* at each equaldistant point xi in radian, i=0,1,2,...,12
  , compute tan(x) also */
  for(i=0;i<=n;i++){
     a=i*60./n * pi/180.;
     y[i]=tan(a);
  }
  
  /* invoke the function to compute area */
  area = cal_area(n);
  
  /* print the area */
  printf("the calculated area= %.6f\n",area);
}

/* compute area, provided the division number n, and the function values stored in global array y[0:n]*/
float cal_area(int n){
  
  float area;
  int i;
  
  /* side points contributed to the sum */
  area = y[0] + y[n];
  
  /* interior points */
  for(i=1;i<n;i++)
     area = area + 2.*y[i];
  
  /* multiply the (b-a)/2N */
  area = area * 0.5 * 60./n * pi/180.;
  
  return area;
}
