program main
  
  implicit none
  
  integer, parameter:: length = 1000
  real(kind=8):: delta,x
  real(kind=8):: tan1(length),tan2(length)
  integer:: i
  
  write(6,*) 'Enter a positive real number'
  read(5,*) delta
  
  x = -0.9
  i = 1
  do while ( x .le. 0.9 .and. i .le. length)
     call artanh1(tan1(i),x,delta)
     call artanh2(tan2(i),x)
     
     write(6,'(a,f20.10,a,f20.10)') 'The difference at ',x,' between them is',abs(tan1(i)-tan2(i))
     i = i + 1
     x = x + 0.01
  
  end do
    
  stop

end program


subroutine artanh1(a,x,delta)
  
  real(kind=8),intent(in):: x, delta
  real(kind=8):: a
  
  integer:: n
  real(kind=8):: elem,p
  
  if( abs(x) .ge. 1.) then
     write(6,*) 'Absolute value is not less than 1.'
     return
  end if
  
  a = 0.
  n = 0
  do while(.true.) 
     p = 2*n+1.
     elem = x**(p)/p
     if( abs(elem) .lt. delta) exit
     a = a + elem
     n = n+1
  end do

end subroutine artanh1

subroutine artanh2(a,x)
  real(kind=8),intent(in):: x
  real(kind=8):: a
  
  if( abs(x) .ge. 1.) then
     write(6,*) x,' absolute value is not less than 1.'
     return
  end if
  
  a = 0.5 * (log(1.+x) - log(1.-x))

end subroutine artanh2
