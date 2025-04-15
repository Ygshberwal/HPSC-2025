! using section in omp sections 

program sect
    use omp_lib
    implicit none
    integer :: i
    integer, parameter :: n=100000
    real(kind=8), dimension(n) :: x,y,z

    ! number of threads
    !$ call omp_set_num_threads(2)

    !$omp parallel
    !$omp sections                              ! create sections to split the worl
        !$omp section                           ! one thread working on this section (initializing x arr)
        x=1.d0

        !$omp section                           ! another thread working on this section (initializing y arr)
        y=1.d0
    !$omp end sections
    !$omp barrier                               ! no need for barrier, implicit at the end of sections

    !$omp single                                ! only one thread will execute this 
    print *, "Done initializing x and y with all elements as 1.d0"
    !$omp end single nowait                     ! other threads can continue without waiting

    !$omp do                                    ! split work between threads
    do i=1,n
        z(i)=x(i)+y(i)
        enddo

    !$omp end parallel

    print *, "max val of z is ",maxval(z)
end program sect
