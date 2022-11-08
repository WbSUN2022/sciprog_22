!------------------------
program finde
!------------------------

  implicit none
  
  integer:: n, i, ierr
  real(kind=8),dimension(:),allocatable:: terms
  integer:: denom
  real(kind=8):: e
  
  write(6,*) 'Enter the polynomial order'
  read(5,*,iostat=ierr) n
  if( ierr .ne. 0)then
     write(6,*) 'Error: Problem with input'
     stop
  end if
  
  if( n .le. 0) then
     write(6,*) 'Error: Input number is not positive!'
     stop
  end if
  
  allocate(terms(n))
  terms = 0.
  
  do i=1, n
     call factorial(denom,i)
     terms(i) = 1./denom
  end do
  
  e = 1.
  do i=1, n
     e = e + terms(i)
     write(6,'(a,i0,a,f20.14)') 'e term for order ',i,' is ',terms(i)
  end do
  write(6,'(a,f20.14,a,f20.14)') 'e is estimated as ',e,', with difference',e-exp(1.)
  
  deallocate(terms)
  
  stop
  
end program finde

!------------------------
recursive subroutine factorial(val,n)
!------------------------
   implicit none
   
   integer:: val
   integer:: n
   
   if( n .eq. 1)then
      val = 1
   else
      call factorial(val,n-1)
      val = val * n
   end if

end subroutine factorial
