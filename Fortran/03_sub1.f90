program sub1
    implicit none
    real(kind=8) :: y,z

    y = 5.
    call fsub(y,z)
    print *, "z = ",z
end program sub1

subroutine fsub(x,f)
    implicit none
    real(kind=8), intent(in) :: x      ! intent of x is input, cannot be changed
    real(kind=8), intent(out) :: f     ! intent of f is output, can be changed and is given as output
    f = x**2
end subroutine fsub
