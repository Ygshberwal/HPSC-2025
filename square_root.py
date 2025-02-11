

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


def sqrt2(x, debug=False):
    from numpy import nan
    if x==0:
        return 0
    elif x<0:
        return nan
    s=1.0
    kargs=100
    tol=0.1e-14
    for i in range(kargs):
        s0=s
        s=0.5*(s+x/s)
        delta_s=s-s0
        if(abs(delta_s/x)<tol):
            break
        if debug:
            print(f"At {i+1} iteration, the value of squareroot is {s}")

    if debug:
        print(f"The square root of {x} is {s}")
    return s

if __name__=="__main__":
    from test_case import test_1
    print("Running test_1() in test_case.py file")
    test_1()
