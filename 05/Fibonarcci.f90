module fib
  
  implicit none
  
  contains
  
  subroutine fibonacci(f1,f0)
     integer:: f2,f1,f0
     
     !input: f1=f(n-1), f0=f(n-2)
     !on exit: f1=f(n)=f(n-1)+f(n-2), f0=f(n-1)
     f2 = f1 + f0
     f0 = f1
     f1 = f2     
  
  end subroutine fibonacci

end module fib

program main
 
  use fib
  
  implicit none
  
  integer:: n
  integer:: f0,f1
  integer:: i
  
  write(*,*)'Please enter a positive integer:'
  read(*,*) n
  
  !check if positive
  if ( n .lt. 1 )then
     write(6,*) n, ' is not a positive integer'
     return
  end if
  
  f0 = 0
  f1 = 1  
  write(6,'(a)') 'The fibonacci sequence is:'
  write(6,'(i0,a,i0,a)',advance='No') f0,', ',f1,', '
  
  DO i=2, n
     call Fibonacci(f1,f0)
     write(6,'(i0,a)',advance='No')f1,', '
     if( mod(i,6) .eq. 0) write(6,*)
  END DO
  write(6,*)
  
end program


