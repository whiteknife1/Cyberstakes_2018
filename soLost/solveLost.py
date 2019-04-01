from pwn import *
sh = remote('challenge.acictf.com', 31802)
print sh.recvuntil('!')
print sh.recvline()
up = "^"
down = "V"
left = "<"
right = ">"
x =0
while(x < 40):
    print sh.recvline()
    a = sh.recvline().strip()
    print(a)
    if(a == "up"): 
        sh.sendline(up)
    if(a == "down"): 
        sh.sendline(down)
    if(a == "right"): 
        sh.sendline(right)
    if(a == "left"): 
        sh.sendline(left)
    x += 1
