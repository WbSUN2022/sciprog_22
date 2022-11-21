module fileread
  
  implicit none
  
  integer, parameter:: MaxFileNameLength = 100
  
  contains
  
!-----------------------------------------------------
Subroutine get_num_lines(filename,n)
!-----------------------------------------------------
  
  character(len=MaxFileNameLength):: filename
  character(len=80):: line
  integer:: n, ierr, funit
  
  !initialize the line number
  n = 0
  
  !open the file, if failed, n=0
  funit = 10
  open(unit=funit,file=trim(filename),action='read',status='old',iostat=ierr)
  if( ierr .ne. 0)then
     write(6,*) 'Fail to open file'//TRIM(filename)
     return
  end if
  
  !reading lines and count line number, until end of file or error occurs
  do while(.true.)
     read(funit,'(a)',iostat=ierr) line
     if( ierr .ne. 0) exit
!     write(6,*) TRIM(line)
     n=n+1
  end do
  
!  write(6,'(a,i0)') 'line number=',n
  
  !close the file
  close(funit)
  
  return

end subroutine get_num_lines

!-----------------------------------------------------
subroutine ReadIntMatFromFile(filename,mat, n, ierr)
!-----------------------------------------------------
  
  integer :: mat(n,n)
  integer :: n
  character(len=MaxFileNameLength):: filename
  
  integer:: funit,ierr,i
  
  !open file
  funit = 10
  open(unit=funit,file=trim(filename),action='read',status='old',iostat=ierr)
  if( ierr .ne. 0)then
     write(6,*) 'Fail to open file'//TRIM(filename)
     return
  end if
  
  !reading n lines, each line has n integers
  do i=1, n
     read(funit,*,iostat=ierr) mat(i,1:n)
     if( ierr .ne. 0) then
        write(6,*) 'Error in reading matrix from file'
        close(funit)
        return
     end if
!     write(6,*) mat(i,1:n)
  end do
  
  !print out the matrix, for double check
  do i=1, n
     write(6,*) mat(i,1:n)
  end do
  
  !close the file
  close(funit)

end subroutine ReadIntMatFromFile

end module fileread
