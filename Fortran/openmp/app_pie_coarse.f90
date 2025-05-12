program pie
    use omp_lib
    implicit none

    integer :: i, n, nthreads, thread_num, istart, iend, points_per_thread
    real(kind=8) :: pisum, pisum_thread, dx, x, pi

    !$call omp_set_num_threads(4)
    nthreads = omp_get_max_threads()

    n = 1000000
    dx = 1.0d0 / n
    pisum = 0.d0

    points_per_thread = (n + nthreads - 1) / nthreads

    !$omp parallel private(i, pisum_thread, x, istart, iend, thread_num) shared(pisum, dx, n, nthreads, points_per_thread)
        thread_num = omp_get_thread_num()
        istart = thread_num * points_per_thread + 1
        iend = min((thread_num + 1) * points_per_thread, n)
        pisum_thread = 0.d0

        do i = istart, iend
            x = (i - 0.5d0) * dx
            pisum_thread = pisum_thread + 1.d0 / (1.d0 + x**2)
        end do

        !$omp critical
        pisum = pisum + pisum_thread
        !$omp end critical
    !$omp end parallel

    pi = 4.d0 * dx * pisum
    print *, 'Approximate value of pi is', pi

end program pie
