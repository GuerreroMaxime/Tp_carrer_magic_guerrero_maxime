Program	carre_magique;	//nom du programme

Uses crt;				//bibiotheque utiliser

CONST
	MAX=5;				//La constant va permetre de modifier la taille du tableau (si max=5 alors le tableau sera de 5x5)
	
TYPE
	Tableau2dim=array[1..MAX,1..MAX] of integer;	//type du teableau


Procedure Affichage(tab4:Tableau2dim);	//cette procedure va permetre de generer la base du tableau
			
	VAR
		i,j :integer;
			
	Begin
		For j:=1 to max do
			Begin
				For i:=1 to max do
					Begin
						If (tab4[i,j]<=9) then

							Write('  ', tab4[i,j])	//Les ' ' permetron d'afficher un espace entre chaque nombre
						Else
							Write('  ', tab4[i,j])

				        End;
				Writeln;
		 	End;
	End;


Procedure TestBordureDroite(var tbdx:integer; var tbdy:integer); //cette procedure permetra de faire revenir sur la gauche quand les chiffre sortirons du tableau

	Begin
		IF tbdx>MAX then
			Begin
				tbdx:=1;  		
			End;
		IF tbdy<1 then
			Begin
				tbdy:=MAX;
			End;
	End;


Procedure TestBordureGauche(var tbgx:integer; var tbgy:integer); //cette procedure permetra de faire revenir sur le bas quand les chiffre sortirons du tableau

	Begin
		IF tbgx-1<1 then
			tbgx:=MAX
		else
			tbgx:=tbgx-1;

		If tbgy-1<1 then
			tbgy:=MAX
		Else
			tbgy:=tbgy-1;
	End;	


Function Test(var tab2:Tableau2dim;var tx:integer; var ty:integer):boolean; //Il permetra de faire des test pour voir si les bordure sont respecter

	Begin
		IF tab2[tx,ty]=0 then
			Test:=True
		Else
			Test:=False;
	End;
	

Procedure Initialisation(VAR mtrc1:Tableau2dim; VAR abs:integer; VAR ord:integer); //L'itinialisation va permetre de placer les cases ainsi que la 1er case (le numero 1) dans le tableau
	
	VAR
		i,j:integer;
			
	Begin
		For j:=1 to MAX do
			Begin
				For i:=1 to MAX do
					Begin
						mtrc1[i,j]:=0
					End;
				Writeln;
			End;
		mtrc1[(MAX div 2)+1,(MAX div 2)]:=1;
		abs:=((MAX div 2)+1);
		ord:=(MAX div 2);
	End;
	

Procedure Remplissage(VAR tab:Tableau2dim; VAR x:integer; VAR y:integer); //Le rempissage va metre les cases suivante au nord-ouest de chacun, et quand il revien sur une case deja ocupper il ce déplace au nord-est de cette derniere
	
	VAR
		i,j :integer;
			
	Begin
		For i:=2 to (MAX*MAX) do
		Begin
			x:=x+1;
			y:=y-1;
			TestBordureDroite(x,y);
			If (Test(tab,x,y)=False) then
				Begin
					Repeat
						TestBordureGauche(x,y);
					Until (Test(tab,x,y)=True);
				End;
			tab[x,y]:=i;
                        clrscr;
			Affichage(tab);
		End;
	End;


VAR
	mtrc :Tableau2dim;
	abscisse,ordonnee :integer;
	
Begin											//Ceci est le programme qui executera les procedure et affichera le tableau

        initialisation(mtrc,abscisse,ordonnee);
        Remplissage(Mtrc,abscisse,ordonnee);
	Readln;
End.


