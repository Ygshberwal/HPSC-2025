x=100.0
s=1

kargs=100
for i in range(kargs):
    s=0.5*(s+x/s)

print(f"The square root of {x} is {s}")
