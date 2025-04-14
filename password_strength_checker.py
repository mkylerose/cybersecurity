#!/usr/bin/env python3
import math

def password_entropy(pw):
    pool = 0
    if any(c.islower() for c in pw): pool += 26
    if any(c.isupper() for c in pw): pool += 26
    if any(c.isdigit() for c in pw): pool += 10
    if any(c in "!@#$%^&*()-_=+[{]};:'"\|,<.>/?`~" for c in pw): pool += 32
    return len(pw) * math.log2(pool)

pw = input("Enter password: ")
entropy = password_entropy(pw)
print(f"Entropy: {entropy:.2f} bits")
if entropy < 28:
    print("Very Weak")
elif entropy < 36:
    print("Weak")
elif entropy < 60:
    print("Reasonable")
else:
    print("Strong")
