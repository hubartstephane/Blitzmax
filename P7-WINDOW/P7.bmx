' Graphics est une fonction qui permet d'ouvrir une fenetre
' ici 800 est la largeur
'     600 est la hauteur
'       0 ne nous interresse pas pour l'instant
Graphics 800,600, 0

' On fait ici une boucle qui s'arrete quand on appuie sur la touche ESCAPE
' si on ne faisait pas cette boucle, le program arriverait a sa fin juste apres avoir creer une fenetre
' la fenetre serait detruite immediatement. Ce n'est pas ce qu'on veut
' KeyDown est une Fonction qui retourne TRUE si la touche qu'on lui donne en parametre est appuyée, FALSE sinon
Repeat



Until KeyDown(Key_Escape)