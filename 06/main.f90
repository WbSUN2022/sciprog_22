program main

 use matmul
 
 implicit none
 
 integer:: n, p, q
 integer:: ierr
 real(kind=8),dimension(:,:),pointer:: c, a, b
 
 integer:: i,j,k
 
 n = 5
 p = 3
 q = 4
 
 allocate(a(n,p),b(p,q),c(n,q),stat=ierr)
 if( ierr .ne. 0) then
    write(6,'(a)') 'Problem in memory allocation!'
    stop
 end if
 
 do i=1, n
 do j=1, p
    a(i,j) = i+j
 end do
 end do
 
 write(6,'(a)') 'matrix a is'
 call printmatrix(a,n,p)
 
 do i=1, p
 do j=1, q
    b(i,j) = i-j
 end do
 end do
 
 write(6,'(a)') 'matrix b is'
 call printmatrix(b,p,q)
 
 c = 0.
 call matmultiple(c,a,b,n,p,q)
 
 write(6,'(a)') 'matrix c is'
 call printmatrix(c,n,q)
 
 deallocate(a,b,c)
 
end program
