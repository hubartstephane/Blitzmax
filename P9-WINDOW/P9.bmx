Graphics 800,600, 0

'x et y sont les coordonnees du joueur (son centre)
Local x:Int = 400
Local y:Int = 300
'la taille du joueur
Local taille:Int = 30
'vitesse de deplacement du joueur
Local vitesse:Int = 3

Repeat

  'on efface la zone de dessin
  Cls 

  'on va dessiner en vert cette fois-ci
  SetColor 0, 255, 0

  'on affiche le joueur
  'x et y sont les coordonnees du centre du joueur
  'si on veut les coordonnees du coin (haut-gauche) du rectangle, il faut soustraire la moitie de la taille
  DrawRect x - taille / 2, y - taille / 2, taille, taille

  'on affiche l'image complete
  Flip

  'on deplace le joueur
  Local deplacement:Int = vitesse 'on pourrait utiliser directement vitesse, mais ca aura un interet au chapitre suivant

  If KeyDown(Key_Up)
    y = y - deplacement  ' on rappelle que la coordonnée Y=0 est en haut et pas en en bas. C'est pour ca qu'il y a un signe moins
  Else If KeyDown(Key_Down)
    y = y + deplacement
  End If

  If KeyDown(Key_Left)
    x = x - deplacement
  Else If KeyDown(Key_Right)
    x = x + deplacement
  End If

  'a ce stade, rien n'empeche le joueur de sortir de l'ecran
  'on calcul les valeurs maximales et minimales acceptees pour X et Y du joueur
  Local MinX:Int = taille / 2
  Local MaxX:Int = 800 - taille / 2
  Local MinY:Int = taille / 2
  Local MaxY:Int = 600 - taille / 2

  'on s'assure que le joueur ne depasse pas ses valeurs
  'Max est une fonction qui retourne la valeur maxium de ses deux arguments
  'Min est une fonction qui retourne la valeur minimim de ses deux arguments
  x = Max(MinX, x)
  x = Min(MaxX, x)
  y = Max(MinY, y)
  y = Min(MaxY, y)

Until KeyDown(Key_Escape)
