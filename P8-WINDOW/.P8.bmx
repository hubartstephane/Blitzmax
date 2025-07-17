Graphics 800,600, 0







' quand on ouvre une fenetre, il y a deux 'images'
' -celle qui est affichée
' -celle dans laquelle on est en train de dessiner
' comme ca, quand on dessine, si ca prends du temps, le joueur ne voit pas l'image en train d'etre modifiée
' cette technique s'appelle le DOUBLE BUFFER

Local color:Int = 0

Repeat



  'Cls est une fonction qui efface la zone de dessin
  Cls 

  'SetColor est une fonction qui permet de dire avec quelle couleur on va dessiner
  'les trois valeurs qui suivent correspondent aux valeurs de
  ' ROUGE (255)
  ' VERT  (0)
  ' BLEU  (0)
  ' les chiffres que l'on peut donner ont des valeurs comprises entre [0-255]
  ' (0, 0, 0)       correspond au noir
  ' (255, 255, 255) correspond au blanc
  ' (255,   0,   0) correspond au rouge   
  ' (  0, 255,   0) correspond au vert 
  ' (  0,   0, 255) correspond au bleu
  SetColor color, 0, 0 

  'DrawRect est une fonction qui dessine un rectangle
  'les deux premieres valeurs (50, 50) sont les coordonnées d'un des coins du rectangle
  'les deux valeurs suivantes (200, 300) sont le taille (largeur, hauteur) du rectangle
  'attention la coordonnée Y=0 correspond au haut de la fenetre
  DrawRect 50, 50, 200, 300 

  'DrawText permet d'afficher du text
  'les deux chiffres (0, 0) correspondent a la coordonnée ou commence le texte
  DrawText "Bonjour", color + 200, color
  
  'DrawLine permet d'afficher une ligne
  'les deux premiers parametres sont les coordonnées du point de depart 
  'les deux derniers parametres sont les coordonnées du point d'arrivée
  DrawLine 0,0, 800, 600
  DrawLine 0,600, 800, 0

  'quand on a fini de dessiner le contenu de la fenetre, on inverse l'image visible et l'image du dessin
  'le joueur voit enfin tout ce que l'on a dessiner
  Flip

  color = color + 1
  If color = 256 Then
    color = 0
  End If


Until KeyDown(Key_Escape)
