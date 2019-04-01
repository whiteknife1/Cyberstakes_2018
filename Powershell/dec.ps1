param([string]$part1 = "\x36\x20\x11\x3d\x0a\x16\x5f\x45", [string]$part2="\x52\x5f\x57\x57\x5e\x51\x54\x5e", [string]$part3="\x41\x53\x5d\x40\x0a\x13\x58\x40", [string]$part4="\x52\x59\x0d\x50\x0f\x58\x0e\x18")

If($part1.Length -ne 0 -and $part2.Length -ne 0 -and $part3.Length -ne 0 -and $part4.Length -ne 0)
{
	$data = Get-Content -Path "key.bin" -Encoding byte

	$key = $part1 + $part2 + $part3 + $part4

	$enc = [System.Text.Encoding]::UTF8
	$b = $data
	$kb = $enc.GetBytes($key)

	$i = 0

	$o = ""

	foreach ($cb in $b)
	{
		$o += [convert]::ToChar($cb -bxor $kb[$i % $kb.Length])
		$i += 1
	}

	$o
}
Else
{
	Write-Host "Need key!"
}
