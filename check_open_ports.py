#!/usr/bin/env python3
import socket
import sys

host = sys.argv[1] if len(sys.argv) > 1 else 'localhost'
for port in range(1, 1025):
    try:
        with socket.create_connection((host, port), timeout=0.5) as sock:
            print(f"Port {port} is open")
    except:
        continue
