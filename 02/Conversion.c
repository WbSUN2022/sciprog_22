#include <stdio.h>
#include <math.h>

// compile with gcc -o Conversionc ./Conversion.c -lm
int main(void) {

/* Declare variables */
   int i,inum,tmp,numdigits;
   float fnum;
   char binnum[60];

/* Intialise 4-byte integer */
//   inum = 33554431; //33554431 = 2^25-1 = 2^0 + 2^1 + ... + 2^24, needs 25 digits to represent accurately
//   inum = 16777215;//no rounding error
//   inum = 16777215 + 1; //no rounding error
   inum = 16777215 + 2; //rounding error
//   inum = 16777215 + 3; // no rounding error
/* Convert to 4-byte float */
   fnum = (float) inum; //after conversion, 33554431 becomes 33554432.0000, by rounding-off the rightmost digit '1'
   // if the distance between the two leftmost and rightmost digits '1' is greater than 23, rounding error occurs after conversion


/* Convert to binary number (string)*/
   i = 0; tmp = inum;
   while (tmp > 0) {
     sprintf(&binnum[i],"%1d",tmp%2);
     tmp = tmp/2;
     i++;
   }
   printf("number of digits converted = %d\n",i);

/* Terminate the string */
   binnum[i] = '\0';
   
/* Reverse the 0/1 string */
   int n = i-1;
   int im = floor(i/2.);
   char c;
   for(int j=0;j<im;j++){
      c = binnum[j];
      binnum[j]=binnum[n-j];
      binnum[n-j]=c;
   }

/* Complete the expression */
/* the calculation is not accurate: when inum=16777215 + 2, it gives numdigits=24 (no conversion error), but actually fnum=16777215+1;
   it cannot be used to judge if conversion error will occur or not.
*/
   numdigits = ceil(logf(fnum)/logf(2.) ); 
   printf("The number of digits is %d\n",numdigits);
   
   printf("inum=%d,  fnum=%f, inum in binary=%s\n",
      inum,fnum,binnum);
      
   //with 24 digits, the maximal number is identified by
   //2^0 + 2^1 + 2^2 + ... + 2^23 = (1-2^24)/(1-2)=2^24-1
//   int maxintval=ceil(pow(2.,24.));
//   maxintval=maxintval-1.;
//   printf("max integer is %d\n",maxintval); // the result is 16777215, with 25 digits the result is 2^25-1=33554431

}
