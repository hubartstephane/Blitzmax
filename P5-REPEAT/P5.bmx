Local variable1:Int = 0

Rem
  les instructions Repeat/Until permettent de repeter du code jusqu'a ce qu'une condition devienne vraie
End Rem
Repeat
  Print "REPEAT: variable1 = " + variable1
  variable1 = variable1 + 1
Until variable1 = 10



Rem
  les instructions While/Wend permettent de repeter du code tant qu'une condition est vraie
End Rem
While variable1 <> 0 
  Print "WHILE: variable1 = " + variable1
  variable1 = variable1 - 1
Wend




Rem
  les instructions For/Next prennent une variable et font varier sa valeur (ajoute +1 a chaque fois), puis appellent le code au milieu
End Rem
For variable1 = 0 To 10
  Print "For: variable1 = " + variable1
Next


Rem
  Step permet de modifier l'increment
End Rem
For variable1 = 0 To 10 Step 3
  Print "For Step: variable1 = " + variable1
Next


Rem
  On peut meme inverser les valeurs de depart et d'arrivee
  On peut mettre un Step negatif
End Rem
For variable1 = 10 To 0 Step -3
  Print "For Step reverse: variable1 = " + variable1
Next