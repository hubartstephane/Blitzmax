' Une fonction est un bout de code que l'on va pouvoir appeller n'importe ou dans notre programme
' Une fonction peut recevoir des parametres qui vont changer son comportement
' ici:
'   -text est une chaine de carateres
'   -nombre est un entier

Function AfficherUnTextPlusieursFois(text:String, nombre:Int)
  While nombre > 0
    Print text
    nombre = nombre - 1
  Wend
End Function

' Ici on appelle le bout de code que l'on vient de preparer
AfficherUnTextPlusieursFois("bonjour", 2)
AfficherUnTextPlusieursFois("au revoir", 3)







' une fonction peut aussi retourner une valeur
Function MultiplierPar2:Int(valeur:Int)
  Return valeur * 2
End Function

' ici on appelle notre fonction et on affiche le resultat dans la foulee
Print MultiplierPar2(3)
