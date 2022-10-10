program conversion
   
   implicit none
   
! Declare variables 
   integer (kind=4) :: i,inum,tmp,numdigits
   integer :: binnum(60)
   real(kind=4) :: fnum
   integer (kind=4) :: n,im

! Intialise 4-byte integer
!   inum = 33554431
   inum = 16777215 + 2; !to match content in file Conversion.c
!   inum = 26 !used to verify the reversing of 0/1 in binnum with un-symmetric digits
! Convert to 4-byte float
   fnum = real(inum)       

! Binary converter using modulus   
   i=0
   tmp=inum
   do while (tmp > 0)
      i = i+1
      if(mod(tmp,2)==0) then
             binnum(i) = 0
        else
             binnum(i) = 1
      end if
      tmp = tmp/2
   end do
   !store the number of digits
   n = i
   
!   write(*,'(A,I5)')'number of digits converted =',i
   
   !output inum in binary form, stored in binnum
!   write(6,'(a)',advance='No') '(before reversing) inum in binary='
!   DO i=1,n
!      write(6,'(I1)',advance='No') binnum(i)
!   END DO
!   write(6,*)

! Reverse the 0/1 string
  im = n/2 !if n=5, then im=2
!  print*, 'n=',n,', im=',im
  DO i=1, im
    tmp = binnum(i)
    binnum(i) = binnum(n+1-i)
    binnum(n+1-i) = tmp
  end do
  
! TODO Complete the expression
   numdigits = nint(log(fnum)/log(2.)) 
   write(6,*) ' The number of digits is ',numdigits

   write(6,'(a,i0,a,f0.1,a,b0)')  'inum=',inum,', fnum=',fnum,', inum in binary=',inum
   
   !output inum in binary form, stored in binnum
   write(6,'(a)',advance='No') 'inum in binary='
   DO i=1,n
      write(6,'(I1)',advance='No') binnum(i)
   END DO
   write(6,*)


end program conversion
