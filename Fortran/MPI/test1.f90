program test1
    use mpi              ! always use mpi
    implicit none
    integer :: ierr, numprocs, proc_num;                            ! numprocs, specify the number of threads at runtime

    call mpi_init(ierr)                                             ! begining of the mpi code with error code
    call mpi_comm_size(MPI_COMM_WORLD, numprocs, ierr)
    call mpi_comm_rank(MPI_COMM_WORLD, proc_num, ierr)

    print*, 'Hello from Process number', proc_num, 'of', numprocs, 'processes';

    call mpi_finalize(ierr);                                        ! end of the mpi code with error code


end program test1

! 'mpif90 test1.f90'      to complile the code
! 'mpiexec -n 4 ./a.out'  to execute 