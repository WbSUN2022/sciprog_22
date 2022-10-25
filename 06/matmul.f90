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
