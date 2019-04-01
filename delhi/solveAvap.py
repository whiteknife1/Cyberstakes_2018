from pwn import *
sh = process(['./avap', '7'], raw = False)
p = p32(0x67616c66)
p += p32(0x5f73347b)
p += p32(0x79353465)
p += p32(0x5f73345f)
p += p32(0x675f7431)
p += p32(0x7d737433)
sh.recvline()
sh.sendline(p)
a = sh.recvline()
print a
#flag{4s_e45y_4s_1t_g3ts}
