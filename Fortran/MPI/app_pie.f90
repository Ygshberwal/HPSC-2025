program mpi_pi
    use mpi
    implicit none

    integer :: ierr, proc_num, numprocs
    integer :: i, n, istart, iend, points_per_proc
    real(kind=8) :: dx, x, pi, pisum_proc, pisum

    call MPI_INIT(ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD, proc_num, ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD, numprocs, ierr)

    ! Initialize total number of points (only on root)
    if (proc_num == 0) then
        n = 1000
    end if

    ! Broadcast n to all processes
    call MPI_BCAST(n, 1, MPI_INTEGER, 0, MPI_COMM_WORLD, ierr)

    dx = 1.0d0 / n
    points_per_proc = (n + numprocs - 1) / numprocs
    istart = proc_num * points_per_proc + 1
    iend = min((proc_num + 1) * points_per_proc, n)

    pisum_proc = 0.d0
    do i = istart, iend
        x = (i - 0.5d0) * dx
        pisum_proc = pisum_proc + 1.d0 / (1.d0 + x*x)
    end do

    ! Reduce partial sums to the root process
    call MPI_REDUCE(pisum_proc, pisum, 1, MPI_DOUBLE_PRECISION, MPI_SUM, 0, MPI_COMM_WORLD, ierr)

    if (proc_num == 0) then
        pi = 4.d0 * dx * pisum
        print *, 'Approximate value of pi is', pi
    end if

    call MPI_FINALIZE(ierr)
end program mpi_pi
