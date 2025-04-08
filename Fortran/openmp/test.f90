program test
    use omp_lib
    implicit none
    integer :: thread_num
    integer :: nthreads

    !$ call omp_set_num_threads(4)

    print *, "Testing openmp, you will see each thread print"

    !$omp parallel
    !$omp critical                                   ! if critical block is not used then they may share thread_num variable
    !$ thread_num=omp_get_thread_num()
    !$ print *, "This thread =", thread_num
    !$omp end critical
    !$omp end parallel
end program test
