

def sqrt():
    x=10000.0
    s=1.0
    
    kargs=100
    tol=0.1e-14
    for i in range(kargs):
        s0=s
        s=0.5*(s+x/s)
        delta_s=abs(s-s0)
        if(delta_s<tol):
            break
        print(f"At {i+1} iteration, the value of squareroot is {s}")

    print(f"The square root of {x} is {s}")


def sqrt2(x):
    
    s=1.0
    
    kargs=100
    tol=0.1e-14
    for i in range(kargs):
        s0=s
        s=0.5*(s+x/s)
        delta_s=abs(s-s0)
        if(delta_s<tol):
            break
        print(f"At {i+1} iteration, the value of squareroot is {s}")

    print(f"The square root of {x} is {s}")
