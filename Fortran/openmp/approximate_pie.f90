program pie
    use omp_lib
    implicit none
    integer :: i, n
    real(kind=8) :: pisum, dx, x, pi

    !$call omp_set_num_threads(4)
    n = 10000000
    dx = 1.d0 / n
    pisum = 0.d0

    !$omp parallel do reduction (+: pisum)  private (x)
    do i=1, n
        x = (i-0.5d0) * dx
        pisum = pisum + 1.d0 / (1.d0 + x**2)
    enddo
    
    pi = 4.d0 * dx * pisum
    print *, 'Approximate value of pie is', pi
end program pie
