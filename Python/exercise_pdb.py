def sqrt2(x, debug=False):
	from numpy import nan
	if x == 0:
		return 0
	elif x < 0:
		return nan
	s = 1.0
	kmax = 100
	tol = 1.0e-14
	
	for k in range(kmax):
		if debug:
			print(f"At iteration {k} the value of s={s:20.15f}")
		s0 = s
		import pdb
		pdb.set_trace()
		s = 0.5 * s + (x / s)
	
		delta_s = s - s0
		if (abs(delta_s / x) < tol):
			break
	
	if debug:
		print(f"Finally, the value of s={s:20.15f}")
	
	return s
		
if __name__ == "__main__":
	import numpy as np
	number = 2.0
	npsqrt=np.sqrt(number)
	my=sqrt2(number)
	print(f"my sqrt of {number} is {my} and numpy version if {npsqrt}")


# Use the Following pdb Commands
# • list: View surrounding code.
# • p <var>: Print variable values (e.g., p s, p delta s).
# • up, down: Move between stack frames.
# • step (s): Step into the next line of execution.
# • continue (c): Continue execution until the next breakpoint. Keep using it to see the convergence behaviour.

# This will help you in debugging
# Correct code is s=0/5*(s+(x/s)) 
