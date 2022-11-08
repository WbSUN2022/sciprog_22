!
! calculate the greatest common divisor (GCD) of two integers
!
!------------------------------------
program gcditer
!------------------------------------

  implicit none
  integer:: a,b,ierr,tmp,ta,tb
  
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
  
  !calculate GCD
  ta = a
  tb = b
  do while( tb .ne. 0)
    tmp = tb
    tb = mod(ta,tb)
    ta = tmp
  end do
  
  write(6,'(a,i0,a,i0,a,i0)')'Greatest common divisor of ',a,' and ',b,' is ',ta

end program gcditer
