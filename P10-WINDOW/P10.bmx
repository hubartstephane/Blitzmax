Local viewport_x:Int = 0
Local viewport_y:Int = 0
Local viewport_width:Int = 0
Local viewport_height:Int = 0


Local desktop_width = DesktopWidth()
Local desktop_height = DesktopHeight()

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

Global window_width  = desktop_width
Global window_height = desktop_height

Graphics window_width, window_height, 0

'x et y sont les coordonnees du joueur (son centre)
Local x:Int = 400
Local y:Int = 300
'la taille du joueur
Local taille:Int = 30
'vitesse de deplacement du joueur


GetViewport(viewport_x, viewport_y, viewport_width, viewport_height)

Print "viewport_x      " + viewport_x
Print "viewport_y      " + viewport_y
Print "viewport_width  " + viewport_width
Print "viewport_height " + viewport_height


'------------------------------------------------------------------
' la vitesse est maintenant exprimee en pixels par seconde
' et c'est un nombre a virgule !
Local vitesse:Float = 200.0
'------------------------------------------------------------------

Global spaceship_angle:Float = 0


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

Global spaceship:TImage = LoadImage("spaceship.png", -1)
Global spaceship_size_factor:Float = 1.0 / 3.0

Function Dessine(x:Float, y:Float, taille:Float, t:Float)

	SetClsColor 0, 0, 255

  Cls 

	
  DrawText t, 20, 20

  SetColor 255, 255, 255

	SetOrigin(100, 100)

	SetRotation(spaceship_angle)
	Local spaceship_width:Int = Float(ImageWidth(spaceship)) * spaceship_size_factor
	Local spaceship_height:Int = Float(ImageHeight(spaceship)) * spaceship_size_factor
	DrawImageRect(spaceship, x, y, spaceship_width, spaceship_height)
	SetRotation(0.0)
	
	
	Plot x, y

  Flip

End Function


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

	Dessine(x, y, taille, t2)

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

	If KeyDown(Key_A)
		spaceship_angle = spaceship_angle + 100.0 * duree
	Else If KeyDown(Key_Z)
		spaceship_angle = spaceship_angle - 100.0 * duree
	End If

  'a ce stade, rien n'empeche le joueur de sortir de l'ecran
  'on calcul les valeurs maximales et minimales acceptees pour X et Y du joueur

	Local spaceship_width:Int = Float(ImageWidth(spaceship)) * spaceship_size_factor
	Local spaceship_height:Int = Float(ImageHeight(spaceship)) * spaceship_size_factor

  Local MinX:Int = 0
  Local MaxX:Int = window_width - spaceship_width
  Local MinY:Int = 0
  Local MaxY:Int = window_height - spaceship_height

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
