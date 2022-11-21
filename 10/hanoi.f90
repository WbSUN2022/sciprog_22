!
! this program gives the move operation sequence in Hanoi problem
! It allows user to specify the number of disks
!
! build command:
! $ gfortran -o hanoi ./hanoi.f90
!
! run command:
! $./hanoi
!
! following lines are test run result:
!Enter the disk number:
!3
!move disc 1 from 1 to 3
!move disc 2 from 1 to 2
!move disc 1 from 3 to 2
!move disc 3 from 1 to 3
!move disc 1 from 2 to 1
!move disc 2 from 2 to 3
!move disc 1 from 1 to 3
!
!
recursive subroutine hanoi(n,source,destiny,interm)
  
  integer:: n
  integer:: source, destiny, interm
  
  if( n .eq. 1) then
     write(6,'(3(a,i0))') 'move disc ',n,' from ', source, ' to ', destiny
     
  else
     !step-1: move 1, ..., n-1 from source to interm
     call hanoi(n-1, source, interm, destiny)
     
     !step-2: move n from source to destiny
     write(6,'(3(a,i0))') 'move disc ',n,' from ', source, ' to ', destiny
     
     !step-3: move 1, ..., n-1 from interm to destiny
     call hanoi(n-1, interm, destiny, source)
  
  end if


end subroutine hanoi

program main
  
  integer:: source, destiny, interm
  integer:: ndisk
  
  source=1
  destiny=3
  interm=2
  
  write(6,'(3(a,i0),a)') 'Info: by default, all disks are assumed to be moved from rod ', source, ' to rod ',destiny, &
                         ', with rod ', interm, ' be the last' 
  write(6,'(a)')'Enter the disk number:'
  read(5,*) ndisk
  
  call hanoi(ndisk,source,destiny,interm)

end program
