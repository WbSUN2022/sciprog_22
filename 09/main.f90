!
! This program is to read a matrix from a file, and decide if it is a magic-square matrix
!
! Three files are required in compilation:
!    magic_square.f90, file_read.f90, main.f90
!
! Build command:
! $ gfortran -o magicSquare magic_square.f90 file_read.f90 main.f90
!
! Before executing the program, the file with a matrix has to be prepared.
! For example, a sample file with its name "matrix.txt" and the stored matrix in it
! 1  1
! 1  1
!
! Run command:
! $ ./magicSquare
! user will be asked to enter the name of the file where the matrix is stored,
! then the program will read in the matrix from the file and decide if the matrix is a magicsquare one
! 
! the read-in matrix will be printed on screen for improved visibility
!
program main

  use msquare
  use fileread
  
  implicit none
  
  integer, allocatable:: square(:,:)
  integer:: n, ierr
  character(len=MaxFileNameLength):: filename
  logical:: flag
  
  write(6,'(a)') "Enter file name please:"
  read(5,*) filename
  
  !read the line number, which equals to the matrix size
  call get_num_lines(filename,n)
  
  !filter out inapproriate matrix input
  if( n .lt. 2) then
     write(6,*) 'matrix has size < 2'
     return
  end if 
  
  !allocate the array memory & initialize zero
  allocate(square(n,n))
  square = 0
  
  !read matrix from the file
  call ReadIntMatFromFile(filename,square,n,ierr)
  if( ierr .ne. 0) return
  
  !determine is/isnot magicsquare matrix and print to screen
  flag = isMagicSquare(square,n)
  if( flag )then
     write(6,'(a)') 'It is a magic square matrix'
  else
     write(6,'(a)') 'It is not a magic square matrix'
  end if
  
  !deallocate the array
  deallocate(square)
  
   stop
   
end program
