program arrayops

    implicit none
    real(kind=8), dimension(3,2) :: a
    real(kind=8), dimension(2,3) :: b
    real(kind=8), dimension(3,3) :: c
    real(kind=8), dimension(2) :: x
    real(kind=8), dimension(3) :: y
    integer i

    a = reshape((/1,2,3,4,5,6/), (/3,2/))

    print *, "a = "
    do i=1,3
        print *, a(i,:)   ! i'th row
        enddo

    b = transpose(a)

    print *, "Transpose of a: b = "
    do i=1,2
        print *, b(i,:)   ! i'th row
        enddo

    c = matmul(a,b)
    print *, "matmul(a,b): c = "
    do i=1,3
        print *, c(i,:)   ! i'th row
        enddo

    x = (/5,6/)
    y = matmul(a,x)
    print *, "x = ",x
    print *, "matmul(a,x): y = ",y

end program arrayops
