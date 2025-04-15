! Fine grain: Parallelize at the level of individual loops, splitting work for each loop between threads.

program fine
    use omp_lib
    implicit none
    integer :: i, m
    integer, parameter :: nsteps=1000, n=10
    real(kind=8), parameter :: dt=0.001
    real(kind=8), dimension(n) :: u, eta, c

    ! Initialize variables
    do i = 1, n
        eta(i) = 1.0d0
        c(i) = 0.5d0
    end do

    ! Set number of threads
    !$ call omp_set_num_threads(2)

    ! First parallel copy
    !$omp parallel do
    do i = 1, n
        u(i) = eta(i)
    end do
    !$omp end parallel do

    
    do m = 1, nsteps
        !$omp parallel do
        do i = 1, n
            u(i) = (1.d0 + dt * c(i)) * u(i)
        end do
        !$omp end parallel do
    end do

    print *, "Done Successfully"
    
end program fine
