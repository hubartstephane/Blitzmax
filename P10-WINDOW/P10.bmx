' le programme suivant permettait de deplacer un joueur a la vitesse de 3 pixels par boucle d'affichage (ce qu'on a appelle une FRAME)
' le probleme est que la vitesse de chaque ordinateur varie 
' donc le temps pris par une boucle d'affichage est variable
' si on veut que le joueur se deplace a la meme vitesse quelque soit la machine, il va falloir faire un peu de physique et utiliser le TEMPS
' la formule est plutot simple
'
' distance = vitesse * duree
'
' on va utiliser une vitesse en pixels/seconde
' il nous faut un temps en seconde
'
' on va donc essayer de calculer le temps que prends une FRAME

Graphics 800,600, 0

'x et y sont les coordonnees du joueur (son centre)
Local x:Int = 400
Local y:Int = 300
'la taille du joueur
Local taille:Int = 30
'vitesse de deplacement du joueur


'------------------------------------------------------------------
' la vitesse est maintenant exprimee en pixels par seconde
' et c'est un nombre a virgule !
Local vitesse:Float = 200.0
'------------------------------------------------------------------

'------------------------------------------------------------------
' on recupere dans une variable le temps au tout debut du programme
' plusieurs subtilités
' MilliSecs est une fonction qui retourne le temps en millisecondes
' Il faut diviser par 1000.0 pour avoir le nombre de secondes
' le probleme est que MilliSecs retourne un nombre entier qui sera tres petit (largement inferieur a la seconde)
' si on divise un nombre entier petit par un nombre plus grand (1000), on obtiendra systematiquement 0
' Float(...) nous permet de convertir ce nombre entier en nombre a virgule
' et donc apres la division on aura une valeur inferieure a 1, mais pas 0
Local t1:Float = Float(MilliSecs()) / 1000.0
'------------------------------------------------------------------

Repeat

  '------------------------------------------------------------------
  ' Point A:
  ' on recupere encore une fois le temps en seconde
  ' on en deduit une durée
  ' au premier passage dans cette boucle t1 et t2 sont tres proches
  ' mais apres un passage, ca fera sens
  Local t2:Float = Float(MilliSecs()) / 1000.0
  Local duree:Float = (t2 - t1)
  '------------------------------------------------------------------

  'on efface la zone de dessin
  Cls 

  'on affiche la duree de cette frame
  DrawText duree, 20, 20

  'on va dessiner en vert cette fois-ci
  SetColor 0, 255, 0

  'on affiche le joueur
  'x et y sont les coordonnees du centre du joueur
  'si on veut les coordonnees du coin (haut-gauche) du rectangle, il faut soustraire la moitie de la taille
  DrawRect x - taille / 2, y - taille / 2, taille, taille

  'on affiche l'image complete
  Flip

  'on deplace le joueur


  '------------------------------------------------------------------
  ' on calcul le nombre de pixel de deplacement grace a notre formule physique du debut
  ' un nombre de pixels est un nombre entier, or duree et vitesse sont deux nombres a virgules
  ' Int(...) nous permet de convertir en nombre entier
  Local deplacement:Int = Int(duree * vitesse)
  '------------------------------------------------------------------

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


  '------------------------------------------------------------------
  ' t2 etait le temps au tout debut de notre boucle
  ' quand on reviendra en haut de la boucle au Point A, on aura bien calculé la durée de le boucle 
  t1 = t2
  '------------------------------------------------------------------
Until KeyDown(Key_Escape)