{ALGORITHME: carre magique
BUT:	utiliser tableau à 2 dimensions.
	1er entier : "1" se trouve au nord du milieu de la table
	On place les chiffres de façon croissante en allant au Nord Est de la position courante.
	Si place déjà prise, on se déplace au Nord West jusqu'à trouver une place libre.
	Tableau considéré comme sphérique, si on arrive au-delà de la dernière colonne, on arrive au delà de la première colonne de même pour les lignes.
	Découper programme en procédures et fonctions.
ENTREE: Confirmation pour lancer le prochain affichage à chaque nombre ajouté
SORTIEE: Affichage matrice du carré magique


CONST
	MAX=5
	
TYPE
	Tableau2dim:tableau[1..MAX,1..MAX] DE ENTIER


Procédure Affichage(tab4:Tableau2dim)
			
	VAR
		i,j:ENTIER
			
	DEBUT
		POUR j <- 1 A MAX FAIRE
			DEBUT
				POUR i <- 1 A MAX FAIRE
					DEBUT
						SI tab4[i,j]<=9 ALORS  
							ECRIRE("  "& tab4[i,j]) 
						SINON
							ECRIRE(" "& tab4[i,j])	
						FINSI
					FIN
				ECRIRE 
				FINPOUR
			FIN
		FINPOUR
	FIN
	

Procédure TestBordureDroite(var tbdx:ENTIER; var tbdy:ENTIER)

	DEBUT
		SI tbdx>MAX ALORS 
			DEBUT
				tbdx <- 1  		
			FIN
		FINSI
		SI tbdy<1 ALORS 
			DEBUT
				tbdy <- MAX  
			FIN
		FINSI
	FIN


Procédure TestBordureGauche(var tbgx:ENTIER; var tbgy:ENTIER) 

	DEBUT
		SI tbgx-1<1 ALORS
			tbgx <- MAX  
		SINON
			tbgx <- x2-1  
		FINSI
		SI tbgy-1<1 ALORS
			tbgy <- MAX  
		SINON
			tbgy <- tbgy-1  
		FINSI
	FIN


Fonction Test (tab2:Tableau2dim; tx:ENTIER ; tx:ENTIER) 
	
	DEBUT
		SI tab2[tx,ty]=0 ALORS
			Test <- VRAI 
		SINON
			Test <- FAUX  
		FINSI
	FIN
	

Procedure Initialisation(VAR mtrc1:Tableau2dim; VAR abs:ENTIER; VAR ord:ENTIER);
	
	VAR
		i,j:ENTIER
			
	DEBUT
		POUR j <- 1 A MAX FAIRE
			DEBUT
				POUR i <- 1 A MAX FAIRE
					DEBUT
						mtrc1[i,j] <- 0
					FIN
				ECRIRE
				FINPOUR
			FIN
		mtrc1[(MAX/2)+1,(MAX/2) <- 1]
		abs <- ((MAC/2)+1)
		ord <- (MAX/2)
		FINPOUR
	FIN
	

Procédure Remplissage(VAR tab:Tableau2dim; VAR x:ENTIER; VAR y:ENTIER)  
	
	VAR
		i,j:ENTIER
			
	DEBUT
		POUR i <- 2 A (MAX*MAX) FAIRE 
			x <- x+1
			y <- y-1 
			TestBordureDroite(x,y) //Lancement procédure TestBordureDroite, verification coodonnées dépassent bordure droite ET/OU sommet
			SI (Test(tab,x,y)=FAUX) ALORS //Test(tab,x,y)=VRAI
				DEBUT
					REPETER
						TestBordureGauche(x,y)  
					JUSQU'A (Test(tab,x,y)=VRAI)
					FINREPETER 
				FIN
			tab[x,y] <- i  
			LIRE Affichage(tab)
			FINSI  
		FINPOUR
	FIN


VAR
	mtrc:Tableau2dim
	abscisse,ordonnee:ENTIER
	
DEBUT
	mtrc <- Initialisation 
	abscisse <- Initialisation
	ordonnee <- Initialisation
	Remplissage(Matrice,abscisse,ordonnee)
	LIRE
FIN}
