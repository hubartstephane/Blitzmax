Rem

  Les variables sont des endroits dans la memoire ou l'on peut lire et ecrire des donnees
  il y a plusieurs types de variables:
  
  -Int:    ce sont des nombres entiers
  -Float:  ce sont des nombres a virgules
  -String: ce sont des chaines de caracteres (bref, du texte)

  et bien d'autres encore (on peut meme creer nos propres types)

End Rem

Local variable1:Int    = 123                  ' on vient de declarer une variable1 qui est un entier
Local variable2:Float  = 0.1                  ' on vient de declarer une variable2 qui est un nombre a virgule (ce que l'on appelle un nombre flottant)
Local variable3:String = "ceci est un texte"  ' on vient de declarer une variable3 qui est une chaine de caracteres

'=========================================================================================

' on peut utiliser la fonction Print que l'on a vue et lui demander d'afficher le contenu d'une variable
' (ici variable1 et variable2 sont implicitement convertis en chaines de caracteres, parce que Print utilise des chaines de caracteres
Print variable1
Print variable2
Print variable3

'=========================================================================================

Print "Ceci n'affiche pas ce a quoi je m'attendais: " + 1 + 2

'Que se passe t'il ?
'quand a utilise l'operateur + avec une chaine a gauche et un chiffre a droite
'   "chaine " + chiffre
'le chiffre est implictement convertis en chaine
'donc
'   "chaine" + 1 + 2
'fait deux conversions en chaine successives
'l'addition 1 + 2 n'est jamais faite
'on peut utiliser des parentheses pour regler le probleme

Print "Ceci affiche bien ce a quoi je m'attendais:  " + (1 + 2)


'=========================================================================================

' on peut concatener des chaines de caracteres entre elles
Local variable4:String = "Est-ce que " + "vous avez compris ?"
Print variable4

'=========================================================================================

' on peut concatener une chaine avec un entier et un flottant
Print "la variable1 a une valeur de " + variable1
Print "la variable2 a une valeur de " + variable2

'=========================================================================================

' on peut modifier la valeur d'une variable
variable1 = variable1 * 2
Print "la nouvelle valeur de variable1 est " + variable1

'=========================================================================================

' True  est "l'equivalent" d'un entier egal a 1 (il signifie vrai)
' False est "l'equivalent" d'un entier egal a 0 (il signifie faux)
' on pourra les utiliser dans des conditions (on verra ca bientot)
Local vrai:Int = True
Local faux:Int = False