program fcn1
	implicit none
	real(kind=8) :: y,z
	real(kind=8), external :: f   !external defines that that f is a function
	
	y=2.
	z=f(y)
	print *, "z= ", z
end program fcn1

real(kind=8) function f(x)
	implicit none
	real(kind=8), intent(in) :: x     ! intent of x is input, not modified
	f=x**2
end function f
