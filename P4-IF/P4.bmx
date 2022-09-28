Rem

  Les instructions IF/ELSE permettent de n'executer du code que si une condition est valide

End Rem

Local variable1:Int = 10

' une condition simple
If variable1 < 100
  Print "ce texte ne s'affiche que si la valeur de variable1 est inferieur a 100"
End If

' une condition simple avec une EGALITE
If variable1 = 10
  Print "ce texte s'affiche parce que la valeur de variable1 est 10"
End If

' une condition simple avec une DIFFERENCE
If variable1 <> 100
  Print "ce texte s'affiche parce que la valeur de variable1 n'est pas 100"
End If

If Not (variable1 = 100)
  Print "pareil ici"
End If


' une condition avec une alternative
If variable1 > 100
  Print "ce texte ne sera pas affiche"
Else
  Print "c'est ce texte qui va s'afficher"
End If


' une condition avec PLUSIEURS alternative
If variable1 = 0
  Print "La variable1 a une valeur de 0"
Else If variable1 = 20
  Print "La variable1 a une valeur de 20"
Else
  Print "en fait c'est ce texte qui va s'afficher"
End If

' tester plusieurs CONDITIONS (ici il faut que TOUTES les conditions soient vraies)
If (variable1 = 10) And (variable1 > 0)
	Print "on utilise AND si on veut que toutes les conditions soient vraies"
End If

' tester plusieurs CONDITIONS (ici il suffit qu'UNE SEULE condition soit vraie)
If (variable1 < 100) Or (variable1 > 1000)
	Print "on utilise OR si il suffit qu'une seule condition soit vraie"
End If