$dados = Import-Csv ./exemple.csv | Get-Unique -AsString
$newData = "nome, sobrenome, telefone `r`n"

## tratativa de telefone
foreach ($dado in $dados) {
  $show = $dado.phone -replace '[\W]', ''
  

  #tam 9 - add 98
  if ($show.length -eq 9) {
    $show = '98' + $show
  }
  #tam 8 - add 989
  if ($show.length -eq 8) {
    $show = '989' + $show
  }
  #tam 10 - add 9 next tow digits
  if ($show.length -eq 10) {
    $show = $show.substring(0, 2) + '9' + $show.substring(2, 8)
  }
  #inicia com 98
  # if ($show.substring(0, 2) -eq 98) {
  #   $show = "ta certo"
  # }
  #11 digitos é o correto
  if ($show.length -eq 11) {
    $newData += $dado.fn + ',' + $dado.ln + ',' + $show + "`r`n"
  } 
  
  Write-Output $show
}
$newData | Out-File .\newData.csv
##fim tratativa de telefone