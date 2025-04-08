program roworder
    implicit none
    integer, parameter :: m=4096, n=10000
    integer(kind=8) :: t1, t2, rate, count_max
    real(kind=8) :: arr(n,n)
    integer :: i, j
    real(kind=8) :: elapsed_time

    call system_clock(count_rate=rate, count_max=count_max)
    call system_clock(t1)

    do i = 1, m
        do j = 1, n
            arr(i,j) = arr(i,j) + 1.0
        end do
    end do

    call system_clock(t2)

    elapsed_time = real(t2 - t1, kind=8) / real(rate, kind=8)
    print *, "Elapsed time (seconds), Row wise mat mul:", elapsed_time

end program roworder
