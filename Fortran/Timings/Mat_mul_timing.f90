program matmul
    implicit none
    integer, parameter :: ntests = 20
    integer :: n
    real(kind=8), allocatable, dimension(:,:) :: a,b,c
    real(kind=8) :: t1, t2, elapsed_time
    integer(kind=8) :: tclock1, tclock2, clock_rate
    integer :: i, j, k, itest

    call system_clock(tclock1)                                                      !starting actual time at this moment

    write(*, '(A)', advance='no') "Enter matrix size n: "
    read *, n

    allocate(a(n,n), b(n,n), c(n,n))

    a = 1.d0
    b = 1.d0

    call cpu_time(t1)                           !starting CPU time here   ______
    do itest = 1, ntests                                                        ! 
        do i = 1, n                                                             !
            do j = 1, n                                                         !    
                c(i,j)=0.d0                                                     !
                do k=1,n                                                        !
                    c(i,j)=c(i,j) + a(i,k)*b(k,j)                               !------- CPU running time
                enddo                                                           !
            enddo                                                               !
        enddo                                                                   !
    enddo                                                                       !
    call cpu_time(t2)                           !stopping CPU time here   ______!

    write(*,'(A,I4,A)')       "Performed ", ntests, " matrix multiplications:"
    write(*,'(A,F10.6,A)')    "CPU time         = ", t2 - t1, " seconds"            !time for which CPU ran


    call system_clock(tclock2, clock_rate)                                          !ending actual time here
    elapsed_time = float(tclock2 -  tclock1) / float(clock_rate)
    write(*,'(A,F10.6,A)')    "Elapsed time     = ", elapsed_time, " seconds"       !total real time elapsed
end program matmul
