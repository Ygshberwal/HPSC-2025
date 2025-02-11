def test_1():
    from numpy import sqrt, nan
    from square_root import sqrt2
    small=1.0e-14

    xvalues=[0,2,10,100,10000, 0.0001, 1e8, 1e-8]
    for x in xvalues:
        s=sqrt2(x)
        s_numpy=sqrt(x)
        print(f"for {x} the sqrt2 gives {s} value and numpy give {s_numpy} value")
        flag=(s==nan or (s-s_numpy)<small )
        assert flag, f"square root disagrees from numpy for x = {x}"

test_1()
