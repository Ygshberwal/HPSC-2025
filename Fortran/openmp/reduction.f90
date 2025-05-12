program norm_parallel
    use omp_lib
    implicit none
    integer :: i, n
    real(kind=8) :: norm
    real(kind=8), allocatable :: x(:)

    !$call omp_set_num_threads(4)

    n = 1000000
    allocate(x(n))
    x = 1.0d0

    norm = 0.0d0
    !$omp parallel do reduction(+:norm)
    do i = 1, n
        norm = norm + abs(x(i))
    end do
    !$omp end parallel do

    print *, '1-norm of the vector =', norm

    deallocate(x)
end program norm_parallel
