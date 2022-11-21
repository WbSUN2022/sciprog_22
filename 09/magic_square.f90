
module msquare
  
  implicit none
  
  contains
! Checks if a matrix is a magic square.
! A magic square is an n-sided matrix whose sum of values for each
! row, column, main and secondary diagonals equals to n(n^2 + 1)/2.
! The function takes as input a matrix 'square' and its side length 'n'
! and outputs 0 if 'n' is negative or 'square' is NOT a magic square;
! otherwise, outputs a non-zero value
    function isMagicSquare(square,n)
        logical :: isMagicSquare
        integer (kind=4) :: n
        integer (kind=4) :: square(n,n)
        integer (kind=4) :: M, i, j, rowSum, colSum, diagSum, secDiagSum

        isMagicSquare = .TRUE.
! Eliminate the case where 'n' is negative
        if (n .lt. 0) then
           isMagicSquare = .FALSE.
           return
        end if

! Checking that the main and secondary
! diagonals, each add up to the same value
        diagSum = 0
        secDiagSum = 0;
        do i = 1,n
           diagSum = diagSum + square(i,i)
           secDiagSum = secDiagSum + square(i,n-i+1)
        end do
        if (diagSum.ne. secDiagSum) then
           isMagicSquare = .FALSE.
           return
        end if
        
! M is used to compare with rowsum and colsum
        M = diagSum

! Checking that every row and column add up to M
        do i=1, n
          rowSum = sum(square(i,:))
          colSum = sum(square(:,i))
          if (rowSum .ne. M .or. colSum .ne. M) then
          	isMagicSquare = .FALSE.
          	return
          end if
        enddo
        
    end function isMagicSquare
end module msquare

