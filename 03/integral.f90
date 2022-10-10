! compile command line:
!   $ gfortran -o integralf90 ./integral.f90
! run:
!   $ ./integralf90
program integral

  implicit none
  
  real:: a, b, dx, sumval,val
  integer:: n,i
  real,dimension(:),allocatable:: x
  
  !set the integral boundary
  a = 0.
  b = acos(-1.)/3.
  
  !division number
  n = 12
  
  !allocate the memory to store x
  allocate(x(n+1))
  
  !initialize x0, and xN
  x(1) = a
  x(n+1) = b
  
  !the equal distance
  dx = (b-a)/n
  
  !the intermediate xi, i=1,...,N-1
  do i=2, n
    x(i) = a + (i-1)*dx 
  end do
  
  sumval=0.
  
  !get the first part of the sum tan(0)+tan(pi/3)
  call fun(x(1),val)
  sumval = sumval + val
  call fun(x(n+1),val)
  sumval = sumval + val
  
  !get the rest part of the sum
  do i=2, n
     call fun(x(i),val)
     sumval = sumval + 2. * val
  enddo
  
  !multiply by (b-a)/2N
  sumval = sumval * 0.5 * dx
  
  !compare against log(2)
  write(6,'(a,I5)')'The division number N=',n
  write(*,'(a,f10.6,a,f10.6)')'log(2)=',log(2.),' vs. numerical integration=',sumval
!  write(*,*)'log(2)=',log(2.),' vs. numerical integration=',sumval
  
  !free the memory
  deallocate(x)

end program integral

!----------------------
subroutine fun(x,y)
!-------------------

  real:: x,y
  
  !specify the function to be integrated
  y = tan(x)

end subroutine fun
