Function Add(a:Int, b:Int)
	If (b == 0) Then
		Return a
	End If
	
	Return Add(a + 1, b - 1)

End Function








' Une fonction est un bout de code que l'on va pouvoir appeller n'importe ou dans notre programme
' Une fonction peut recevoir des parametres qui vont changer son comportement
' ici:
'   -text est une chaine de carateres
'   -nombre est un entier

Function AfficherUnTextPlusieursFois(text:String, nombre:Int)
  While nombre > 0
    Print text 'on appelle une fonction depuis l'interieur d'une fonction
    nombre = nombre - 1
  Wend
End Function

' Ici on appelle le bout de code que l'on vient de preparer
AfficherUnTextPlusieursFois("bonjour", 2)
AfficherUnTextPlusieursFois("au revoir", 3)
AfficherUnTextPlusieursFois "a plus tard", 6   ' on peut appeller les fonctions avec ou sans parentheses, mais avec c'est plus lisible



'=========================================================================================



' une fonction peut aussi retourner une valeur
Function MultiplierPar2:Int(valeur:Int)
  Return valeur * 2
End Function

' ici on appelle notre fonction et on affiche le resultat dans la foulee
Print MultiplierPar2(3)




'=========================================================================================

'les arguments sont passes par copie. si ils sont modifés dans la fonction, la valeur de la variable correspondant n'est pas modifiée
Function FaireQuelqueChose(variable1:Int)
  variable1 = variable1 + 1
End Function

Local variable1:Int = 123
Print variable1 'ca affiche bien 123. la variable "variable1" definie la ligne du dessus n'est pas la meme, meme si elle a le meme nom
                'FaireQuelqueChose a travaillé avec une copie de cette variable. Cette copie a ete modifiée, mais pas l'originale


'd'ailleurs notre fonction FaireQuelqueChose aurait pu etre ecrite comme ca
'changer le nom de l'argument en x n'a aucun effet, la fonction fait toujours la meme chose
Function FaireQuelqueChose2(x:Int)
  x = x + 1
End Function


'autre point, on aurait tres bien pu appeller la fonction comme ca, sans passer par une variable
FaireQuelqueChose(123)

'=========================================================================================


Function FaitRien:Int()
  Local variableDeFaitRien:Int = 0
  Return variableDeFaitRien
End Function


'j'ai commenté le code en dessous parce qu'elle ne marche pas. Ca produit une erreur de compilation
'La variable "variableDeFaitRien" n'est connu qu'a l'interieur de la fonction FaitRien
'Local variable3 = variableDeFaitRien 

'=========================================================================================

For Local i:Int = 1 To 3 ' on vient de creer une variable "i" juste pour la boucle
  Local variable:Int = 6
  Print "Dans la boucle For: " + (variable + i)
Next

' Pareil ici, les variables ne sont pas connues. Elles sont connues justes dans la boucle For
'Print i
'Print variable

'=========================================================================================

'une fonction peut s'appeller elle meme !!! ca s'appelle la recursivite
'Mais attention il faut qu'a un moment elle arrete de s'appeller elle meme sinon ca crash

Function Recursive(valeur:Int)
  Print "Recursive: " + valeur
  If (valeur > 0) Then
    Recursive(valeur - 1)
  End If
End Function

Recursive(6)









