!
! calculate the greatest common divisor (GCD) of two integers, with recursive function
!
!------------------------------------
program main
!------------------------------------
  
  implicit none

  integer:: a,b,c,ierr
  
  !read the two integers from user input
  write(6,'(a)')'Enter the two integers'
  read(5,*,iostat=ierr) a,b
  if( ierr .ne. 0) then
     write(6,*)'Problem in reading the two integers'
     stop
  end if

  !verify both are positive integer
  if( a .le. 0 .or. b .le. 0)then
     write(6,*)'error: both integer should be positive'
     stop
  end if
  
  call gcdrecurs(c,a,b)
  
  write(6,'(a,i0,a,i0,a,i0)')'Greatest common divisor of ',a,' and ',b,' is ',c

end program main

!------------------------------------
recursive subroutine gcdrecurs(c,a,b)
!------------------------------------
  
  implicit none
  
  integer:: a, b, c
  
  if( b .eq. 0)then
     c = a
  else
     call gcdrecurs(c,b,mod(a,b))
  end if

end subroutine gcdrecurs
