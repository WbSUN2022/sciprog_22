module matmul

  implicit none
  
  contains
  
  subroutine matmultiple(c,a,b,n,p,q)
  !a(n,p), b(p,q)
  !c(n,q) = a x b
    real(kind=8):: a(n,p),b(p,q),c(n,q)
    integer:: n,p,q
    
    integer:: i,j,k
    real(kind=8):: val
    
    do i=1, n
    do j=1, q
       val = 0.
       do k=1, p
          val = val + a(i,k) * b(k,j)
       end do
       c(i,j) = val
    end do
    end do
    
    return
    
  end subroutine matmultiple
  
  subroutine printmatrix(a,m,n)
    
    real(kind=8):: a(m,n)
    integer:: m, n
    
    integer:: i, j
    
    do i=1,m
       do j=1, n
          write(6,'(f8.2)',advance='NO') a(i,j)
       end do
       write(6,*)
    end do
    
    return
  
  end subroutine printmatrix
  
end module matmul

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


