! independent array operations using parallelization
! gfortran yeval.f90 for serial
! gfortran -fopenmp yeval.f90 for using openmp 

program yeval
    use omp_lib
    implicit none
    integer , parameter :: n=100000
    real(kind=8), dimension(n) :: y
    real(kind=8) :: dx, x
    integer :: i, nthreads

    dx=1.d0/n
    
    !$ print *, "Please specify the number of threads: "
    !$ read *, nthreads
	!$ call omp_set_num_threads(nthreads)
    !$ print *, "using open mp to parallelise this code, with threads = ", nthreads

    !$omp parallel do private(x)
    do i=1,n
        x=i*dx
        y(i)=exp(x)*cos(x)
    enddo
    !$omp end parallel do

    print *, "y vector has been filled with n=", n

end program yeval