TITLE Spaceinvaders
.MODEL SMALL
.STACK 100H
.DATA
	MENU0				DB		'	    DARTH INVADERS    $'
	MENU1				DB		'    A long time ago in a galaxy far,' ,0AH,0DH, '                   far away...$'
	MENU2				DB		'          Press space to begin$'
	MENU_ERRADO			DB		'            Opcao Invalida!$'
	MENU_VITORIA1		DB		'        Congratulations! You Win!$'
	MENU_VITORIA2		DB		'	       SCORE:$'
	MENU_VITORIA3		DB		'       Press space to play again$'
	MENU_VITORIA4		DB		'              ESC to quit$'
	MENU_AJUDA1			DB		'          Press A to move left$'
	MENU_AJUDA2			DB		'          Press D to move right$'
	MENU_AJUDA3			DB		'             Space to shot$'
	MENU_AJUDA4			DB		'     You win if you kill all enemies$'
	MENU_AJUDA5			DB		'   You lose if you lost all your BB-8$'
	MENU_AJUDA6			DB		'                SURVIVE!$'
	MENU_AJUDA7			DB		'            Space to continue$'
	MENU_AJUDA8			DB		'        Press P to pause the game$'
	MENU_DERROTA1		DB		'                YOU LOSE!$'
	MENU_DERROTA2		DB		'                SCORE:$'
	MENU_DERROTA3		DB		'           Space to play again$'
	MENU_DERROTA4		DB		'               ESC to quit$'
	JogoPausado			DB		' Game Paused$'
	MensagemCreditos	DB		'   Created by:' ,0AH,0DH,0AH,0DH, '      Matheus Pupo and Murilo Martos' ,0AH,0DH,0AH,0DH, '          Thank you for playing$'
	NLINHA				DB	?
	X					DW	?
	Y					DW	?
	AcertouX			DW	?
	AcertouY			DW	?
	FixoX				DW	?
	FixoY				DW	?
	TiroJogadorX		DW	?
	TiroJogadorY		DW	?
	Atirando			DW	?			;Controla se ja possui um tiro na tela ou nao
	TiroAtivado			DW	0
	ControlaTiroAliens	DW	?			;Controla se ja possui um tiro de alien na tela ou nao
	TiroAtivadoAliens	DW	0
	UltimoTiroAlien		DW	?
	POSICAO_TIRO		DW	?
	AlienTiroX			DW	?
	AlienTiroY			DW	?
	FixoXLimpa			DW	?
	FixoYLimpa			DW	?
	NovoFixoX			DW	?
	NovoFixoY			DW	?
	AtualX				DW	?
	AtualY				DW	?
	Direcao				DW	0
	Pontuacao			DW	0
	Aleatorio			DW	?
	MeteoroX			DW	?
	MeteoroY			DW	?
	ULTIMA_LINHA		DW	?
	ACABOU_JOGO			DW	0
	Cor					DB	?
	VidasX				DW	?
	VidasY				DW	?
	VidasJogador		DW	4
	PONTOS				DB	' SCORE  $'
	VIDAS				DB	'			 LIVES$'
	
MATRIZ_LINHA1		DB	0,0,0,0,0,0,0,0,0,0,0, "$"
MATRIZ_LINHA2		DB	0,0,0,0,0,0,0,0,0,0,0, "$"						;1 para verdadeiro, 1 para falso, 
MATRIZ_LINHA3		DB	0,0,0,0,0,0,0,0,0,0,0, "$"					;começa com 1 pq imprime todos os aliens
MATRIZ_LINHA4		DB	0,0,0,0,0,0,0,0,0,0,0, "$"
MATRIZ_LINHA5		DB	0,0,0,0,0,0,0,0,0,0,1, "$"

;						1,1,1,1,1,1,1,1,1,1,1,					;testes para control+c e control+v
;						0,0,0,0,0,0,0,0,0,0,0,					;testes para control+c e control+v


MeteorosVida		DB	5,5,5,5,"$"

	
Jogador				DB	00,00,00,08,00,08,00,00,00,00		;10 colunas por 14 linhas
					DB	00,00,00,08,00,08,00,00,00,00
					DB	00,00,08,07,00,07,08,00,00,00
					DB	00,00,08,07,00,07,08,00,08,00
					DB	00,15,08,07,08,07,08,15,08,15
					DB	00,15,15,08,08,08,08,08,08,15
					DB	00,15,08,07,07,07,08,08,08,15
					DB	15,08,07,06,04,06,07,08,15,00
					DB	15,08,07,07,06,07,07,08,15,00
					DB	00,08,08,07,08,07,08,08,00,00
					DB	15,07,08,08,08,08,08,07,15,00
					DB	15,07,08,07,07,07,08,07,15,00
					DB	00,08,07,07,07,07,06,08,00,00
					DB	00,00,15,15,15,15,15,00,00,00,"$"
					
AcertouTiro			DB	04,04,00,08,04,04,00,00,04,04		;10 colunas por 14 linhas
					DB	04,00,00,08,04,04,00,00,00,04
					DB	04,00,08,07,04,04,08,00,00,04
					DB	04,00,08,07,00,07,08,00,08,04
					DB	00,15,08,07,08,07,08,15,08,15
					DB	00,15,15,08,04,04,08,08,08,15
					DB	04,04,08,04,04,04,04,08,04,04
					DB	04,04,07,04,04,04,04,08,04,04
					DB	15,08,07,07,04,04,07,08,15,00
					DB	00,08,08,07,08,07,08,08,00,00
					DB	04,07,08,08,08,08,08,07,15,04
					DB	04,07,08,07,04,04,08,07,15,04
					DB	04,08,07,07,04,04,06,08,00,04
					DB	04,04,15,15,04,04,15,00,04,04,"$"
					
BB8					DB	00,00,00,00,08,08,08,00,00,00,00		;11 colunas por 16 linhas
					DB	00,00,00,15,15,15,15,15,00,00,00
					DB	00,00,06,15,00,00,15,06,06,00,00
					DB	00,00,15,15,00,00,15,15,15,00,00
					DB	00,00,01,04,15,15,15,15,06,00,00
					DB	00,00,00,08,08,08,08,08,00,00,00
					DB	00,00,15,15,15,15,15,15,06,00,00
					DB	00,15,15,15,15,15,15,06,08,08,00
					DB	00,06,06,06,15,15,15,06,08,15,00
					DB	06,08,08,15,06,15,15,06,15,08,07
					DB	15,08,08,15,06,15,15,15,06,06,06
					DB	08,15,08,06,15,15,15,15,15,15,15
					DB	15,06,06,06,15,15,15,15,15,15,15
					DB	00,15,15,15,15,06,06,06,15,15,00
					DB	00,00,15,15,06,08,08,08,06,00,00
					DB	00,00,00,06,08,15,15,15,00,00,00,"$"

BB8Apagado			DB	00,00,00,00,00,00,00,00,00,00,00		;11 colunas por 16 linhas
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,"$"
					
Inimigo1			DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,08,00,00,00,00,00,08,00,00,00,00,00,08,00	;15	colunas	por	12	linhas		Tie	Fighter	front	line
					DB	00,08,00,00,00,00,08,07,08,00,00,00,00,08,00
					DB	00,08,00,00,00,08,07,07,07,08,00,00,00,08,00
					DB	00,08,08,00,08,07,15,15,15,07,08,00,08,08,00
					DB	00,08,07,07,08,15,15,15,15,15,08,07,07,08,00
					DB	00,08,08,00,08,07,15,15,15,07,08,00,08,08,00
					DB	00,08,00,00,00,08,07,07,07,08,00,00,00,08,00
					DB	00,08,00,00,00,00,08,07,08,00,00,00,00,08,00
					DB	00,08,00,00,00,00,00,08,00,00,00,00,00,08,00,"$"

Inimigo2			DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,08,00,00,00,08,08,08,00,00,00,08,00,00	;15	colunas	por	12	linhas		Middle	Line
					DB	00,08,07,00,00,08,06,06,06,08,00,00,07,08,00
					DB	00,08,07,08,08,08,06,06,06,08,08,08,07,08,00
					DB	00,08,07,00,00,07,06,06,06,07,00,00,07,08,00
					DB	00,08,07,00,00,08,06,06,06,08,00,00,07,08,00
					DB	00,08,07,00,00,06,06,06,06,06,00,00,07,08,00
					DB	00,00,08,00,00,00,08,06,08,00,00,00,08,00,00
					DB	00,00,00,00,00,00,06,08,06,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,08,00,00,00,00,00,00,00,"$"
			
Inimigo3			DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,15,15,15,00,00,00,00,00,00	;15	colunas	por	18	linhas		Star	Destroyer	Back	Line
					DB	00,00,00,00,00,15,08,09,08,15,00,00,00,00,00
					DB	00,00,00,00,15,07,07,08,07,07,15,00,00,00,00
					DB	00,00,00,00,15,07,07,07,07,07,15,00,00,00,00
					DB	00,00,00,00,15,07,07,07,07,07,15,00,00,00,00
					DB	00,00,00,00,00,15,07,08,07,15,00,00,00,00,00
					DB	00,00,00,00,00,15,08,07,08,15,00,00,00,00,00
					DB	00,00,00,00,00,15,07,07,07,15,00,00,00,00,00
					DB	00,00,00,00,00,15,07,07,07,15,00,00,00,00,00
					DB	00,00,00,00,00,15,07,07,07,15,00,00,00,00,00
					DB	00,00,00,00,00,00,15,07,15,00,00,00,00,00,00
					DB	00,00,00,00,00,00,15,07,15,00,00,00,00,00,00
					DB	00,00,00,00,00,00,15,08,15,00,00,00,00,00,00
					DB	00,00,00,00,00,00,15,08,15,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,15,00,00,00,00,00,00,00,"$"
					
Meteoro				DB	00,00,00,00,00,00,08,08,08,08,00,00,00,00,00,00,00,00
					DB	00,00,00,00,08,08,08,08,08,08,08,08,08,08,00,00,00,00
					DB	00,00,00,07,08,08,08,08,08,08,08,08,08,08,08,00,00,00
					DB	00,00,08,08,07,07,08,08,08,08,08,08,08,08,08,08,00,00
					DB	00,08,08,08,08,08,07,07,08,08,08,08,08,08,08,08,07,00
					DB	00,07,07,08,08,08,08,08,07,07,07,07,07,08,08,07,08,00
					DB	00,08,08,07,08,08,07,08,08,08,08,08,08,07,07,08,08,08
					DB	00,08,07,08,07,08,15,07,08,08,08,07,08,08,08,08,08,08
					DB	08,07,07,08,07,08,08,08,08,08,08,08,07,08,08,08,08,00
					DB	08,08,08,07,08,08,08,08,07,07,08,08,08,08,08,08,08,00
					DB	08,08,08,07,08,08,08,07,08,08,07,08,08,08,07,07,00,00
					DB	08,08,07,08,08,08,07,08,08,08,07,08,08,07,08,08,00,00
					DB	00,07,08,08,08,07,08,08,07,08,07,08,07,08,08,08,08,00
					DB	00,08,08,08,08,07,08,07,08,08,07,08,07,08,08,08,08,00
					DB	00,00,08,08,15,07,08,08,08,08,07,08,07,08,08,08,00,00
					DB	00,00,00,08,08,08,07,08,08,07,08,07,08,07,08,00,00,00
					DB	00,00,00,00,08,08,08,07,07,08,08,07,08,08,00,00,00,00
					DB	00,00,00,00,00,00,08,08,08,08,08,08,00,00,00,00,00,00,"$"

Meteoro1			DB	00,00,00,00,00,00,00,00,08,08,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,08,08,08,08,00,00,00,00,00,00,00
					DB	00,00,00,00,08,08,08,08,08,08,08,08,08,00,00,00,00,00
					DB	00,00,00,00,07,07,08,08,08,08,08,08,08,08,00,00,00,00
					DB	00,00,08,00,08,08,07,07,08,08,08,08,08,08,08,00,00,00
					DB	00,00,07,08,08,08,08,08,07,07,07,07,07,08,08,00,00,00
					DB	00,00,08,07,08,08,07,08,08,08,08,08,08,07,07,08,00,00
					DB	00,08,07,08,07,08,15,07,08,08,08,07,08,08,08,08,00,00
					DB	08,08,07,08,07,08,08,08,08,08,08,08,07,08,08,08,08,08
					DB	00,07,08,07,08,08,08,08,07,07,08,08,08,08,08,08,08,00
					DB	00,00,08,07,08,08,08,07,08,08,07,08,08,08,07,07,00,00
					DB	00,00,07,08,08,08,07,08,08,08,07,08,08,07,08,08,00,00
					DB	00,00,08,08,08,07,08,08,07,08,07,08,07,08,08,00,00,00
					DB	00,00,00,08,08,07,08,07,08,08,07,08,07,08,08,00,00,00
					DB	00,00,00,00,00,07,08,08,08,08,07,08,07,08,08,00,00,00
					DB	00,00,00,00,00,08,07,08,08,07,08,07,08,07,08,00,00,00
					DB	00,00,00,00,00,00,08,07,07,08,08,07,08,08,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,"$"
					
Meteoro2			DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,08,08,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,08,08,08,08,08,08,00,00,00,00,00,00
					DB	00,00,00,00,07,07,08,08,08,08,08,08,08,00,00,00,00,00
					DB	00,00,00,00,08,08,07,07,08,08,08,08,08,08,00,00,00,00
					DB	00,00,00,08,08,08,08,08,07,07,07,07,07,08,00,00,00,00
					DB	00,00,00,07,08,08,07,08,08,08,08,08,08,07,07,00,00,00
					DB	00,00,07,08,07,08,15,07,08,08,08,07,08,08,08,08,00,00
					DB	00,08,07,08,07,08,08,08,08,08,08,08,07,08,08,08,08,00
					DB	08,00,08,07,08,08,08,08,07,07,08,08,08,08,08,08,00,07
					DB	00,00,00,07,08,08,08,07,08,08,07,08,08,08,07,00,00,00
					DB	00,00,00,00,08,08,07,08,08,08,07,08,08,07,00,00,00,00
					DB	00,00,00,00,00,07,08,08,07,08,07,08,07,08,00,00,00,00
					DB	00,00,00,00,00,07,08,07,08,08,07,08,07,08,00,00,00,00
					DB	00,00,00,00,00,07,08,08,08,08,07,08,07,00,00,00,00,00
					DB	00,00,00,00,00,00,07,08,08,07,08,07,08,00,00,00,00,00
					DB	00,00,00,00,00,00,00,07,07,08,08,07,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,"$"
					
Meteoro3			DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,08,08,08,08,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,07,07,08,08,08,00,00,00,00,00,00,00
					DB	00,00,00,00,08,08,08,08,07,07,07,07,00,00,00,00,00,00
					DB	00,00,00,00,08,08,07,08,08,08,08,08,08,00,00,00,00,00
					DB	00,00,15,08,07,08,15,07,08,08,08,07,08,08,00,00,00,00
					DB	00,08,07,08,07,08,08,08,08,08,08,08,07,08,07,08,00,00
					DB	08,07,08,07,08,08,08,08,07,07,08,08,08,08,07,00,08,08
					DB	00,00,00,07,08,08,08,07,08,08,07,08,08,08,00,00,00,00
					DB	00,00,00,00,08,08,07,08,08,08,07,08,08,00,00,00,00,00
					DB	00,00,00,00,00,07,08,08,07,08,07,08,00,00,00,00,00,00
					DB	00,00,00,00,00,00,08,07,08,08,07,08,00,00,00,00,00,00
					DB	00,00,00,00,00,00,08,08,08,08,07,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,08,08,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,"$"

Meteoro4			DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,08,08,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,08,07,07,07,00,00,00,00,00,00,00
					DB	00,00,00,00,00,08,07,08,08,08,08,00,00,00,00,00,08,07
					DB	00,00,00,00,00,08,15,07,08,08,08,07,00,00,07,00,00,15
					DB	00,00,08,00,07,08,08,08,08,08,08,08,00,00,00,08,00,00
					DB	00,08,07,00,08,08,08,08,07,07,08,08,08,00,00,00,00,00
					DB	08,00,00,08,00,08,08,07,08,08,07,08,08,00,00,00,08,00
					DB	00,00,00,00,00,08,07,08,08,08,07,08,00,00,00,00,00,00
					DB	00,00,00,00,00,00,08,08,07,08,07,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,07,08,08,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,08,08,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
					DB	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,"$"
					
TiroJogador			DB	10
					DB	10
					DB	10
					DB	10
					DB	10
					DB	10
					DB	10,"$"
					
TiroInimigos		DB	04
					DB	04
					DB	04
					DB	04
					DB	04
					DB	04
					DB	04,"$"
					

.CODE
MAIN	PROC	;programa principal

MOV 	AX,@DATA
MOV		DS,AX

MOV		AX, 0A000h	; Offset da memoria de video
MOV		ES, AX		; passamos o valor do offset para ES

;display vga configura o modo de exibicao vga
MOV 	AH,0H	; set display mode function.
MOV		AL,13h	; mode 13h = 320x200 pixels, 256 colors.
INT		10h     ; set it!

CALL	MENU			;Chama o Menu do jogo


COMECA_DE_NOVO:

CALL    MENU_HELP


COMECA_PRIMEIRA_VEZ:

MOV		FixoX, 60		;Coordenada X meio
MOV		FixoY, 30		;Coordenada Y meio
MOV		FixoXLimpa, 60
MOV		FixoYLimpa, 30
MOV 	NovoFixoX, 60
MOV		NovoFixoY, 30
MOV		AX, 60
MOV		BX, 30

CALL PLACAR

PUSH		AX
PUSH		BX
PUSH		CX
PUSH		DX

MOV BX,52				;coordenada do meteoro
MOV CX,4
Meteoro1_0:
PUSH CX
CALL PrintMeteoro		;imprimi 1 meteoro
POP CX
DEC CX					;decrementa pra imprimir o proximo meteoro
CMP CX,0
JNZ Meteoro1_0

CALL	PosicaoJogador
CALL	Atual
CALL	PrintJogador

POP			DX
POP			CX
POP			BX
POP			AX

RESETA_Y:
MOV		FixoY, 30
MOV		NovoFixoY,	30
MOV		FixoYLimpa, 30


LOOP_MOV_NAVES:

waitForKey: mov   ah,01H

                        int   16H

                        jnz   gotKey       ;jmp if key is ready


MOV AX, NovoFixoX
MOV FixoX, AX
MOV FixoXLimpa, AX
CALL Acerta_alien

CALL PRINTA_INIMIGOS

CALL EncontraCoordenadas
CALL OrganizaShotAliens

PUSH		AX
PUSH		BX
PUSH		CX
PUSH		DX

CALL PLACAR

CALL DeterioraAlien
CALL Deteriora
CALL ControleMeteoros

POP			DX
POP			CX
POP			BX
POP			AX

CMP		TiroAtivado,	1
JNZ		ContinuaSemTiro

CALL	Shot

CALL	PrintJogador

ContinuaSemTiro:

CALL	MOV_ALIENS
CALL	VERIFICA_FIM
CALL	ENCERRA_JOGO

CALL	TIRA_VIDA_
;CALL	AlienMovMeteoro
CMP		VidasJogador, 0
JE		DERROTA
CMP		ULTIMA_LINHA, 0
JE		MENU_VITORIA_CALL
CMP		ACABOU_JOGO, 1			;SE CHEGAR NO FIM ACABA
JE 		DERROTA

JMP   waitForKey   ;loop back and check for a key



            gotKey:     mov ah, 00H        ;key is ready, get it

                        int 16H

CMP AL, 'a'					;Compara com tecla a para chamar procedimento para mover jogador
JE	MOVE_JOGADOR_ESQUERDA
CMP	AL,	'd'					;Compara com tecla d para chamar procedimento para mover jogador
JE	MOVE_JOGADOR_DIRETA
CMP AL, 20h					;Compara com tecla "espaço" para chamar procedimento para atirar
JE	Atirar
CMP	AL,	'p'					;Compara com a tecla P para pausar o jogo
JE	PausaJogo
CMP	AL, 27d;				;se for ESC sai do jogo
JE DERROTA


JMP LOOP_MOV_NAVES

MOVE_JOGADOR_ESQUERDA:
CALL	MovimentoEsquerda

JMP LOOP_MOV_NAVES

MOVE_JOGADOR_DIRETA:
CALL	MovimentoDireita

JMP LOOP_MOV_NAVES

MENU_VITORIA_CALL:
CALL MENU_VITORIA

PausaJogo:							;pausa o jogo
XOR		AX,	AX
CALL	MensagemJogoPausado
MOV		AH,	7H
INT		21H
CMP		AL, 27d;				;se for ESC sai do jogo
JE 		DERROTA
CMP		AL,	'p'
JNZ		PausaJogo

JMP LOOP_MOV_NAVES

Atirar:
MOV		AX, TiroJogadorY
MOV		BX, TiroJogadorX
CMP		TiroAtivado,	1
JE		VoltaSemAtirarDeNovo

SUB		Pontuacao,		5
MOV		Atirando,		23
CALL	Shot

VoltaSemAtirarDeNovo:
JMP		LOOP_MOV_NAVES
DERROTA:
CALL	MENU_DERROTA
FIM_DO_JOGO:
CALL	Creditos


;volta para o modo padrao de visualizacao do DOS
MOV		AH,0H	; set display mode function.
MOV		AL,3h	; mode 3h default.
INT		10h    

MOV		AH,4CH	;finaliza o programa e retorna ao dos
INT		21H

MAIN	ENDP

;===============================================================================================================================;

Creditos			PROC

MOV		NLINHA, 60d		;Limpa a tela
CALL	VLINHA

MOV AH,2H			;MOVE O CURSOR PRO TOPO PARA IMPRIMIR AS STRINGS LA EM CIMA
XOR DX,DX
XOR BH,BH
INT 10H

MOV		NLINHA, 10d		;Limpa a tela
CALL	VLINHA

LEA		DX,	MensagemCreditos
MOV		AH,	9H
INT		21H

CALL	DELAY
CALL	DELAY
CALL	DELAY
CALL	DELAY

RET
Creditos			ENDP

;===============================================================================================================================;

NumeroRandomico		PROC

PUSH		AX
PUSH		BX
PUSH		CX
PUSH		DX

PegaNumero:
MOV AH, 00h  ; interrupts to get system time        
INT 1Ah      ; CX:DX now hold number of clock ticks since midnight 

MOV	BH,	0
MOV	AH,	DL		;compara se o numero pego é menor que 0, se for, pega outro numero novamente
CMP	AH,	BH
JB	PegaNumero

ADD		DX,	1327				;funcao para manter mais randomico

XOR	DH,	DH					;zera DH pra dar certo
MOV	AX,	DX					;move AX que sera dividido
CWD

MOV	BX,	11				;move 11 para dividir
DIV	BX

MOV	Aleatorio,	DX			;move o resto da divisao do numero aleatorio por 11 para a variavel "Aleatorio"

POP			DX
POP			CX
POP			BX
POP			AX

RET
NumeroRandomico		ENDP

;===============================================================================================================================;

EncontraCoordenadas		PROC

PUSH	AX
PUSH	BX
PUSH	CX
PUSH	DX

CMP		TiroAtivadoAliens,	1					;se tiver ativado, é pq esta atirando, então nao pega a posicao do novo tiro
JE		NaoPegaPosicao

MOV		AX,	FixoX
ADD		AX,	7

MOV		BX,	FixoY
ADD		BX,	4

MOV		AlienTiroX,	AX
MOV		AlienTiroY,	BX			;pega a coordenada do ultimo alien da direita como suporte

NaoPegaPosicao:
POP		DX
POP		CX
POP		BX
POP		AX

RET
EncontraCoordenadas		ENDP

;===============================================================================================================================;

OrganizaShotAliens			PROC

PUSH	AX
PUSH	BX
PUSH	CX
PUSH	DX
PUSH	SI

CMP		TiroAtivadoAliens,	1			;1 SIM, 0 NAO, OU SEJA, COMPARA SE TEM ALGUM ALIEN JA ATIRANDO
JE		ContinuaTiroAlien
JMP		AtiraAlien

ContinuaTiroAlien:
ADD		AlienTiroY,	7
JMP		AlienLinha5

AtiraAlien:
MOV		ControlaTiroAliens, 0
CALL	NumeroRandomico
MOV		SI,	Aleatorio
MOV		CX,	Aleatorio
CMP		CX,	0
JE		ContinuaAlien0

LoopAlienRand:
ADD		AlienTiroX,	21
DEC		CX
CMP		CX,	0
JE		ContinuaAlien0
JMP		LoopAlienRand

ContinuaAlien0:
MOV		SI,	Aleatorio
CMP		MATRIZ_LINHA5[SI],	1
JE		AlienLinha5
CMP		MATRIZ_LINHA4[SI],	1
JE		AlienLinha4
CMP		MATRIZ_LINHA3[SI],	1
JE		AlienLinha3
CMP		MATRIZ_LINHA2[SI],	1
JE		AlienLinha2
CMP		MATRIZ_LINHA1[SI],	1
JE		AlienLinha1
JMP		FimShotAliensSemAchar

AlienLinha5:
CALL	ShotAliens
CALL	ShotApagadoAliens
JMP		FimShotAliens

AlienLinha4:
CMP		TiroAtivadoAliens,	1
JE		AlienLinha4Continua
SUB		AlienTiroY,	14
AlienLinha4Continua:
CALL	ShotAliens
CALL	ShotApagadoAliens
JMP		FimShotAliens

AlienLinha3:
CMP		TiroAtivadoAliens,	1
JE		AlienLinha3Continua
SUB		AlienTiroY,	28
AlienLinha3Continua:
CALL	ShotAliens
CALL	ShotApagadoAliens
JMP		FimShotAliens

AlienLinha2:
CMP		TiroAtivadoAliens,	1
JE		AlienLinha2Continua
SUB		AlienTiroY,	42
AlienLinha2Continua:
CALL	ShotAliens
CALL	ShotApagadoAliens
JMP		FimShotAliens

AlienLinha1:
CMP		TiroAtivadoAliens,	1
JE		AlienLinha1Continua
SUB		AlienTiroY,	56
AlienLinha1Continua:
CALL	ShotAliens
CALL	ShotApagadoAliens
JMP		FimShotAliens

FimShotAliensSemAchar:
MOV		AlienTiroY,	0
MOV		AlienTiroX,	0

FimShotAliens:
POP		SI
POP		DX
POP		CX
POP		BX
POP		AX

RET
OrganizaShotAliens			ENDP

;===============================================================================================================================;

ShotAliens				PROC

PUSH 	AX
PUSH 	BX
PUSH 	CX
PUSH 	DX
PUSH	SI

MOV		TiroAtivadoAliens,	1
MOV		UltimoTiroAlien,	0

MOV		CL,	14
MOV		AX,	AlienTiroY
ComparaPosicaoTiroAlien:
CMP		AX,	210
JE		ChegaDeAtirarAliens
CMP		CL,	0
JE		TirosAliens
DEC		CL
INC		AX
JMP		ComparaPosicaoTiroAlien

ChegaDeAtirarAliens:
MOV		TiroAtivadoAliens,	0
MOV		UltimoTiroAlien,	1

TirosAliens:
MOV 	SI,0		;Variavel contadora da array
;30 colunas
MOV		AX,	AlienTiroY
MOV 	CL,7		;contadora das linhas
TiroAliens3:
MOV 	BX,	AlienTiroX	
MOV 	CH,1		;contadora das colunas
TiroAliens2:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL, TiroInimigos[SI]
MOV 	COR, DL

CALL PrintPixel

INC		SI
POP		AX
POP		CX
DEC		CH
INC		BX

CMP 	CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ 	TiroAliens2		;jump para imprimir a coluna e as linhas
;7 linhas
DEC 	AX
DEC 	CL			;apos imprimir a 1 coluna e a primeira linha, o programa imprime +6 linhas
CMP 	CL,0
JNZ 	TiroAliens3		;jump para imprimir as 6 linhas restantes


POP		SI
POP		DX
POP		CX
POP		BX
POP		AX

RET
ShotAliens				ENDP

;===============================================================================================================================;

ShotApagadoAliens			PROC

PUSH 	AX
PUSH 	BX
PUSH 	CX
PUSH 	DX
PUSH	SI


CMP		ControlaTiroAliens, 1				;e o primeiro tiro se for 0
JE		ApagaTiroAlien
JMP		FimTiroAlienApagado


ApagaTiroAlien:
SUB		AlienTiroY,	7


TirosAliensApagado:
MOV 	SI,0		;Variavel contadora da array
;30 colunas
MOV		AX,	AlienTiroY
MOV 	CL,7		;contadora das linhas
TiroAliens3Apagado:
MOV 	BX,	AlienTiroX	
MOV 	CH,1		;contadora das colunas
TiroAliens2Apagado:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL, 00
MOV 	COR, DL

CALL PrintPixel

INC		SI
POP		AX
POP		CX
DEC		CH
INC		BX

CMP 	CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ 	TiroAliens2Apagado		;jump para imprimir a coluna e as linhas
;7 linhas
DEC 	AX
DEC 	CL			;apos imprimir a 1 coluna e a primeira linha, o programa imprime +6 linhas
CMP 	CL,0
JNZ 	TiroAliens3Apagado		;jump para imprimir as 6 linhas restantes

ADD		AlienTiroY,	7

JMP		FimGeralAlienTiro

FimTiroAlienApagado:
MOV		ControlaTiroAliens,	1

FimGeralAlienTiro:

CMP		UltimoTiroAlien,	1
JE		LastShotAlien

POP		SI
POP		DX
POP		CX
POP		BX
POP		AX

RET							;NO ULTIMO TIRO ELE PULA ESSE RETURN PRA APAGAR O ULTIMO TIRO

LastShotAlien:

TirosAliensApagado0:
MOV 	SI,0		;Variavel contadora da array
;30 colunas
MOV		AX,	AlienTiroY
MOV 	CL,7		;contadora das linhas
TiroAliens3Apagado0:
MOV 	BX,	AlienTiroX	
MOV 	CH,1		;contadora das colunas
TiroAliens2Apagado0:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL, 0
MOV 	COR, DL

CALL PrintPixel

INC		SI
POP		AX
POP		CX
DEC		CH
INC		BX

CMP 	CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ 	TiroAliens2Apagado0		;jump para imprimir a coluna e as linhas
;7 linhas
DEC 	AX
DEC 	CL			;apos imprimir a 1 coluna e a primeira linha, o programa imprime +6 linhas
CMP 	CL,0
JNZ 	TiroAliens3Apagado0		;jump para imprimir as 6 linhas restantes

MOV		UltimoTiroAlien,	0

POP		SI
POP		DX
POP		CX
POP		BX
POP		AX
RET
ShotApagadoAliens			ENDP

;===============================================================================================================================;

MovimentoEsquerda	PROC

CALL	ApagaJogador

CMP		X,	3		;compara se X chegou no limite da tela			A formula para isso é Limite = PosicaoInicial + (Quantidade de movimentos * Deslocamento)
;Limite1 = 158 - (31 * 5)
JE		Limite1		;se chegou, ele nao vai somar mais 5 para se mover novamente

SUB		X,	5		;subtrai 5 para se mover para a direita
CALL	Atual		;controla as coordenadas

Limite1:
CALL  	PrintJogador	;printa o jogador na nova posicao, ou na mesma caso tenha chegou ao limite

RET
MovimentoEsquerda	ENDP

;===============================================================================================================================;

MovimentoDireita	PROC

CALL	ApagaJogador

CMP		X,	308		;compara se X chegou no limite da tela			A formula para isso é Limite = PosicaoInicial + (Quantidade de movimentos * Deslocamento)
;Limite2 = 158 + (30 * 5)
JE		Limite2		;se chegou, ele nao vai somar mais 5 para se mover novamente

ADD		X,	5		;soma 5 para se mover para a direita
CALL	Atual		;controla as coordenadas

Limite2:
CALL  	PrintJogador	;printa o jogador na nova posicao, ou na mesma caso tenha chegou ao limite

RET
MovimentoDireita	ENDP

;===============================================================================================================================;

Shot				PROC

PUSH 	AX
PUSH 	BX
PUSH 	CX
PUSH 	DX

CMP		Atirando,	0
JE		FimTiro

MOV		TiroAtivado,	1			;ativa o tiro, proibindo o jogador de atirar mais de uma vez
JMP		Tiros

FimTiro:

MOV		TiroAtivado,	0			;0 desativa o tiro continuo

Tiros:
MOV 	SI,0		;Variavel contadora da array
;30 colunas
MOV		AX,	TiroJogadorY
MOV 	CL,7		;contadora das linhas
Tiro3:
MOV 	BX,	TiroJogadorX	
MOV 	CH,1		;contadora das colunas
Tiro2:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL, TiroJogador[SI]
MOV 	COR, DL

CALL PrintPixel

INC		SI
POP		AX
POP		CX
DEC		CH
INC		BX

CMP 	CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ 	Tiro2		;jump para imprimir a coluna e as linhas
;7 linhas
INC 	AX
DEC 	CL			;apos imprimir a 1 coluna e a primeira linha, o programa imprime +6 linhas
CMP 	CL,0
JNZ 	Tiro3		;jump para imprimir as 6 linhas restantes

CMP		Atirando,	23
JE		SemApagar

CALL	ShotApagado

SemApagar:
SUB		TiroJogadorY, 7
DEC		Atirando

POP		DX
POP		CX
POP		BX
POP		AX

RET
Shot				ENDP


;===============================================================================================================================;

ShotApagado				PROC

ADD		TiroJogadorY,	7

MOV 	SI,0		;Variavel contadora da array
;30 colunas
MOV		AX,	TiroJogadorY
MOV 	CL,7		;contadora das linhas
Tiro4:
MOV 	BX,	TiroJogadorX
MOV 	CH,1		;contadora das colunas
Tiro5:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL, 0
MOV 	COR, DL

CALL PrintPixel

INC		SI
POP		AX
POP		CX
DEC		CH
INC		BX

CMP 	CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ 	Tiro5		;jump para imprimir a coluna e as linhas
;7 linhas
INC 	AX
DEC 	CL			;apos imprimir a coluna e a primeira linha, o programa imprime +6 linhas
CMP 	CL,0
JNZ 	Tiro4		;jump para imprimir as 6 linhas restantes

SUB		TiroJogadorY, 7

CMP		Atirando,	0
JE		FimApagado

RET

FimApagado:													;EXECUTA ESSA PARTE PARA SUMIR O ULTIMO TIRO
MOV 	SI,0		;Variavel contadora da array
;30 colunas
MOV		AX,	TiroJogadorY
MOV 	CL,7		;contadora das linhas
Tiro7:
MOV 	BX,	TiroJogadorX
MOV 	CH,1		;contadora das colunas
Tiro6:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL, 0
MOV 	COR, DL

CALL PrintPixel

INC		SI
POP		AX
POP		CX
DEC		CH
INC		BX

CMP 	CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ 	Tiro6		;jump para imprimir a coluna e as linhas
;7 linhas
INC 	AX
DEC 	CL			;apos imprimir a coluna e a primeira linha, o programa imprime +6 linhas
CMP 	CL,0
JNZ 	Tiro7		;jump para imprimir as 6 linhas restantes

RET

ShotApagado				ENDP


;===============================================================================================================================;
Atual					PROC

PUSH	AX
PUSH	BX

MOV		AX,	Y
MOV		BX,	X
MOV		AtualX,	BX
MOV		AtualY,	AX

POP		BX
POP		AX

RET
Atual					ENDP

;===============================================================================================================================;

PosicaoJogador			PROC

;Coordenadas para controlar a posicao do jogador
MOV 	Y,		182		;posicao inicial do jogador no eixo y
MOV 	X,		158		;posicao inicial do jogador no eixo X

RET
PosicaoJogador			ENDP

;===============================================================================================================================;

LINHA				PROC

MOV		AH,2H
MOV		DL,10D	;pula linha
INT		21H
RET

LINHA				ENDP

;===============================================================================================================================;

VLINHA				PROC

MOV CL, NLINHA			;POE O NUMERO DE LINHAS PRA PULAR EM CL

LOOPLINHA:
MOV		AH,2H
MOV		DL,10D	;pula linha
INT		21H

DEC CL					;DEC 1 PQ JA PULOU 1

CMP CL, 0h				;COMPARA SE É 0
JNE	LOOPLINHA			;VOLTA O LOOP SE NAO FOR

RET

VLINHA				ENDP

;===============================================================================================================================;
MENU				PROC
PUSH	AX
PUSH	BX
PUSH	CX
PUSH	DX
PUSH	SI

CALL	LINHA			;IMPRIME 1 LINHA

LEA		DX, MENU0
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 6d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU1
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 7d		;PULA 5 LINHAS
CALL	VLINHA

LEA		DX, MENU2
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 2d		;PULA 5 LINHAS
CALL	VLINHA

LEA		DX, MENU_VITORIA4
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

XOR		AX,AX
MOV		AH, 7h
INT		21h				;COMANDO PARA RECEBER UM CARACTERE SEM IMPRIMIR ELE NA TELA

CMP		AL, 20h			;COMPARA SE É BARRA DE ESPAÇO
JE		FIM_MENU		;SE FOR COMEÇA O JOGO

CMP		AL, 1Bh			;COMPARA SE É ESC
JE		FIM_JOGO		;SE FOR FECHA O JOGO

MOV		NLINHA, 4d		;PULA 3 LINHAS
CALL	VLINHA

LEA		DX, MENU_ERRADO
MOV		AH, 9h
INT		21h

RECEBE_NOVAMENTE:
XOR		AX,AX
MOV		AH, 7h
INT		21h				;COMANDO PARA RECEBER UM CARACTERE SEM IMPRIMIR ELE NA TELA

CMP		AL, 20h			;COMPARA SE É BARRA DE ESPAÇO
JE		FIM_MENU

CMP		AL, 1Bh			;COMPARA SE É ESC
JE		FIM_JOGO		;SE FOR FECHA O JOGO

JMP		RECEBE_NOVAMENTE

FIM_JOGO:
MOV		NLINHA, 28d		;Limpa a tela
CALL	VLINHA
JMP	FIM_DO_JOGO

FIM_MENU:

MOV		NLINHA, 28d		;Limpa a tela
CALL	VLINHA
POP		SI
POP		DX
POP		CX
POP		BX
POP		AX
RET

MENU				ENDP

;===============================================================================================================================;

PrintPixel			PROC

MOV CX,320
MUL CX			;multiply AX by 320 (cx value)
ADD AX,BX		; and add X
MOV DI,AX		; load Destination Index register with ax value (the coords to put the pixel)
MOV DL,Cor		;cor referente
MOV [ES:DI],DL

RET

PrintPixel			ENDP

;===============================================================================================================================;

PrintInimigo3		PROC


MOV		AX, FixoY
MOV		BX,	FixoX


MOV		SI,	0		;Variavel contadora da matriz
;13 colunas
MOV 	CL,	18		;contadora das linhas
Print_3:
MOV 	BX,	X
MOV		CH,	15		;contadora das colunas
Print3:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL,	Inimigo3[SI]
MOV		Cor,	DL

CALL PrintPixel

INC SI
POP AX
POP CX
DEC CH
INC BX

CMP CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ Print3		;jump para imprimir as 8 colunas e uma linha
;9 linhas
INC AX
DEC CL			;apos imprimir as 12 colunas e a primeira linha, o programa imprime +8 linhas
CMP CL,0
JNZ Print_3		;jump para imprimir as 7 linhas restantes

;deslocando a coodenada X 18 posicoes p/ direita - 12 referentes ao pixel do alien3 e 6 referentes ao deslocamento horizontal
MOV BX,X
ADD BX,21
MOV X,BX

;deslocando a coodenada Y para a origem
MOV AX,Y
MOV Y,AX

RET

PrintInimigo3		ENDP

;===============================================================================================================================;

PrintInimigo2		PROC


MOV		AX, FixoY
MOV		BX,	FixoX


MOV		SI,	0		;Variavel contadora da matriz
;13 colunas
MOV 	CL,	12 		;contadora das linhas
Print_2:
MOV 	BX,	X
MOV		CH,	15		;contadora das colunas
Print2:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL,	Inimigo2[SI]
MOV		Cor,	DL

CALL PrintPixel

INC SI
POP AX
POP CX
DEC CH
INC BX

CMP CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ Print2		;jump para imprimir as 8 colunas e uma linha
;9 linhas
INC AX
DEC CL			;apos imprimir as 12 colunas e a primeira linha, o programa imprime +8 linhas
CMP CL,0
JNZ Print_2	;jump para imprimir as 7 linhas restantes

;deslocando a coodenada X 18 posicoes p/ direita - 12 referentes ao pixel do alien3 e 6 referentes ao deslocamento horizontal
MOV BX,X
ADD BX,21
MOV X,BX

;deslocando a coodenada Y para a origem
MOV AX,Y
MOV Y,AX

RET

PrintInimigo2		ENDP

;===============================================================================================================================;

PrintInimigo1		PROC


MOV		AX, FixoY
MOV		BX,	FixoX


MOV		SI,	0		;Variavel contadora da matriz
;13 colunas
MOV 	CL,	12		;contadora das linhas
Print_1:
MOV 	BX,	X
MOV		CH,	15		;contadora das colunas
Print1:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL,	Inimigo1[SI]
MOV		Cor,	DL

CALL PrintPixel

INC SI
POP AX
POP CX
DEC CH
INC BX

CMP CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ Print1		;jump para imprimir as 8 colunas e uma linha
;9 linhas
INC AX
DEC CL			;apos imprimir as 12 colunas e a primeira linha, o programa imprime +8 linhas
CMP CL,0
JNZ Print_1	;jump para imprimir as 7 linhas restantes

;deslocando a coodenada X 18 posicoes p/ direita - 12 referentes ao pixel do alien3 e 6 referentes ao deslocamento horizontal
MOV BX,X
ADD BX,21
MOV X,BX

;deslocando a coodenada Y para a origem
MOV AX,Y
MOV Y,AX

RET

PrintInimigo1		ENDP

;===============================================================================================================================;

MensagemJogoPausado		PROC

PUSH	AX
PUSH	BX
PUSH	CX
PUSH	DX

MOV AH,2H			;MOVE O CURSOR PRO TOPO PARA IMPRIMIR AS STRINGS LA EM CIMA
XOR DX,DX
XOR BH,BH
INT 10H

CALL LINHA

LEA DX,	JogoPausado		;imprimindo a msg GAME PAUSED
MOV AH,9H
INT 21H

POP		DX
POP		CX
POP		BX
POP		AX

RET
MensagemJogoPausado		ENDP

;===============================================================================================================================;

PLACAR 				PROC

MOV AH,2H			;MOVE O CURSOR PRO TOPO PARA IMPRIMIR AS STRINGS LA EM CIMA
XOR DX,DX
XOR BH,BH
INT 10H

CALL LINHA

LEA DX,VIDAS		;imprimindo a msg LIVES 
MOV AH,9H
INT 21H

CALL	ControleVidas

MOV AH,2H			;MOVE O CURSOR PRO TOPO PARA IMPRIMIR AS STRINGS LA EM CIMA
XOR DX,DX
XOR BH,BH
INT 10H

CALL LINHA

LEA DX,PONTOS		;imprimindo a msg SCORE 
MOV AH,9H
INT 21H

MOV		BX,	Pontuacao
CALL	saidadecimal

RET
PLACAR				ENDP

;===============================================================================================================================;

ControleVidas		PROC

PUSH		AX
PUSH		BX
PUSH		CX
PUSH		DX
PUSH		SI

MOV		VidasX,	248
MOV		VidasY,	2

CMP		VidasJogador,	4
JE		Print3BB8
JMP		CmpVidas3

Print3BB8:
CALL	PrintVidas
ADD		VidasX,	20
CALL	PrintVidas
ADD		VidasX,	20
CALL	PrintVidas

CmpVidas3:
CMP		VidasJogador,	3
JE		Print2BB8
JMP		CmpVidas2

Print2BB8:
CALL	PrintVidas
ADD		VidasX,	20
CALL	PrintVidas
ADD		VidasX,	20
CALL	PrintVidasApagadas

CmpVidas2:
CMP		VidasJogador,	2
JE		Print1BB8
JMP		CmpVidas1

Print1BB8:
CALL	PrintVidas
ADD		VidasX,	20
CALL	PrintVidasApagadas
ADD		VidasX,	20
CALL	PrintVidasApagadas

CmpVidas1:
CMP		VidasJogador,	1
JE		Print0BB8
JMP		AcabaOJogo

Print0BB8:
CALL	PrintVidasApagadas
ADD		VidasX,	20
CALL	PrintVidasApagadas
ADD		VidasX,	20
CALL	PrintVidasApagadas

AcabaOJogo:

;Coloca aqui o print do menu que acabou o jogo

POP		SI
POP		DX
POP		CX
POP		BX
POP		AX
RET
ControleVidas		ENDP

;===============================================================================================================================;

PrintVidas			PROC

PUSH 	AX
PUSH 	BX
PUSH 	CX
PUSH 	DX

MOV 	SI,0		;Variavel contadora da array
;30 colunas
MOV		AX,	VidasY												;coordenada Y = 2
MOV 	CL,16		;contadora das linhas
Vidas3:
MOV 	BX,	VidasX												;coordenada X = 248
MOV 	CH,11		;contadora das colunas
Vidas2:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL, BB8[SI]
MOV 	COR, DL

CALL PrintPixel

INC		SI
POP		AX
POP		CX
DEC		CH
INC		BX

CMP 	CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ 	Vidas2		;jump para imprimir as 30 colunas e uma linha
;17 linhas
INC 	AX
DEC 	CL			;apos imprimir as 30 colunas e a primeira linha, o programa imprime +16 linhas
CMP 	CL,0
JNZ 	Vidas3	;jump para imprimir as 16 linhas restantes

POP		DX
POP		CX
POP		BX
POP		AX

RET
PrintVidas			ENDP

;==================================================================================================================================;

PrintVidasApagadas			PROC

PUSH 	AX
PUSH 	BX
PUSH 	CX
PUSH 	DX

MOV 	SI,0		;Variavel contadora da array
;30 colunas
MOV		AX,	VidasY												;coordenada Y = 2
MOV 	CL,16		;contadora das linhas
Vidas3Apagada:
MOV 	BX,	VidasX												;coordenada X = 248
MOV 	CH,11		;contadora das colunas
Vidas2Apagada:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL, BB8Apagado[SI]
MOV 	COR, DL

CALL PrintPixel

INC		SI
POP		AX
POP		CX
DEC		CH
INC		BX

CMP 	CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ 	Vidas2Apagada		;jump para imprimir as 30 colunas e uma linha
;17 linhas
INC 	AX
DEC 	CL			;apos imprimir as 30 colunas e a primeira linha, o programa imprime +16 linhas
CMP 	CL,0
JNZ 	Vidas3Apagada	;jump para imprimir as 16 linhas restantes

POP		DX
POP		CX
POP		BX
POP		AX

RET
PrintVidasApagadas			ENDP

;==================================================================================================================================;

PRINTA_INIMIGOS			PROC

;imprimindo o inimigo 3 ---------------------------------------------------------------------------------- LINHA 1
MOV 	BX,	FixoX
MOV 	X,	BX
MOV 	AX,	FixoY
MOV 	Y,	AX
MOV 	CX,	11
MOV		SI, 0
Loop3_11:
PUSH	CX
PUSH	SI


CMP		MATRIZ_LINHA1[SI], 0
JE		PULA_PRINTA1

CALL	PrintInimigo3
JMP		DEPOIS_PULA_PRINTA1

PULA_PRINTA1:								
ADD		X, 21
DEPOIS_PULA_PRINTA1:						

POP		SI
POP		CX
INC		SI
DEC		CX
CMP		CX,	0
JNZ		Loop3_11

MOV 	AX,	FixoY		;desce 19 posicoes para printar os proximos aliens
ADD		AX,	19
MOV		FixoY,	AX

;imprimindo o inimigo 2 ---------------------------------------------------------------------------------- LINHA 2
MOV 	BX,	FixoX
MOV 	X,	BX
MOV 	AX,	FixoY
MOV 	Y,	AX
MOV 	CX,	11
MOV		SI, 0
Loop2_22:
PUSH	CX
PUSH	SI

CMP		MATRIZ_LINHA2[SI], 0
JE		PULA_PRINTA2

CALL	PrintInimigo2
JMP		DEPOIS_PULA_PRINTA2

PULA_PRINTA2:								
ADD		X, 21
DEPOIS_PULA_PRINTA2:		


POP		SI
POP		CX
INC		SI
DEC		CX
CMP		CX,	0
JNZ		Loop2_22

MOV 	AX,	FixoY		;desce 14 posicoes para printar os proximos aliens
ADD		AX,	14
MOV		FixoY,	AX

;imprimindo o inimigo 2 ---------------------------------------------------------------------------------- LINHA 3
MOV 	BX,	FixoX
MOV 	X,	BX
MOV 	AX,	FixoY
MOV 	Y,	AX
MOV 	CX,	11
MOV		SI, 0
Loop2_33:
PUSH	CX
PUSH	SI

CMP MATRIZ_LINHA3[SI], 0
JE	PULA_PRINTA3

CALL	PrintInimigo2
JMP		DEPOIS_PULA_PRINTA3

PULA_PRINTA3:								
ADD		X, 21
DEPOIS_PULA_PRINTA3:		


POP		SI
POP		CX
INC		SI
DEC		CX
CMP		CX,	0
JNZ		Loop2_33

MOV 	AX,	FixoY		;desce 14 posicoes para printar os proximos aliens
ADD		AX,	14
MOV		FixoY,	AX

;imprimindo o inimigo 1 ---------------------------------------------------------------------------------- LINHA 4
MOV 	BX,	FixoX
MOV 	X,	BX
MOV 	AX,	FixoY
MOV 	Y,	AX
MOV 	CX,	11
MOV		SI, 0
Loop1_44:
PUSH	CX
PUSH	SI

CMP MATRIZ_LINHA4[SI], 0
JE	PULA_PRINTA4

CALL	PrintInimigo1

JMP		DEPOIS_PULA_PRINTA4

PULA_PRINTA4:								
ADD		X, 21
DEPOIS_PULA_PRINTA4:

POP		SI
POP		CX
INC		SI
DEC		CX
CMP		CX,	0
JNZ		Loop1_44

MOV 	AX,	FixoY		;desce 14 posicoes para printar os proximos aliens
ADD		AX,	14
MOV		FixoY,	AX

;imprimindo o inimigo 1 ---------------------------------------------------------------------------------- LINHA 5


MOV 	BX,	FixoX
MOV 	X,	BX
MOV 	AX,	FixoY
MOV 	Y,	AX
MOV 	CX,	11
MOV		SI, 0
Loop1_55:
PUSH	CX
PUSH	SI

CMP MATRIZ_LINHA5[SI], 0
JE	PULA_PRINTA5

CALL	PrintInimigo1
JMP		DEPOIS_PULA_PRINTA5

PULA_PRINTA5:								
ADD		X, 21
DEPOIS_PULA_PRINTA5:

POP		SI
POP		CX
INC		SI
DEC		CX
CMP		CX,	0
JNZ		Loop1_55

MOV 	AX,	FixoY		;desce 14 posicoes para printar os proximos aliens
ADD		AX,	14
MOV		FixoY,	AX

RET
PRINTA_INIMIGOS			ENDP

;======================================================================================================================;

PrintMeteoro			PROC

MOV AX,145			;Meteoro inicial
MOV MeteoroY,AX

MOV MeteoroX,BX
MOV SI,0			;contadora da matriz
;30 colunas
MOV CL,18			;contadora das linhas
Meteoro3_0:
MOV BX,MeteoroX	
MOV CH,18			;contadora das colunas
Meteoro2_0:
PUSH	CX
PUSH	AX

;cor do pixel atravez da array
MOV DL,Meteoro[SI]
MOV COR,DL

CALL PrintPixel

INC	SI
POP AX
POP CX
DEC CH
INC BX

CMP CH,0			;imprime todas as colunas
JNZ Meteoro2_0		;jump para imprimir as 30 colunas e uma linha
;17 linhas
INC AX
DEC CL				;apos imprimir as 30 colunas e a primeira linha, o programa imprime +16 linhas
CMP CL,0
JNZ Meteoro3_0		;jump para imprimir as 16 linhas restantes

;add 67 na coordenada x para o proximo meteoro
MOV BX,MeteoroX
ADD BX,67
MOV MeteoroX,BX

RET
PrintMeteoro			ENDP

;======================================================================================================================;

PrintMeteoro1			PROC

MOV AX,145			;Meteoro inicial
MOV MeteoroY,AX

MOV MeteoroX,BX
MOV SI,0			;contadora da matriz
;30 colunas
MOV CL,18			;contadora das linhas
Meteoro3_1:
MOV BX,MeteoroX	
MOV CH,18			;contadora das colunas
Meteoro2_1:
PUSH	CX
PUSH	AX

;cor do pixel atravez da array
MOV DL,Meteoro1[SI]
MOV COR,DL

CALL PrintPixel

INC	SI
POP AX
POP CX
DEC CH
INC BX

CMP CH,0			;imprime todas as colunas
JNZ Meteoro2_1		;jump para imprimir as 30 colunas e uma linha
;17 linhas
INC AX
DEC CL				;apos imprimir as 30 colunas e a primeira linha, o programa imprime +16 linhas
CMP CL,0
JNZ Meteoro3_1		;jump para imprimir as 16 linhas restantes

;add 67 na coordenada x para o proximo meteoro
MOV BX,MeteoroX
ADD BX,67
MOV MeteoroX,BX

RET
PrintMeteoro1			ENDP

;======================================================================================================================;

PrintMeteoro2			PROC

MOV AX,145			;Meteoro inicial
MOV MeteoroY,AX

MOV MeteoroX,BX
MOV SI,0			;contadora da matriz
;30 colunas
MOV CL,18			;contadora das linhas
Meteoro3_2:
MOV BX,MeteoroX	
MOV CH,18			;contadora das colunas
Meteoro2_2:
PUSH	CX
PUSH	AX

;cor do pixel atravez da array
MOV DL,Meteoro2[SI]
MOV COR,DL

CALL PrintPixel

INC	SI
POP AX
POP CX
DEC CH
INC BX

CMP CH,0			;imprime todas as colunas
JNZ Meteoro2_2		;jump para imprimir as 30 colunas e uma linha
;17 linhas
INC AX
DEC CL				;apos imprimir as 30 colunas e a primeira linha, o programa imprime +16 linhas
CMP CL,0
JNZ Meteoro3_2		;jump para imprimir as 16 linhas restantes

;add 67 na coordenada x para o proximo meteoro
MOV BX,MeteoroX
ADD BX,67
MOV MeteoroX,BX

RET
PrintMeteoro2			ENDP

;======================================================================================================================;

PrintMeteoro3			PROC

MOV AX,145			;Meteoro inicial
MOV MeteoroY,AX

MOV MeteoroX,BX
MOV SI,0			;contadora da matriz
;30 colunas
MOV CL,18			;contadora das linhas
Meteoro3_3:
MOV BX,MeteoroX	
MOV CH,18			;contadora das colunas
Meteoro2_3:
PUSH	CX
PUSH	AX

;cor do pixel atravez da array
MOV DL,Meteoro3[SI]
MOV COR,DL

CALL PrintPixel

INC	SI
POP AX
POP CX
DEC CH
INC BX

CMP CH,0			;imprime todas as colunas
JNZ Meteoro2_3		;jump para imprimir as 30 colunas e uma linha
;17 linhas
INC AX
DEC CL				;apos imprimir as 30 colunas e a primeira linha, o programa imprime +16 linhas
CMP CL,0
JNZ Meteoro3_3		;jump para imprimir as 16 linhas restantes

;add 67 na coordenada x para o proximo meteoro
MOV BX,MeteoroX
ADD BX,67
MOV MeteoroX,BX

RET
PrintMeteoro3			ENDP

;======================================================================================================================;

PrintMeteoro4			PROC

MOV AX,145			;Meteoro inicial
MOV MeteoroY,AX

MOV MeteoroX,BX
MOV SI,0			;contadora da matriz
;30 colunas
MOV CL,18			;contadora das linhas
Meteoro3_4:
MOV BX,MeteoroX	
MOV CH,18			;contadora das colunas
Meteoro2_4:
PUSH	CX
PUSH	AX

;cor do pixel atravez da array
MOV DL,Meteoro4[SI]
MOV COR,DL

CALL PrintPixel

INC	SI
POP AX
POP CX
DEC CH
INC BX

CMP CH,0			;imprime todas as colunas
JNZ Meteoro2_4		;jump para imprimir as 30 colunas e uma linha
;17 linhas
INC AX
DEC CL				;apos imprimir as 30 colunas e a primeira linha, o programa imprime +16 linhas
CMP CL,0
JNZ Meteoro3_4		;jump para imprimir as 16 linhas restantes

;add 67 na coordenada x para o proximo meteoro
MOV BX,MeteoroX
ADD BX,67
MOV MeteoroX,BX

RET
PrintMeteoro4			ENDP

;======================================================================================================================;

PrintMeteoroApagado			PROC

MOV AX,145			;Meteoro inicial
MOV MeteoroY,AX

MOV MeteoroX,BX
MOV SI,0			;contadora da matriz
;30 colunas
MOV CL,18			;contadora das linhas
Meteoro3_apagado:
MOV BX,MeteoroX	
MOV CH,18			;contadora das colunas
Meteoro2_apagado:
PUSH	CX
PUSH	AX

;cor do pixel atravez da array
MOV DL,0
MOV COR,DL

CALL PrintPixel

INC	SI
POP AX
POP CX
DEC CH
INC BX

CMP CH,0					;imprime todas as colunas
JNZ Meteoro2_apagado		;jump para imprimir as 30 colunas e uma linha
;17 linhas
INC AX
DEC CL						;apos imprimir as 30 colunas e a primeira linha, o programa imprime +16 linhas
CMP CL,0
JNZ Meteoro3_apagado		;jump para imprimir as 16 linhas restantes

;add 67 na coordenada x para o proximo meteoro
MOV BX,MeteoroX
ADD BX,67
MOV MeteoroX,BX

RET
PrintMeteoroApagado			ENDP

;======================================================================================================================;

ControleMeteoros		PROC

PUSH	AX
PUSH	BX
PUSH	CX
PUSH	DX
PUSH	SI

CALL	AlienMovMeteoro

MOV BX,	52				;coordenada do meteoro
MOV CX,	4
MOV	SI,	0

ComparacoesMeteoros:
CMP	CX,	4
JE	ContinuaComparacoesMeteoros
CMP	CX,	0
JL	EndMeteoro

IncSiMeteoros:
INC	SI

ContinuaComparacoesMeteoros:
CMP	MeteorosVida[SI],	5
JE	Meteoro0_5
CMP	MeteorosVida[SI],	4
JE	Meteoro0_4
CMP	MeteorosVida[SI],	3
JE	Meteoro0_3
CMP	MeteorosVida[SI],	2
JE	Meteoro0_2
CMP	MeteorosVida[SI],	1
JE	Meteoro0_1
CMP	MeteorosVida[SI],	0
JE	Meteoro0_0

DEC	CX
ADD BX,67
CMP	MeteorosVida[SI],	0
JL	ComparacoesMeteoros
EndMeteoro:
JMP	FimMeteoro

Meteoro0_5:
PUSH CX
PUSH SI
CALL PrintMeteoro		;imprimi 1 meteoro
POP	SI
POP CX
DEC CX					;decrementa pra imprimir o proximo meteoro
CMP CX,0
JGE ComparacoesMeteoros
JMP	FimMeteoro

Meteoro0_4:
PUSH CX
PUSH SI
CALL PrintMeteoro1		;imprimi 1 meteoro
POP	SI
POP CX
DEC CX					;decrementa pra imprimir o proximo meteoro
CMP CX,0
JGE ComparacoesMeteoros
JMP	FimMeteoro

Meteoro0_3:
PUSH CX
PUSH SI
CALL PrintMeteoro2		;imprimi 1 meteoro
POP	SI
POP CX
DEC CX					;decrementa pra imprimir o proximo meteoro
CMP CX,0
JGE ComparacoesMeteoros
JMP	FimMeteoro

Meteoro0_2:
PUSH CX
PUSH SI
CALL PrintMeteoro3		;imprimi 1 meteoro
POP	SI
POP CX
DEC CX					;decrementa pra imprimir o proximo meteoro
CMP CX,0
JGE ComparacoesMeteoros1
JMP	FimMeteoro

ComparacoesMeteoros1:
JMP	ComparacoesMeteoros

Meteoro0_1:
PUSH CX
PUSH SI
CALL PrintMeteoro4		;imprimi 1 meteoro
POP	SI
POP CX
DEC CX					;decrementa pra imprimir o proximo meteoro
CMP CX,0
JGE ComparacoesMeteoros1
JMP	FimMeteoro

Meteoro0_0:
PUSH CX
PUSH SI
CALL PrintMeteoroApagado		;imprimi 1 meteoro
POP	SI
POP CX
DEC CX							;decrementa pra imprimir o proximo meteoro
MOV	MeteorosVida[SI],	-1
CMP CX,0
JGE ComparacoesMeteoros1
JMP	FimMeteoro

FimMeteoro:
POP		SI
POP		DX
POP		CX
POP		BX
POP		AX
RET
ControleMeteoros		ENDP

;======================================================================================================================;

Deteriora				PROC

PUSH	AX
PUSH	BX
PUSH	CX
PUSH	DX
PUSH	SI

ComparaXmeteoro1CL:
MOV		CL,	18
MOV		AX,	52
MOV		SI,	0
ComparaXmeteoro1:
CMP		TiroJogadorX,	AX
JE		ComparaYmeteoro1CL
INC		AX
CMP		CL,	0
JE		ComparaXmeteoro2CL
DEC		CL
JMP		ComparaXmeteoro1

ComparaYmeteoro1CL:
MOV		CL,	18
MOV		AX,	145
ComparaYmeteoro1:
CMP		TiroJogadorY,	AX
JE		Deteriora0
INC		AX
CMP		CL,	0
JE		ComparaXmeteoro2CL
DEC		CL
JMP		ComparaYmeteoro1

Deteriora0:
JMP		Deteriora1

ComparaXmeteoro2CL:
MOV		CL,	18
MOV		AX,	119
MOV		SI,	1
ComparaXmeteoro2:
CMP		TiroJogadorX,	AX
JE		ComparaYmeteoro3CL
INC		AX
CMP		CL,	0
JE		ComparaXmeteoro3CL
DEC		CL
JMP		ComparaXmeteoro2

ComparaYmeteoro2CL:
MOV		CL,	18
MOV		AX,	145
ComparaYmeteoro2:
CMP		TiroJogadorY,	AX
JE		Deteriora1
INC		AX
CMP		CL,	0
JE		ComparaXmeteoro3CL
DEC		CL
JMP		ComparaYmeteoro2

ComparaXmeteoro3CL:
MOV		CL,	18
MOV		AX,	186
MOV		SI,	2
ComparaXmeteoro3:
CMP		TiroJogadorX,	AX
JE		ComparaYmeteoro3CL
INC		AX
CMP		CL,	0
JE		ComparaXmeteoro4CL
DEC		CL
JMP		ComparaXmeteoro3

ComparaYmeteoro3CL:
MOV		CL,	18
MOV		AX,	145
ComparaYmeteoro3:
CMP		TiroJogadorY,	AX
JE		Deteriora1
INC		AX
CMP		CL,	0
JE		ComparaXmeteoro4CL
DEC		CL
JMP		ComparaYmeteoro3

ComparaXmeteoro4CL:
MOV		CL,	18
MOV		AX,	253
MOV		SI,	3
ComparaXmeteoro4:
CMP		TiroJogadorX,	AX
JE		ComparaYmeteoro4CL
INC		AX
CMP		CL,	0
JE		FimDeteriora
DEC		CL
JMP		ComparaXmeteoro4

ComparaYmeteoro4CL:
MOV		CL,	18
MOV		AX,	145
ComparaYmeteoro4:
CMP		TiroJogadorY,	AX
JE		Deteriora1
INC		AX
CMP		CL,	0
JE		FimDeteriora
DEC		CL
JMP		ComparaYmeteoro4

Deteriora1:
DEC		MeteorosVida[SI]
CMP		MeteorosVida[SI],	0
JL		MantemDeteriora1
MOV		Atirando,	0				;set para parar de atirar
JMP		FimDeteriora

MantemDeteriora1:
MOV		MeteorosVida[SI],	-1
JMP		FimDeteriora

FimDeteriora:
POP		SI
POP		DX
POP		CX
POP		BX
POP		AX

RET
Deteriora				ENDP

;======================================================================================================================;

DeterioraAlien				PROC

PUSH	AX
PUSH	BX
PUSH	CX
PUSH	DX
PUSH	SI

ComparaXmeteoro1AlienCL:
MOV		CL,	18
MOV		AX,	52
MOV		SI,	0
ComparaXmeteoro1Alien:
CMP		AlienTiroX,	AX
JE		ComparaYmeteoro1AlienCL
INC		AX
CMP		CL,	0
JE		ComparaXmeteoro2AlienCL
DEC		CL
JMP		ComparaXmeteoro1Alien

ComparaYmeteoro1AlienCL:
MOV		CL,	18
MOV		AX,	145
ComparaYmeteoro1Alien:
CMP		AlienTiroY,	AX
JE		Deteriora0Alien
INC		AX
CMP		CL,	0
JE		ComparaXmeteoro2AlienCL
DEC		CL
JMP		ComparaYmeteoro1Alien

Deteriora0Alien:
JMP		Deteriora1Alien

ComparaXmeteoro2AlienCL:
MOV		CL,	18
MOV		AX,	119
MOV		SI,	1
ComparaXmeteoro2Alien:
CMP		AlienTiroX,	AX
JE		ComparaYmeteoro3AlienCL
INC		AX
CMP		CL,	0
JE		ComparaXmeteoro3AlienCL
DEC		CL
JMP		ComparaXmeteoro2Alien

ComparaYmeteoro2AlienCL:
MOV		CL,	18
MOV		AX,	145
ComparaYmeteoro2Alien:
CMP		AlienTiroY,	AX
JE		Deteriora1Alien
INC		AX
CMP		CL,	0
JE		ComparaXmeteoro3AlienCL
DEC		CL
JMP		ComparaYmeteoro2Alien

ComparaXmeteoro3AlienCL:
MOV		CL,	18
MOV		AX,	186
MOV		SI,	2
ComparaXmeteoro3Alien:
CMP		AlienTiroX,	AX
JE		ComparaYmeteoro3AlienCL
INC		AX
CMP		CL,	0
JE		ComparaXmeteoro4AlienCL
DEC		CL
JMP		ComparaXmeteoro3Alien

ComparaYmeteoro3AlienCL:
MOV		CL,	18
MOV		AX,	145
ComparaYmeteoro3Alien:
CMP		AlienTiroY,	AX
JE		Deteriora1Alien
INC		AX
CMP		CL,	0
JE		ComparaXmeteoro4AlienCL
DEC		CL
JMP		ComparaYmeteoro3Alien

ComparaXmeteoro4AlienCL:
MOV		CL,	18
MOV		AX,	253
MOV		SI,	3
ComparaXmeteoro4Alien:
CMP		AlienTiroX,	AX
JE		ComparaYmeteoro4AlienCL
INC		AX
CMP		CL,	0
JE		FimDeterioraAlien
DEC		CL
JMP		ComparaXmeteoro4Alien

ComparaYmeteoro4AlienCL:
MOV		CL,	18
MOV		AX,	145
ComparaYmeteoro4alien:
CMP		AlienTiroY,	AX
JE		Deteriora1Alien
INC		AX
CMP		CL,	0
JE		FimDeterioraAlien
DEC		CL
JMP		ComparaYmeteoro4Alien

Deteriora1Alien:
DEC		MeteorosVida[SI]
CMP		MeteorosVida[SI],	0
JL		MantemDeteriora1Alien
MOV		TiroAtivadoAliens,	0
MOV		UltimoTiroAlien,	1
CALL	ShotApagadoAliens
JMP		FimDeterioraAlien

MantemDeteriora1Alien:
MOV		MeteorosVida[SI],	-1
JMP		FimDeterioraAlien

FimDeterioraAlien:

POP		SI
POP		DX
POP		CX
POP		BX
POP		AX

RET
DeterioraAlien				ENDP

;===========================================================================================================;

PrintJogador			PROC

PUSH 	AX
PUSH 	BX
PUSH 	CX
PUSH 	DX

MOV		AX, AtualY
MOV		BX, AtualX

CMP		TiroAtivado,	1
JE		SemTiro

MOV		TiroJogadorX,	BX
MOV		TiroJogadorY,	AX
ADD		TiroJogadorX,	4
SUB		TiroJogadorY,	3

SemTiro:

MOV		Y, 	AX
MOV		X,	BX

MOV 	SI,0		;Variavel contadora da array
;30 colunas
MOV		AX,	Y
MOV 	CL,14		;contadora das linhas
Jogador3:
MOV 	BX,X	
MOV 	CH,10		;contadora das colunas
Jogador2:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL, Jogador[SI]
MOV 	COR, DL

CALL PrintPixel

INC		SI
POP		AX
POP		CX
DEC		CH
INC		BX

CMP 	CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ 	Jogador2		;jump para imprimir as 30 colunas e uma linha
;17 linhas
INC 	AX
DEC 	CL			;apos imprimir as 30 colunas e a primeira linha, o programa imprime +16 linhas
CMP 	CL,0
JNZ 	Jogador3	;jump para imprimir as 16 linhas restantes

POP		DX
POP		CX
POP		BX
POP		AX

RET

PrintJogador			ENDP

;===========================================================================================================;

ApagaJogador			PROC

PUSH 	AX
PUSH 	BX
PUSH 	CX
PUSH 	DX

MOV		AX, AtualY
MOV		BX, AtualX
MOV		Y, 	AX
MOV		X,	BX

MOV 	SI,0		;Variavel contadora da array
;30 colunas
MOV		AX,	Y
MOV 	CL,14		;contadora das linhas
ApagaJogador3:
MOV 	BX,X	
MOV 	CH,10		;contadora das colunas
ApagaJogador2:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL, 0
MOV 	COR, DL

CALL PrintPixel

INC		SI
POP		AX
POP		CX
DEC		CH
INC		BX

CMP 	CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ 	ApagaJogador2		;jump para imprimir as 30 colunas e uma linha
;17 linhas
INC 	AX
DEC 	CL			;apos imprimir as 30 colunas e a primeira linha, o programa imprime +16 linhas
CMP 	CL,0
JNZ 	ApagaJogador3	;jump para imprimir as 16 linhas restantes

POP		DX
POP		CX
POP		BX
POP		AX

RET

ApagaJogador			ENDP

;===========================================================================================================;

saidadecimal	PROC				;copia do projeto 1 do Matheus Pupo

   CMP BX, 0                      ; COMPARA BX COM 0
   JGE INICIODEC                  ; PULA PARA INICIODEC BX>=0
   MOV AH, 2                      ; IMPRIME NUMERO
   MOV DL, "-"                    ; ATRIBUI DL='-'
   INT 21H                        ; IMPRIME O CARACTERE

   NEG BX                         ; PEGA O COMPLEMENTO DE DOIS DE BX CASO O NUMERO FOR NEGATIVO

   INICIODEC:                        

   MOV AX, BX                     ; PASSA VALOR DE BX PARA AX
   XOR CX, CX                     ; ZERA CX
   MOV BX, 10                     ; PASSA 10d PARA BX (DIVISAO SUCESSIVA)

   REPETICAO:                     ; LOOP DA DIVISAO POR 10 PARA MOSTRAR UM CARACTER POR VEZ
     XOR DX, DX                   ; ZERA DX
     DIV BX                       ; DIVIDE AX POR BX
     PUSH DX                      ; COLOCA DX NA PILHA
     INC CX                       ; INCREMENTA CX
     OR AX, AX                    ; TESTA SE O QUOCIENTE E ZERO
   JNE REPETICAO                  ; CONTINUA JUMP ENQUANTO AINDA FOR POSSIVEL DIVIDIR
   MOV AH, 2                      ; FUNCAO PRA IMPRIMIR MUMERO

   MOSTRADEC:                     ; LOOP MOSTRADEC
     POP DX                       ; TIRA NUMERO DA PILHA
     OR DL, 30H                   ; CONVERTE BINARIO P/ DECIMAL
     INT 21H                      ; PRINTA NUMERO NA ORDEM CERTA
   LOOP MOSTRADEC                 ; CONTINUA JUMP SE AINDA HOUVER NUMEROS A SEREM IMPRESSOS

   RET  

saidadecimal	ENDP

;===========================================================================================================;

MOV_ALIENS		PROC

CMP Direcao, 0
JE mov_direita
	
mov_esquerda:
SUB NovoFixoX, 1
JMP	Compara_x

mov_direita:
ADD NovoFixoX, 1	

Compara_x:	
	
CMP	NovoFixoX, 96					;SE DER 90 MEXE EM Y
JE	SOMA_Y
CMP NovoFixoX, 0
JE	SOMA_Y

JMP CONTINUACAO_LOOP

SOMA_Y:
ADD NovoFixoY, 3				;quantidade que desce em y
CMP Direcao, 0
JE	ta_mov_esquerda

ta_mov_direita:
DEC Direcao
JMP CONTINUACAO_LOOP

ta_mov_esquerda:
INC Direcao

;JMP	RESETA_Y

CONTINUACAO_LOOP:
MOV AX, NovoFixoY
MOV FixoY, AX
MOV FixoYLimpa, AX

RET


MOV_ALIENS		ENDP
;====================================================================================
Acerta_alien				PROC

PUSH	AX
PUSH	BX
PUSH	CX
PUSH	DX
PUSH	SI
;LINHA 1
ComparaXAlien11CL:
MOV		CL,	15
MOV		AX,	FixoX
MOV		AcertouX, AX
MOV		SI,	0
ComparaXalien11:
CMP		TiroJogadorX,	AX
JE		ComparaYalien11CL
INC		AX
CMP		CL,	0
JE		ComparaXalien12CL
DEC		CL
JMP		ComparaXalien11

ComparaYalien11CL:
MOV		CL,	18
MOV		AX,	FixoY
MOV		AcertouY, AX
ComparaYalien11:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien11
INC		AX
CMP		CL,	0
JE		ComparaXalien12CL
DEC		CL
JMP		ComparaYalien11

MatemDeteriora1_alien11:
JMP MatemDeteriora1_alien1_	

ComparaXalien12CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 21
MOV		AcertouX, AX
MOV		SI,	1
ComparaXalien12:
CMP		TiroJogadorX,	AX
JE		ComparaYalien13CL
INC		AX
CMP		CL,	0
JE		ComparaXalien13CL
DEC		CL
JMP		ComparaXalien12

ComparaYalien12CL:
MOV		CL,	18
MOV		AX,	FixoY
MOV		AcertouY, AX
ComparaYalien12:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien12
INC		AX
CMP		CL,	0
JE		ComparaXalien13CL
DEC		CL
JMP		ComparaYalien12

MatemDeteriora1_alien12:
JMP MatemDeteriora1_alien1_	

ComparaXalien13CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 42
MOV		AcertouX, AX
MOV		SI,	2
ComparaXalien13:
CMP		TiroJogadorX,	AX
JE		ComparaYalien13CL
INC		AX
CMP		CL,	0
JE		ComparaXalien14CL
DEC		CL
JMP		ComparaXalien13

ComparaYalien13CL:
MOV		CL,	18
MOV		AX,	FixoY
MOV		AcertouY, AX
ComparaYalien13:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien13
INC		AX
CMP		CL,	0
JE		ComparaXalien14CL
DEC		CL
JMP		ComparaYalien13

MatemDeteriora1_alien13:
JMP MatemDeteriora1_alien1_	

ComparaXalien14CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 63
MOV		AcertouX, AX
MOV		SI,	3
ComparaXalien14:
CMP		TiroJogadorX,	AX
JE		ComparaYalien14CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien15CL
DEC		CL
JMP		ComparaXalien14

ComparaYalien14CL:
MOV		CL,	18
MOV		AX,	FixoY
MOV		AcertouY, AX
ComparaYalien14:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien14
INC		AX
CMP		CL,	0
JE		ComparaXAlien15CL
DEC		CL
JMP		ComparaYalien14								

MatemDeteriora1_alien14:
JMP MatemDeteriora1_alien1_	

ComparaXAlien15CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 84
MOV		AcertouX, AX
MOV		SI,	4
ComparaXalien15:
CMP		TiroJogadorX,	AX
JE		ComparaYalien15CL
INC		AX
CMP		CL,	0
JE		ComparaXalien16CL
DEC		CL
JMP		ComparaXalien15									

ComparaYalien15CL:
MOV		CL,	18
MOV		AX,	FixoY
MOV		AcertouY, AX
ComparaYalien15:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien15
INC		AX
CMP		CL,	0
JE		ComparaXalien16CL
DEC		CL
JMP		ComparaYalien15						

MatemDeteriora1_alien15:
JMP MatemDeteriora1_alien1_	

ComparaXalien16CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 105
MOV		AcertouX, AX
MOV		SI,	5
ComparaXalien16:
CMP		TiroJogadorX,	AX
JE		ComparaYalien16CL
INC		AX
CMP		CL,	0
JE		ComparaXalien17CL
DEC		CL
JMP		ComparaXalien16

ComparaYalien16CL:
MOV		CL,	18
MOV		AX,	FixoY
MOV		AcertouY, AX
ComparaYalien16:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien16
INC		AX
CMP		CL,	0
JE		ComparaXalien17CL
DEC		CL
JMP		ComparaYalien16						

MatemDeteriora1_alien16:
JMP MatemDeteriora1_alien1_	

ComparaXalien17CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 126
MOV		AcertouX, AX
MOV		SI,	6
ComparaXalien17:
CMP		TiroJogadorX,	AX
JE		ComparaYalien17CL
INC		AX
CMP		CL,	0
JE		ComparaXalien18CL
DEC		CL
JMP		ComparaXalien17

ComparaYalien17CL:
MOV		CL,	18
MOV		AX,	FixoY
MOV		AcertouY, AX
ComparaYalien17:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien17
INC		AX
CMP		CL,	0
JE		ComparaXalien18CL
DEC		CL
JMP		ComparaYalien17				

MatemDeteriora1_alien17:
JMP MatemDeteriora1_alien1_	

ComparaXalien18CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 147
MOV		AcertouX, AX
MOV		SI,	7
ComparaXalien18:
CMP		TiroJogadorX,	AX
JE		ComparaYalien18CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien19CL
DEC		CL
JMP		ComparaXalien18

ComparaYalien18CL:
MOV		CL,	18
MOV		AX,	FixoY
MOV		AcertouY, AX
ComparaYalien18:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien18
INC		AX
CMP		CL,	0
JE		ComparaXAlien19CL
DEC		CL
JMP		ComparaYalien18

MatemDeteriora1_alien18:
JMP MatemDeteriora1_alien1_	

ComparaXAlien19CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 168
MOV		AcertouX, AX
MOV		SI,	8
ComparaXalien19:
CMP		TiroJogadorX,	AX
JE		ComparaYalien19CL
INC		AX
CMP		CL,	0
JE		ComparaXalien110CL
DEC		CL
JMP		ComparaXalien19

ComparaYalien19CL:
MOV		CL,	18
MOV		AX,	FixoY
MOV		AcertouY, AX
ComparaYalien19:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien19
INC		AX
CMP		CL,	0
JE		ComparaXalien110CL
DEC		CL
JMP		ComparaYalien19				

MatemDeteriora1_alien19:
JMP MatemDeteriora1_alien1_	

ComparaXalien110CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 189
MOV		AcertouX, AX
MOV		SI,	9
ComparaXalien110:
CMP		TiroJogadorX,	AX
JE		ComparaYalien110CL
INC		AX
CMP		CL,	0
JE		ComparaXalien111CL
DEC		CL
JMP		ComparaXalien110

ComparaYalien110CL:
MOV		CL,	18
MOV		AX,	FixoY
MOV		AcertouY, AX
ComparaYalien110:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien110
INC		AX
CMP		CL,	0
JE		ComparaXalien111CL
DEC		CL
JMP		ComparaYalien110

MatemDeteriora1_alien110:
JMP MatemDeteriora1_alien1_	

ComparaXalien111CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 210
MOV		AcertouX, AX
MOV		SI,	10
ComparaXalien111:
CMP		TiroJogadorX,	AX
JE		ComparaYalien111CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien21CL					;ACABOU A FILEIRA
DEC		CL
JMP		ComparaXalien111

ComparaYalien111CL:
MOV		CL,	18
MOV		AX,	FixoY
MOV		AcertouY, AX
ComparaYalien111:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien111
INC		AX
CMP		CL,	0
JE		ComparaXAlien21CL						;ACABOU A FILEIRA
DEC		CL
JMP		ComparaYalien111

MatemDeteriora1_alien111:
JMP MatemDeteriora1_alien1_	

MatemDeteriora1_alien1_:
CALL	MatemDeteriora1_alien1
;-- CERTIN

;======= LINHA 2
ComparaXAlien21CL:
MOV		CL,	15
MOV		AX,	FixoX
MOV		AcertouX, AX
MOV		SI,	0
ComparaXalien21:
CMP		TiroJogadorX,	AX
JE		ComparaYalien21CL
INC		AX
CMP		CL,	0
JE		ComparaXalien22CL
DEC		CL
JMP		ComparaXalien21

ComparaYalien21CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 19
MOV		AcertouY, AX
ComparaYalien21:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien21
INC		AX
CMP		CL,	0
JE		ComparaXalien22CL
DEC		CL
JMP		ComparaYalien21

MatemDeteriora1_alien21:
JMP MatemDeteriora1_alien2_	

ComparaXalien22CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 21
MOV		AcertouX, AX
MOV		SI,	1
ComparaXalien22:
CMP		TiroJogadorX,	AX
JE		ComparaYalien23CL
INC		AX
CMP		CL,	0
JE		ComparaXalien23CL
DEC		CL
JMP		ComparaXalien22

ComparaYalien22CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 19
MOV		AcertouY, AX
ComparaYalien22:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien22
INC		AX
CMP		CL,	0
JE		ComparaXalien23CL
DEC		CL
JMP		ComparaYalien22

MatemDeteriora1_alien22:
JMP MatemDeteriora1_alien2_	

ComparaXalien23CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 42
MOV		AcertouX, AX
MOV		SI,	2
ComparaXalien23:
CMP		TiroJogadorX,	AX
JE		ComparaYalien23CL
INC		AX
CMP		CL,	0
JE		ComparaXalien24CL
DEC		CL
JMP		ComparaXalien23

ComparaYalien23CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 19
MOV		AcertouY, AX
ComparaYalien23:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien23
INC		AX
CMP		CL,	0
JE		ComparaXalien24CL
DEC		CL
JMP		ComparaYalien23

MatemDeteriora1_alien23:
JMP MatemDeteriora1_alien2_	

ComparaXalien24CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 63
MOV		AcertouX, AX
MOV		SI,	3
ComparaXalien24:
CMP		TiroJogadorX,	AX
JE		ComparaYalien24CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien25CL
DEC		CL
JMP		ComparaXalien24

ComparaYalien24CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 19
MOV		AcertouY, AX
ComparaYalien24:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien24
INC		AX
CMP		CL,	0
JE		ComparaXAlien25CL
DEC		CL
JMP		ComparaYalien24								

MatemDeteriora1_alien24:
JMP MatemDeteriora1_alien2_	

ComparaXAlien25CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 84
MOV		AcertouX, AX
MOV		SI,	4
ComparaXalien25:
CMP		TiroJogadorX,	AX
JE		ComparaYalien25CL
INC		AX
CMP		CL,	0
JE		ComparaXalien26CL
DEC		CL
JMP		ComparaXalien25									

ComparaYalien25CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 19
MOV		AcertouY, AX
ComparaYalien25:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien25
INC		AX
CMP		CL,	0
JE		ComparaXalien26CL
DEC		CL
JMP		ComparaYalien25						

MatemDeteriora1_alien25:
JMP MatemDeteriora1_alien2_	

ComparaXalien26CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 105
MOV		AcertouX, AX
MOV		SI,	5
ComparaXalien26:
CMP		TiroJogadorX,	AX
JE		ComparaYalien26CL
INC		AX
CMP		CL,	0
JE		ComparaXalien27CL
DEC		CL
JMP		ComparaXalien26

ComparaYalien26CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 19
MOV		AcertouY, AX
ComparaYalien26:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien26
INC		AX
CMP		CL,	0
JE		ComparaXalien27CL
DEC		CL
JMP		ComparaYalien26						

MatemDeteriora1_alien26:
JMP MatemDeteriora1_alien2_	

ComparaXalien27CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 126
MOV		AcertouX, AX
MOV		SI,	6
ComparaXalien27:
CMP		TiroJogadorX,	AX
JE		ComparaYalien27CL
INC		AX
CMP		CL,	0
JE		ComparaXalien28CL
DEC		CL
JMP		ComparaXalien27

ComparaYalien27CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 19
MOV		AcertouY, AX
ComparaYalien27:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien27
INC		AX
CMP		CL,	0
JE		ComparaXalien28CL
DEC		CL
JMP		ComparaYalien27				

MatemDeteriora1_alien27:
JMP MatemDeteriora1_alien2_	

ComparaXalien28CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 147
MOV		AcertouX, AX
MOV		SI,	7
ComparaXalien28:
CMP		TiroJogadorX,	AX
JE		ComparaYalien28CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien29CL
DEC		CL
JMP		ComparaXalien28

ComparaYalien28CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 19
MOV		AcertouY, AX
ComparaYalien28:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien28
INC		AX
CMP		CL,	0
JE		ComparaXAlien29CL
DEC		CL
JMP		ComparaYalien28

MatemDeteriora1_alien28:
JMP MatemDeteriora1_alien2_	

ComparaXAlien29CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 168
MOV		AcertouX, AX
MOV		SI,	8
ComparaXalien29:
CMP		TiroJogadorX,	AX
JE		ComparaYalien29CL
INC		AX
CMP		CL,	0
JE		ComparaXalien210CL
DEC		CL
JMP		ComparaXalien29

ComparaYalien29CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 19
MOV		AcertouY, AX
ComparaYalien29:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien29
INC		AX
CMP		CL,	0
JE		ComparaXalien210CL
DEC		CL
JMP		ComparaYalien29				

MatemDeteriora1_alien29:
JMP MatemDeteriora1_alien2_	

ComparaXalien210CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 189
MOV		AcertouX, AX
MOV		SI,	9
ComparaXalien210:
CMP		TiroJogadorX,	AX
JE		ComparaYalien210CL
INC		AX
CMP		CL,	0
JE		ComparaXalien211CL
DEC		CL
JMP		ComparaXalien210

ComparaYalien210CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 19
MOV		AcertouY, AX
ComparaYalien210:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien210
INC		AX
CMP		CL,	0
JE		ComparaXalien211CL
DEC		CL
JMP		ComparaYalien210

MatemDeteriora1_alien210:
JMP MatemDeteriora1_alien2_	

ComparaXalien211CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 210
MOV		AcertouX, AX
MOV		SI,	10
ComparaXalien211:
CMP		TiroJogadorX,	AX
JE		ComparaYalien211CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien31CL			
DEC		CL
JMP		ComparaXalien211

ComparaYalien211CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 19
MOV		AcertouY, AX
ComparaYalien211:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien211
INC		AX
CMP		CL,	0
JE		ComparaXAlien31CL			
DEC		CL
JMP		ComparaYalien211

MatemDeteriora1_alien211:
JMP MatemDeteriora1_alien2_	

MatemDeteriora1_alien2_:
CALL	MatemDeteriora1_alien2

;======= LINHA 3
ComparaXAlien31CL:
MOV		CL,	15
MOV		AX,	FixoX
MOV		AcertouX, AX
MOV		SI,	0
ComparaXalien31:
CMP		TiroJogadorX,	AX
JE		ComparaYalien31CL
INC		AX
CMP		CL,	0
JE		ComparaXalien32CL
DEC		CL
JMP		ComparaXalien31

ComparaYalien31CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 33
MOV		AcertouY, AX
ComparaYalien31:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien31
INC		AX
CMP		CL,	0
JE		ComparaXalien32CL
DEC		CL
JMP		ComparaYalien31

MatemDeteriora1_alien31:
JMP MatemDeteriora1_alien3_	

ComparaXalien32CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 21
MOV		AcertouX, AX
MOV		SI,	1
ComparaXalien32:
CMP		TiroJogadorX,	AX
JE		ComparaYalien33CL
INC		AX
CMP		CL,	0
JE		ComparaXalien33CL
DEC		CL
JMP		ComparaXalien32

ComparaYalien32CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 33
MOV		AcertouY, AX
ComparaYalien32:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien32
INC		AX
CMP		CL,	0
JE		ComparaXalien33CL
DEC		CL
JMP		ComparaYalien32

MatemDeteriora1_alien32:
JMP MatemDeteriora1_alien3_	

ComparaXalien33CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 42
MOV		AcertouX, AX
MOV		SI,	2
ComparaXalien33:
CMP		TiroJogadorX,	AX
JE		ComparaYalien33CL
INC		AX
CMP		CL,	0
JE		ComparaXalien34CL
DEC		CL
JMP		ComparaXalien33

ComparaYalien33CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 33
MOV		AcertouY, AX
ComparaYalien33:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien33
INC		AX
CMP		CL,	0
JE		ComparaXalien34CL
DEC		CL
JMP		ComparaYalien33

MatemDeteriora1_alien33:
JMP MatemDeteriora1_alien3_	

ComparaXalien34CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 63
MOV		AcertouX, AX
MOV		SI,	3
ComparaXalien34:
CMP		TiroJogadorX,	AX
JE		ComparaYalien34CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien35CL
DEC		CL
JMP		ComparaXalien34

ComparaYalien34CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 33
MOV		AcertouY, AX
ComparaYalien34:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien34
INC		AX
CMP		CL,	0
JE		ComparaXAlien35CL
DEC		CL
JMP		ComparaYalien34								

MatemDeteriora1_alien34:
JMP MatemDeteriora1_alien3_	

ComparaXAlien35CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 84
MOV		AcertouX, AX
MOV		SI,	4
ComparaXalien35:
CMP		TiroJogadorX,	AX
JE		ComparaYalien35CL
INC		AX
CMP		CL,	0
JE		ComparaXalien36CL
DEC		CL
JMP		ComparaXalien35									

ComparaYalien35CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 33
MOV		AcertouY, AX
ComparaYalien35:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien35
INC		AX
CMP		CL,	0
JE		ComparaXalien36CL
DEC		CL
JMP		ComparaYalien35						

MatemDeteriora1_alien35:
JMP MatemDeteriora1_alien3_	

ComparaXalien36CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 105
MOV		AcertouX, AX
MOV		SI,	5
ComparaXalien36:
CMP		TiroJogadorX,	AX
JE		ComparaYalien36CL
INC		AX
CMP		CL,	0
JE		ComparaXalien37CL
DEC		CL
JMP		ComparaXalien36

ComparaYalien36CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 33
MOV		AcertouY, AX
ComparaYalien36:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien36
INC		AX
CMP		CL,	0
JE		ComparaXalien37CL
DEC		CL
JMP		ComparaYalien36						

MatemDeteriora1_alien36:
JMP MatemDeteriora1_alien3_	

ComparaXalien37CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 126
MOV		AcertouX, AX
MOV		SI,	6
ComparaXalien37:
CMP		TiroJogadorX,	AX
JE		ComparaYalien37CL
INC		AX
CMP		CL,	0
JE		ComparaXalien38CL
DEC		CL
JMP		ComparaXalien37

ComparaYalien37CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 33
MOV		AcertouY, AX
ComparaYalien37:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien37
INC		AX
CMP		CL,	0
JE		ComparaXalien38CL
DEC		CL
JMP		ComparaYalien37				

MatemDeteriora1_alien37:
JMP MatemDeteriora1_alien3_	

ComparaXalien38CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 147
MOV		AcertouX, AX
MOV		SI,	7
ComparaXalien38:
CMP		TiroJogadorX,	AX
JE		ComparaYalien38CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien39CL
DEC		CL
JMP		ComparaXalien38

ComparaYalien38CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 33
MOV		AcertouY, AX
ComparaYalien38:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien38
INC		AX
CMP		CL,	0
JE		ComparaXAlien39CL
DEC		CL
JMP		ComparaYalien38

MatemDeteriora1_alien38:
JMP MatemDeteriora1_alien3_	

ComparaXAlien39CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 168
MOV		AcertouX, AX
MOV		SI,	8
ComparaXalien39:
CMP		TiroJogadorX,	AX
JE		ComparaYalien39CL
INC		AX
CMP		CL,	0
JE		ComparaXalien310CL
DEC		CL
JMP		ComparaXalien39

ComparaYalien39CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 33
MOV		AcertouY, AX
ComparaYalien39:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien39
INC		AX
CMP		CL,	0
JE		ComparaXalien310CL
DEC		CL
JMP		ComparaYalien39				

MatemDeteriora1_alien39:
JMP MatemDeteriora1_alien3_	

ComparaXalien310CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 189
MOV		AcertouX, AX
MOV		SI,	9
ComparaXalien310:
CMP		TiroJogadorX,	AX
JE		ComparaYalien310CL
INC		AX
CMP		CL,	0
JE		ComparaXalien311CL
DEC		CL
JMP		ComparaXalien310

ComparaYalien310CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 33
MOV		AcertouY, AX
ComparaYalien310:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien310
INC		AX
CMP		CL,	0
JE		ComparaXalien311CL
DEC		CL
JMP		ComparaYalien310

MatemDeteriora1_alien310:
JMP MatemDeteriora1_alien3_	

ComparaXalien311CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 210
MOV		AcertouX, AX
MOV		SI,	10
ComparaXalien311:
CMP		TiroJogadorX,	AX
JE		ComparaYalien311CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien41CL			
DEC		CL
JMP		ComparaXalien311

ComparaYalien311CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 33
MOV		AcertouY, AX
ComparaYalien311:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien311
INC		AX
CMP		CL,	0
JE		ComparaXAlien41CL			
DEC		CL
JMP		ComparaYalien311

MatemDeteriora1_alien311:
JMP MatemDeteriora1_alien3_	

MatemDeteriora1_alien3_:
CALL	MatemDeteriora1_alien3

;======= LINHA 4
ComparaXAlien41CL:
MOV		CL,	15
MOV		AX,	FixoX
MOV		AcertouX, AX
MOV		SI,	0
ComparaXalien41:
CMP		TiroJogadorX,	AX
JE		ComparaYalien41CL
INC		AX
CMP		CL,	0
JE		ComparaXalien42CL
DEC		CL
JMP		ComparaXalien41

ComparaYalien41CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 47
MOV		AcertouY, AX
ComparaYalien41:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien41
INC		AX
CMP		CL,	0
JE		ComparaXalien42CL
DEC		CL
JMP		ComparaYalien41

MatemDeteriora1_alien41:
JMP MatemDeteriora1_alien4_	

ComparaXalien42CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 21
MOV		AcertouX, AX
MOV		SI,	1
ComparaXalien42:
CMP		TiroJogadorX,	AX
JE		ComparaYalien43CL
INC		AX
CMP		CL,	0
JE		ComparaXalien43CL
DEC		CL
JMP		ComparaXalien42

ComparaYalien42CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 47
MOV		AcertouY, AX
ComparaYalien42:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien42
INC		AX
CMP		CL,	0
JE		ComparaXalien43CL
DEC		CL
JMP		ComparaYalien42

MatemDeteriora1_alien42:
JMP MatemDeteriora1_alien4_	

ComparaXalien43CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 42
MOV		AcertouX, AX
MOV		SI,	2
ComparaXalien43:
CMP		TiroJogadorX,	AX
JE		ComparaYalien43CL
INC		AX
CMP		CL,	0
JE		ComparaXalien44CL
DEC		CL
JMP		ComparaXalien43

ComparaYalien43CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 47
MOV		AcertouY, AX
ComparaYalien43:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien43
INC		AX
CMP		CL,	0
JE		ComparaXalien44CL
DEC		CL
JMP		ComparaYalien43

MatemDeteriora1_alien43:
JMP MatemDeteriora1_alien4_	

ComparaXalien44CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 63
MOV		AcertouX, AX
MOV		SI,	3
ComparaXalien44:
CMP		TiroJogadorX,	AX
JE		ComparaYalien44CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien45CL
DEC		CL
JMP		ComparaXalien44

ComparaYalien44CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 47
MOV		AcertouY, AX
ComparaYalien44:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien44
INC		AX
CMP		CL,	0
JE		ComparaXAlien45CL
DEC		CL
JMP		ComparaYalien44								

MatemDeteriora1_alien44:
JMP MatemDeteriora1_alien4_	

ComparaXAlien45CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 84
MOV		AcertouX, AX
MOV		SI,	4
ComparaXalien45:
CMP		TiroJogadorX,	AX
JE		ComparaYalien45CL
INC		AX
CMP		CL,	0
JE		ComparaXalien46CL
DEC		CL
JMP		ComparaXalien45									

ComparaYalien45CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 47
MOV		AcertouY, AX
ComparaYalien45:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien45
INC		AX
CMP		CL,	0
JE		ComparaXalien46CL
DEC		CL
JMP		ComparaYalien45						

MatemDeteriora1_alien45:
JMP MatemDeteriora1_alien4_	

ComparaXalien46CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 105
MOV		AcertouX, AX
MOV		SI,	5
ComparaXalien46:
CMP		TiroJogadorX,	AX
JE		ComparaYalien46CL
INC		AX
CMP		CL,	0
JE		ComparaXalien47CL
DEC		CL
JMP		ComparaXalien46

ComparaYalien46CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 47
MOV		AcertouY, AX
ComparaYalien46:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien46
INC		AX
CMP		CL,	0
JE		ComparaXalien47CL
DEC		CL
JMP		ComparaYalien46						

MatemDeteriora1_alien46:
JMP MatemDeteriora1_alien4_	

ComparaXalien47CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 126
MOV		AcertouX, AX
MOV		SI,	6
ComparaXalien47:
CMP		TiroJogadorX,	AX
JE		ComparaYalien47CL
INC		AX
CMP		CL,	0
JE		ComparaXalien48CL
DEC		CL
JMP		ComparaXalien47

ComparaYalien47CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 47
MOV		AcertouY, AX
ComparaYalien47:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien47
INC		AX
CMP		CL,	0
JE		ComparaXalien48CL
DEC		CL
JMP		ComparaYalien47				

MatemDeteriora1_alien47:
JMP MatemDeteriora1_alien4_	

ComparaXalien48CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 147
MOV		AcertouX, AX
MOV		SI,	7
ComparaXalien48:
CMP		TiroJogadorX,	AX
JE		ComparaYalien48CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien49CL
DEC		CL
JMP		ComparaXalien48

ComparaYalien48CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 47
MOV		AcertouY, AX
ComparaYalien48:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien48
INC		AX
CMP		CL,	0
JE		ComparaXAlien49CL
DEC		CL
JMP		ComparaYalien48

MatemDeteriora1_alien48:
JMP MatemDeteriora1_alien4_	

ComparaXAlien49CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 168
MOV		AcertouX, AX
MOV		SI,	8
ComparaXalien49:
CMP		TiroJogadorX,	AX
JE		ComparaYalien49CL
INC		AX
CMP		CL,	0
JE		ComparaXalien410CL
DEC		CL
JMP		ComparaXalien49

ComparaYalien49CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 47
MOV		AcertouY, AX
ComparaYalien49:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien49
INC		AX
CMP		CL,	0
JE		ComparaXalien410CL
DEC		CL
JMP		ComparaYalien49				

MatemDeteriora1_alien49:
JMP MatemDeteriora1_alien4_	

ComparaXalien410CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 189
MOV		AcertouX, AX
MOV		SI,	9
ComparaXalien410:
CMP		TiroJogadorX,	AX
JE		ComparaYalien410CL
INC		AX
CMP		CL,	0
JE		ComparaXalien411CL
DEC		CL
JMP		ComparaXalien410

ComparaYalien410CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 47
MOV		AcertouY, AX
ComparaYalien410:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien410
INC		AX
CMP		CL,	0
JE		ComparaXalien411CL
DEC		CL
JMP		ComparaYalien410

MatemDeteriora1_alien410:
JMP MatemDeteriora1_alien4_	

ComparaXalien411CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 210
MOV		AcertouX, AX
MOV		SI,	10
ComparaXalien411:
CMP		TiroJogadorX,	AX
JE		ComparaYalien411CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien51CL			
DEC		CL
JMP		ComparaXalien411

ComparaYalien411CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 47
MOV		AcertouY, AX
ComparaYalien411:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien411
INC		AX
CMP		CL,	0
JE		ComparaXAlien51CL			
DEC		CL
JMP		ComparaYalien411

MatemDeteriora1_alien411:
JMP MatemDeteriora1_alien4_	

MatemDeteriora1_alien4_:
CALL	MatemDeteriora1_alien4

;======= LINHA 5
ComparaXAlien51CL:
MOV		CL,	15
MOV		AX,	FixoX
MOV		AcertouX, AX
MOV		SI,	0
ComparaXalien51:
CMP		TiroJogadorX,	AX
JE		ComparaYalien51CL
INC		AX
CMP		CL,	0
JE		ComparaXalien52CL
DEC		CL
JMP		ComparaXalien51

ComparaYalien51CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 61
MOV		AcertouY, AX
ComparaYalien51:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien51
INC		AX
CMP		CL,	0
JE		ComparaXalien52CL
DEC		CL
JMP		ComparaYalien51

MatemDeteriora1_alien51:
JMP MatemDeteriora1_alien5_	

ComparaXalien52CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 21
MOV		AcertouX, AX
MOV		SI,	1
ComparaXalien52:
CMP		TiroJogadorX,	AX
JE		ComparaYalien53CL
INC		AX
CMP		CL,	0
JE		ComparaXalien53CL
DEC		CL
JMP		ComparaXalien52

ComparaYalien52CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 61
MOV		AcertouY, AX
ComparaYalien52:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien52
INC		AX
CMP		CL,	0
JE		ComparaXalien53CL
DEC		CL
JMP		ComparaYalien52

MatemDeteriora1_alien52:
JMP MatemDeteriora1_alien5_	

ComparaXalien53CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 42
MOV		AcertouX, AX
MOV		SI,	2
ComparaXalien53:
CMP		TiroJogadorX,	AX
JE		ComparaYalien53CL
INC		AX
CMP		CL,	0
JE		ComparaXalien54CL
DEC		CL
JMP		ComparaXalien53

ComparaYalien53CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 61
MOV		AcertouY, AX
ComparaYalien53:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien53
INC		AX
CMP		CL,	0
JE		ComparaXalien54CL
DEC		CL
JMP		ComparaYalien53

MatemDeteriora1_alien53:
JMP MatemDeteriora1_alien5_	

ComparaXalien54CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 63
MOV		AcertouX, AX
MOV		SI,	3
ComparaXalien54:
CMP		TiroJogadorX,	AX
JE		ComparaYalien54CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien55CL
DEC		CL
JMP		ComparaXalien54

ComparaYalien54CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 61
MOV		AcertouY, AX
ComparaYalien54:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien54
INC		AX
CMP		CL,	0
JE		ComparaXAlien55CL
DEC		CL
JMP		ComparaYalien54								

MatemDeteriora1_alien54:
JMP MatemDeteriora1_alien5_	

ComparaXAlien55CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 84
MOV		AcertouX, AX
MOV		SI,	4
ComparaXalien55:
CMP		TiroJogadorX,	AX
JE		ComparaYalien55CL
INC		AX
CMP		CL,	0
JE		ComparaXalien56CL
DEC		CL
JMP		ComparaXalien55									

ComparaYalien55CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 61
MOV		AcertouY, AX
ComparaYalien55:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien55
INC		AX
CMP		CL,	0
JE		ComparaXalien56CL
DEC		CL
JMP		ComparaYalien55						

MatemDeteriora1_alien55:
JMP MatemDeteriora1_alien5_	

ComparaXalien56CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 105
MOV		AcertouX, AX
MOV		SI,	5
ComparaXalien56:
CMP		TiroJogadorX,	AX
JE		ComparaYalien56CL
INC		AX
CMP		CL,	0
JE		ComparaXalien57CL
DEC		CL
JMP		ComparaXalien56

ComparaYalien56CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 61
MOV		AcertouY, AX
ComparaYalien56:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien56
INC		AX
CMP		CL,	0
JE		ComparaXalien57CL
DEC		CL
JMP		ComparaYalien56						

MatemDeteriora1_alien56:
JMP MatemDeteriora1_alien5_	

ComparaXalien57CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 126
MOV		AcertouX, AX
MOV		SI,	6
ComparaXalien57:
CMP		TiroJogadorX,	AX
JE		ComparaYalien57CL
INC		AX
CMP		CL,	0
JE		ComparaXalien58CL
DEC		CL
JMP		ComparaXalien57

ComparaYalien57CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 61
MOV		AcertouY, AX
ComparaYalien57:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien57
INC		AX
CMP		CL,	0
JE		ComparaXalien58CL
DEC		CL
JMP		ComparaYalien57				

MatemDeteriora1_alien57:
JMP MatemDeteriora1_alien5_	

ComparaXalien58CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 147
MOV		AcertouX, AX
MOV		SI,	7
ComparaXalien58:
CMP		TiroJogadorX,	AX
JE		ComparaYalien58CL
INC		AX
CMP		CL,	0
JE		ComparaXAlien59CL
DEC		CL
JMP		ComparaXalien58

ComparaYalien58CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 61
MOV		AcertouY, AX
ComparaYalien58:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien58
INC		AX
CMP		CL,	0
JE		ComparaXAlien59CL
DEC		CL
JMP		ComparaYalien58

MatemDeteriora1_alien58:
JMP MatemDeteriora1_alien5_	

ComparaXAlien59CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 168 
MOV		AcertouX, AX				
MOV		SI,	8
ComparaXalien59:
CMP		TiroJogadorX,	AX
JE		ComparaYalien59CL
INC		AX
CMP		CL,	0
JE		ComparaXalien510CL
DEC		CL
JMP		ComparaXalien59

ComparaYalien59CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 61
MOV		AcertouY, AX
ComparaYalien59:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien59
INC		AX
CMP		CL,	0
JE		ComparaXalien510CL
DEC		CL
JMP		ComparaYalien59				

MatemDeteriora1_alien59:
JMP MatemDeteriora1_alien5_	

ComparaXalien510CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 189
MOV		AcertouX, AX
MOV		SI,	9
ComparaXalien510:
CMP		TiroJogadorX,	AX
JE		ComparaYalien510CL
INC		AX
CMP		CL,	0
JE		ComparaXalien511CL
DEC		CL
JMP		ComparaXalien510

ComparaYalien510CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 61
MOV		AcertouY, AX
ComparaYalien510:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien510
INC		AX
CMP		CL,	0
JE		ComparaXalien511CL
DEC		CL
JMP		ComparaYalien510

MatemDeteriora1_alien510:
JMP MatemDeteriora1_alien5_	

ComparaXalien511CL:
MOV		CL,	15
MOV		AX,	FixoX
ADD		AX, 210
MOV		AcertouX, AX
MOV		SI,	10
ComparaXalien511:
CMP		TiroJogadorX,	AX
JE		ComparaYalien511CL
INC		AX
CMP		CL,	0
JE		FIM_DA_LINHA5			
DEC		CL
JMP		ComparaXalien511

ComparaYalien511CL:
MOV		CL,	12
MOV		AX,	FixoY
ADD		AX, 61
MOV		AcertouY, AX
ComparaYalien511:
CMP		TiroJogadorY,	AX
JE		MatemDeteriora1_alien511
INC		AX
CMP		CL,	0
JE		FIM_DA_LINHA5			
DEC		CL
JMP		ComparaYalien511

MatemDeteriora1_alien511:
JMP MatemDeteriora1_alien5_	

MatemDeteriora1_alien5_:
CALL	MatemDeteriora1_alien5





FIM_DA_LINHA5:

POP		SI
POP		DX
POP		CX
POP		BX
POP		AX

RET
Acerta_alien				ENDP

;============

MatemDeteriora1_alien1		PROC
CMP		MATRIZ_LINHA1[SI], 	0
JE		FIM_LINHA1
MOV		MATRIZ_LINHA1[SI],	0
ADD		Pontuacao, 226
CALL	APAGA_INIMIGO3
MOV		Atirando,	0
FIM_LINHA1:
RET
MatemDeteriora1_alien1		ENDP
;---------------
MatemDeteriora1_alien2		PROC
CMP		MATRIZ_LINHA2[SI], 	0
JE		FIM_LINHA2
MOV		MATRIZ_LINHA2[SI],	0			
ADD		Pontuacao, 202
CALL	APAGA_INIMIGO2					
MOV		Atirando,	0
FIM_LINHA2:
RET
MatemDeteriora1_alien2		ENDP
;---------------
MatemDeteriora1_alien3		PROC
CMP		MATRIZ_LINHA3[SI], 	0
JE		FIM_LINHA3
MOV		MATRIZ_LINHA3[SI],	0
ADD		Pontuacao, 202
CALL	APAGA_INIMIGO2
MOV		Atirando,	0
FIM_LINHA3:
RET
MatemDeteriora1_alien3		ENDP
;---------------
MatemDeteriora1_alien4		PROC
CMP		MATRIZ_LINHA4[SI], 	0
JE		FIM_LINHA4
MOV		MATRIZ_LINHA4[SI],	0
ADD		Pontuacao, 152
CALL	APAGA_INIMIGO1
MOV		Atirando,	0
FIM_LINHA4:
RET
MatemDeteriora1_alien4		ENDP
;---------------
MatemDeteriora1_alien5		PROC
CMP		MATRIZ_LINHA5[SI], 	0
JE		FIM_LINHA5
MOV		MATRIZ_LINHA5[SI],	0
ADD		Pontuacao, 152
CALL	APAGA_INIMIGO1
MOV		Atirando,	0
FIM_LINHA5:
RET
MatemDeteriora1_alien5		ENDP
;==========================================================


APAGA_INIMIGO3		PROC


MOV		AX, AcertouY
MOV		BX,	AcertouX
MOV		X,	BX

MOV		SI,	0		;Variavel contadora da matriz
;13 colunas
MOV 	CL,	18		;contadora das linhas
Print_33:
MOV 	BX,	X
MOV		CH,	15		;contadora das colunas
Print33:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL,	0
MOV		Cor,	DL

CALL PrintPixel

INC SI
POP AX
POP CX
DEC CH
INC BX

CMP CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ Print33		;jump para imprimir as 8 colunas e uma linha
;9 linhas
INC AX
DEC CL			;apos imprimir as 12 colunas e a primeira linha, o programa imprime +8 linhas
CMP CL,0
JNZ Print_33		;jump para imprimir as 7 linhas restantes

;deslocando a coodenada X 18 posicoes p/ direita - 12 referentes ao pixel do alien3 e 6 referentes ao deslocamento horizontal
MOV BX,X
ADD BX,19
MOV X,BX

;deslocando a coodenada Y para a origem
MOV AX,Y
MOV Y,AX

RET

APAGA_INIMIGO3		ENDP

;===============================================================================================================================;

APAGA_INIMIGO2		PROC


MOV		AX, AcertouY
MOV		BX,	AcertouX
MOV		X,	BX

MOV		SI,	0		;Variavel contadora da matriz
;13 colunas
MOV 	CL,	12		;contadora das linhas
Print_22:
MOV 	BX,	X
MOV		CH,	15		;contadora das colunas
Print22:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL,	0
MOV		Cor,	DL

CALL PrintPixel

INC SI
POP AX
POP CX
DEC CH
INC BX

CMP CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ Print22		;jump para imprimir as 8 colunas e uma linha
;9 linhas
INC AX
DEC CL			;apos imprimir as 12 colunas e a primeira linha, o programa imprime +8 linhas
CMP CL,0
JNZ Print_22	;jump para imprimir as 7 linhas restantes

;deslocando a coodenada X 18 posicoes p/ direita - 12 referentes ao pixel do alien3 e 6 referentes ao deslocamento horizontal
MOV BX,X
ADD BX,19
MOV X,BX

;deslocando a coodenada Y para a origem
MOV AX,Y
MOV Y,AX

RET

APAGA_INIMIGO2		ENDP

;===============================================================================================================================;

APAGA_INIMIGO1		PROC


MOV		AX, AcertouY
MOV		BX,	AcertouX
MOV		X,	BX

MOV		SI,	0		;Variavel contadora da matriz
;13 colunas
MOV 	CL,	12		;contadora das linhas
Print_11:
MOV 	BX,	X
MOV		CH,	15		;contadora das colunas
Print11:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL,	0
MOV		Cor,	DL

CALL PrintPixel

INC SI
POP AX
POP CX
DEC CH
INC BX

CMP CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ Print11		;jump para imprimir as 8 colunas e uma linha
;9 linhas
INC AX
DEC CL			;apos imprimir as 12 colunas e a primeira linha, o programa imprime +8 linhas
CMP CL,0
JNZ Print_11	;jump para imprimir as 7 linhas restantes

;deslocando a coodenada X 18 posicoes p/ direita - 12 referentes ao pixel do alien3 e 6 referentes ao deslocamento horizontal
MOV BX,X
ADD BX,19
MOV X,BX

;deslocando a coodenada Y para a origem
MOV AX,Y
MOV Y,AX

RET

APAGA_INIMIGO1		ENDP
;==========================================================================================================================

VERIFICA_FIM			PROC
PUSH	AX
PUSH	BX
PUSH	CX
PUSH	DX
PUSH	SI

MOV		AX, 5
MOV		SI, 0
LOOP_LINHA5:
CMP		MATRIZ_LINHA5[SI], 1
JE		FIM_VERIFICA_FIM
INC		SI
CMP		SI, 11
JL		LOOP_LINHA5	

MOV		AX, 4
MOV		SI, 0
LOOP_LINHA4:
CMP		MATRIZ_LINHA4[SI], 1
JE		FIM_VERIFICA_FIM
INC		SI
CMP		SI, 11
JL		LOOP_LINHA4

MOV		AX, 3
MOV		SI, 0
LOOP_LINHA3:
CMP		MATRIZ_LINHA3[SI], 1
JE		FIM_VERIFICA_FIM
INC		SI
CMP		SI, 11
JL		LOOP_LINHA3

MOV		AX, 2
MOV		SI, 0
LOOP_LINHA2:
CMP		MATRIZ_LINHA2[SI], 1
JE		FIM_VERIFICA_FIM
INC		SI
CMP		SI, 11
JL		LOOP_LINHA2

MOV		AX, 1
MOV		SI, 0
LOOP_LINHA1:
CMP		MATRIZ_LINHA1[SI], 1
JE		FIM_VERIFICA_FIM
INC		SI
CMP		SI, 11
JL		LOOP_LINHA1

MOV		AX, 0

FIM_VERIFICA_FIM:
MOV		ULTIMA_LINHA, AX
POP	SI
POP	DX
POP	CX
POP	BX
POP	AX
RET
VERIFICA_FIM			ENDP
;===========================================================================

ENCERRA_JOGO			PROC
PUSH	AX
PUSH	BX
PUSH	CX
PUSH	DX
PUSH	SI

MOV		AX, 181				;pq a moça do pupo quer que seja 1 pixel acima da nave
MOV		BX, FixoY

CMP		ULTIMA_LINHA, 5
JE		ALIENS_NA_5
CMP		ULTIMA_LINHA, 4
JE		ALIENS_NA_4
CMP		ULTIMA_LINHA, 3
JE		ALIENS_NA_3
CMP		ULTIMA_LINHA, 2
JE		ALIENS_NA_2
CMP		ULTIMA_LINHA, 1
JE		ALIENS_NA_1

ALIENS_NA_5:
ADD		BX, 75					;RELATIVO AO ULTIMO PIXEL DO ALIEN
CMP		BX, AX
JGE		ACERTOU_NAVE
JMP		NAO_ACERTOU_NAVE
ALIENS_NA_4:
ADD		BX, 61					;RELATIVO AO ULTIMO PIXEL DO ALIEN
CMP		BX, AX
JGE		ACERTOU_NAVE
JMP		NAO_ACERTOU_NAVE
ALIENS_NA_3:
ADD		BX, 47					;RELATIVO AO ULTIMO PIXEL DO ALIEN
CMP		BX, AX
JGE		ACERTOU_NAVE
JMP		NAO_ACERTOU_NAVE
ALIENS_NA_2:
ADD		BX, 33					;RELATIVO AO ULTIMO PIXEL DO ALIEN
CMP		BX, AX
JGE		ACERTOU_NAVE
JMP		NAO_ACERTOU_NAVE
ALIENS_NA_1:
ADD		BX, 19					;RELATIVO AO ULTIMO PIXEL DO ALIEN
CMP		BX, AX
JGE		ACERTOU_NAVE
JMP		NAO_ACERTOU_NAVE



ACERTOU_NAVE:
MOV		ACABOU_JOGO, 1

NAO_ACERTOU_NAVE:
POP		SI
POP		DX
POP		CX
POP		BX
POP		AX

RET
ENCERRA_JOGO			ENDP
;=======================================================
MENU_VITORIA				PROC
PUSH AX
PUSH BX
PUSH CX
PUSH DX
PUSH SI

CMP		VidasJogador,	4
JNZ		SemPontuacaoMaxima
INC		Pontuacao

SemPontuacaoMaxima:
MOV		NLINHA, 50d		;Limpa a tela
CALL	VLINHA

MOV AH,2H			;MOVE O CURSOR PRO TOPO PARA IMPRIMIR AS STRINGS LA EM CIMA
XOR DX,DX
XOR BH,BH
INT 10H

CALL	LINHA			;IMPRIME 1 LINHA

LEA		DX, MENU_VITORIA1
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 4d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_VITORIA2
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		BX, Pontuacao
CALL saidadecimal

MOV		NLINHA, 14d		;PULA 5 LINHAS
CALL	VLINHA

LEA		DX, MENU_VITORIA3
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 3d		;PULA 5 LINHAS
CALL	VLINHA

LEA		DX, MENU_VITORIA4
MOV		AH, 9h
INT		21h

RECEBE_DE_NOVO:
MOV 	AH, 0Ch
MOV     AL,7h
INT		21h
					;COMANDO PARA RECEBER UM CARACTERE SEM IMPRIMIR ELE NA TELA E LIMPAR BUFFER

CMP		AL, 20h			;COMPARA SE É BARRA DE ESPAÇO
JE		JOGAR_NOVAMENTE		;SE FOR COMEÇA O JOGO

CMP		AL, 1Bh			;COMPARA SE É ESC
JE		DECIDIU_SAIR		;SE FOR FECHA O JOGO

MOV		NLINHA, 50d		;Limpa a tela
CALL	VLINHA

MOV AH,2H			;MOVE O CURSOR PRO TOPO PARA IMPRIMIR AS STRINGS LA EM CIMA
XOR DX,DX
XOR BH,BH
INT 10H

CALL	LINHA			;IMPRIME 1 LINHA

LEA		DX, MENU_VITORIA1
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 4d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_VITORIA2
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		BX, Pontuacao
CALL saidadecimal

MOV		NLINHA, 6d		;PULA 5 LINHAS
CALL	VLINHA

LEA		DX, MENU_ERRADO
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 8d		;PULA 5 LINHAS
CALL	VLINHA

LEA		DX, MENU_VITORIA3
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 3d		;PULA 5 LINHAS
CALL	VLINHA

LEA		DX, MENU_VITORIA4
MOV		AH, 9h
INT		21h

JMP		RECEBE_DE_NOVO

DECIDIU_SAIR:
MOV		NLINHA, 28d		;Limpa a tela
CALL	VLINHA

JMP	FIM_DO_JOGO

JOGAR_NOVAMENTE:


MOV		NLINHA, 28d		;Limpa a tela
CALL	VLINHA
PUSH SI
PUSH DX
PUSH CX
PUSH BX
PUSH AX
JMP COMECA_DE_NOVO


RET

MENU_VITORIA				ENDP
;================================================================================
MENU_HELP				PROC
PUSH AX
PUSH BX
PUSH CX
PUSH DX
PUSH SI

MOV AH,2H			;MOVE O CURSOR PRO TOPO PARA IMPRIMIR AS STRINGS LA EM CIMA
XOR DX,DX
XOR BH,BH
INT 10H

CALL	LINHA			;IMPRIME 1 LINHA

LEA		DX, MENU_AJUDA1
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 2d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_AJUDA2
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 2d
CALL	VLINHA

LEA		DX, MENU_AJUDA8
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 3d		;PULA 5 LINHAS
CALL	VLINHA

LEA		DX, MENU_AJUDA3
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 4d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_AJUDA4
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 2d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_AJUDA5
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 7d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_AJUDA6
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 2d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_AJUDA7
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h


RECEBE_DE_NOVO_HELP:

MOV 	AH, 0Ch
MOV     AL,7h
INT		21h

CMP		AL, 20h			;COMPARA SE É BARRA DE ESPAÇO
JE		COMECA_O_JOGO_HELP		;SE FOR COMEÇA O JOGO
JMP		PROSSEGUE1
COMECA_O_JOGO_HELP:
JMP	COMECA_O_JOGO_HELP_1
PROSSEGUE1:
CMP		AL, 1Bh			;COMPARA SE É ESC
JE		DECIDIU_SAIR_HELP		;SE FOR FECHA O JOGO
JMP		PROSSEGUE2
DECIDIU_SAIR_HELP:
JMP	DECIDIU_SAIR_HELP_1
PROSSEGUE2:
MOV		NLINHA, 50d		;Limpa a tela
CALL	VLINHA

MOV AH,2H			;MOVE O CURSOR PRO TOPO PARA IMPRIMIR AS STRINGS LA EM CIMA
XOR DX,DX
XOR BH,BH
INT 10H

CALL	LINHA			;IMPRIME 1 LINHA

LEA		DX, MENU_AJUDA1
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 2d
CALL	VLINHA			;PULA 2 LINHAS

LEA		DX, MENU_AJUDA2
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 2d
CALL	VLINHA			;PULA 2 LINHAS

LEA		DX, MENU_AJUDA8
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 3d		;PULA 6 LINHAS
CALL	VLINHA

LEA		DX, MENU_AJUDA3
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 4d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_AJUDA4
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 2d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_AJUDA5
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 3d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_ERRADO
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 4d
CALL	VLINHA

LEA		DX, MENU_AJUDA6
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 2d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_AJUDA7
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

JMP		RECEBE_DE_NOVO_HELP



DECIDIU_SAIR_HELP_1:
MOV		NLINHA, 28d		;Limpa a tela
CALL	VLINHA

JMP	FIM_DO_JOGO

COMECA_O_JOGO_HELP_1:
MOV SI, 0

LOOP_RESET_MATRIZ:
MOV MATRIZ_LINHA1[SI], 1			;TD PRA ZERAR
MOV MATRIZ_LINHA2[SI], 1
MOV MATRIZ_LINHA3[SI], 1
MOV MATRIZ_LINHA4[SI], 1
MOV MATRIZ_LINHA5[SI], 1
INC	SI
CMP	SI, 11
JNE	LOOP_RESET_MATRIZ

MOV 	MeteorosVida[0],5
MOV 	MeteorosVida[1],5
MOV 	MeteorosVida[2],5
MOV 	MeteorosVida[3],5

MOV		TiroAtivado,	0
MOV 	VidasJogador, 4
MOV 	Pontuacao, 0
MOV		TiroAtivadoAliens, 0
MOV		ACABOU_JOGO, 0
MOV		NLINHA, 28d		;Limpa a tela
CALL	VLINHA

PUSH SI
PUSH DX
PUSH CX
PUSH BX
PUSH AX
JMP COMECA_PRIMEIRA_VEZ
RET

MENU_HELP			ENDP
;======================================================

MENU_DERROTA				PROC
PUSH AX
PUSH BX
PUSH CX
PUSH DX
PUSH SI

MOV		NLINHA, 50d		;Limpa a tela
CALL	VLINHA


MOV AH,2H			;MOVE O CURSOR PRO TOPO PARA IMPRIMIR AS STRINGS LA EM CIMA
XOR DX,DX
XOR BH,BH
INT 10H

CALL	LINHA			;IMPRIME 1 LINHA

LEA		DX, MENU_DERROTA1
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 3d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_DERROTA2
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		BX, Pontuacao
CALL saidadecimal

MOV		NLINHA, 9d		;PULA 5 LINHAS
CALL	VLINHA

LEA		DX, MENU_DERROTA3
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 6d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_DERROTA4
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

RECEBE_DE_NOVO_DERROTA:
MOV 	AH, 0Ch
MOV     AL,7h
INT		21h

CMP		AL, 20h			;COMPARA SE É BARRA DE ESPAÇO
JE		COMECA_O_JOGO_DERROTA		;SE FOR COMEÇA O JOGO

CMP		AL, 1Bh			;COMPARA SE É ESC
JE		DECIDIU_SAIR_DERROTA		;SE FOR FECHA O JOGO

MOV		NLINHA, 50d		;Limpa a tela
CALL	VLINHA

MOV AH,2H			;MOVE O CURSOR PRO TOPO PARA IMPRIMIR AS STRINGS LA EM CIMA
XOR DX,DX
XOR BH,BH
INT 10H

CALL	LINHA			;IMPRIME 1 LINHA

LEA		DX, MENU_DERROTA1
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 3d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_DERROTA2
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		BX, Pontuacao
CALL saidadecimal

MOV		NLINHA, 4d		;PULA 5 LINHAS
CALL	VLINHA

LEA		DX, MENU_ERRADO
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 5d		;PULA 5 LINHAS
CALL	VLINHA

LEA		DX, MENU_DERROTA3
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

MOV		NLINHA, 6d
CALL	VLINHA			;PULA 6 LINHAS

LEA		DX, MENU_DERROTA4
MOV		AH, 9h			;IMPRIME A VARIAVEL DO MENU
INT		21h

JMP		RECEBE_DE_NOVO_DERROTA



DECIDIU_SAIR_DERROTA:

MOV 	AH, 0Ch

JMP	FIM_DO_JOGO

COMECA_O_JOGO_DERROTA:
MOV		NLINHA, 28d		;Limpa a tela
CALL	VLINHA
PUSH SI
PUSH DX
PUSH CX
PUSH BX
PUSH AX
JMP 	COMECA_DE_NOVO
RET

MENU_DERROTA				ENDP

;=================

TIRA_VIDA_			PROC
ComparaXJogadorCL:
MOV		CL,	10
MOV		AX,	AtualX
MOV		SI,	0
ComparaXJogador:
CMP		AlienTiroX,	AX
JE		ComparaYJogadorCL
INC		AX
CMP		CL,	0
JE		FIM_TIRA_VIDA
DEC		CL
JMP		ComparaXJogador

ComparaYJogadorCL:
MOV		CL,	14
MOV		AX,	AtualY
ADD		AX, 7
ComparaYJogador:
CMP		AlienTiroY,	AX
JE		TIRA_VIDA_JOGADOR
INC		AX
CMP		CL,	0
JE		FIM_TIRA_VIDA
DEC		CL
JMP		ComparaYJogador

JMP		FIM_TIRA_VIDA
TIRA_VIDA_JOGADOR:
CALL	TIRA_VIDA_JOGADOR_CL
FIM_TIRA_VIDA:
RET
TIRA_VIDA_		ENDP

;=============

TIRA_VIDA_JOGADOR_CL		PROC
DEC		VidasJogador

MOV  TiroAtivadoAliens, 0
MOV  UltimoTiroAlien, 1
CALL ShotApagadoAliens
CALL	PrintJogadorDano
CALL	DELAY
CALL	PrintJogador
RET
TIRA_VIDA_JOGADOR_CL	ENDP
;================================================================
DELAY				PROC
PUSH		AX
PUSH		BX
PUSH		CX
PUSH		DX
PUSH		SI
MOV AH, 0
  INT 1Ah
;CX <- High clock word
;DX <- Low clock word
;For a second you need to count ~ 18 ticks

;So code can be something like this:
  MOV DI, 18 
  MOV AH, 0
  INT 1Ah
  MOV BX, DX
Delay1:
  MOV AH, 0
  INT 1Ah
  SUB DX, BX
  CMP DI, DX
  JA Delay1
  
POP			SI
POP			DX
POP			CX
POP			BX
POP			AX
RET
DELAY				ENDP
;=================================================================

PrintJogadorDano			PROC

PUSH 	AX
PUSH 	BX
PUSH 	CX
PUSH 	DX

MOV		AX, AtualY
MOV		BX, AtualX

CMP		TiroAtivado,	1
JE		SemTiroDano

MOV		TiroJogadorX,	BX
MOV		TiroJogadorY,	AX
ADD		TiroJogadorX,	4
SUB		TiroJogadorY,	3

SemTiroDano:

MOV		Y, 	AX
MOV		X,	BX

MOV 	SI,0		;Variavel contadora da array
;30 colunas
MOV		AX,	Y
MOV 	CL,14		;contadora das linhas
Jogador3Dano:
MOV 	BX,X	
MOV 	CH,10		;contadora das colunas
Jogador2Dano:
PUSH 	CX
PUSH 	AX

;cor do pixel atravez da array
MOV 	DL, AcertouTiro[SI]
MOV 	COR, DL

CALL PrintPixel

INC		SI
POP		AX
POP		CX
DEC		CH
INC		BX

CMP 	CH,0		;decrementa as colunas, ou seja imprime primeiro as colunas
JNZ 	Jogador2Dano		;jump para imprimir as 30 colunas e uma linha
;17 linhas
INC 	AX
DEC 	CL			;apos imprimir as 30 colunas e a primeira linha, o programa imprime +16 linhas
CMP 	CL,0
JNZ 	Jogador3Dano	;jump para imprimir as 16 linhas restantes

POP		DX
POP		CX
POP		BX
POP		AX

RET

PrintJogadorDano			ENDP

;=================================================================

AlienMovMeteoro				PROC

PUSH	AX
PUSH	BX
PUSH	CX
PUSH	DX
PUSH	SI
PUSH	FixoY

MOV		SI,	0
MOV		CL,	10
CmpLinha5Meteoro:
CMP		MATRIZ_LINHA5[SI],	1
JE		VerificaAlienMovMeteoroCL5
INC		SI
DEC		CL
CMP		CL,	0
JE		CmpLinha4MeteoroCL
JMP		CmpLinha5Meteoro

CmpLinha4MeteoroCL:
MOV		SI,	0
MOV		CL,	10
CmpLinha4Meteoro:
CMP		MATRIZ_LINHA4[SI],	1
JE		VerificaAlienMovMeteoroCL4
INC		SI
DEC		CL
CMP		CL,	0
JE		CmpLinha3MeteoroCL
JMP		CmpLinha4Meteoro

CmpLinha3MeteoroCL:
MOV		SI,	0
MOV		CL,	10
CmpLinha3Meteoro:
CMP		MATRIZ_LINHA3[SI],	1
JE		VerificaAlienMovMeteoroCL3
INC		SI
DEC		CL
CMP		CL,	0
JE		CmpLinha2MeteoroCL
JMP		CmpLinha3Meteoro

CmpLinha2MeteoroCL:
MOV		SI,	0
MOV		CL,	10
CmpLinha2Meteoro:
CMP		MATRIZ_LINHA2[SI],	1
JE		VerificaAlienMovMeteoroCL2
INC		SI
DEC		CL
CMP		CL,	0
JE		CmpLinha1MeteoroCL
JMP		CmpLinha2Meteoro

CmpLinha1MeteoroCL:
MOV		SI,	0
MOV		CL,	10
CmpLinha1Meteoro:
CMP		MATRIZ_LINHA1[SI],	1
JE		VerificaAlienMovMeteoroCL1
INC		SI
DEC		CL
CMP		CL,	0
JE		NaoChegou1
JMP		CmpLinha1Meteoro

NaoChegou1:
JMP		NaoChegou

VerificaAlienMovMeteoroCL5:
MOV		CL,	4
MOV		AX,	141
VerificaAlienMovMeteoro5:
CMP		FixoY, AX
JE		FimAlienMovMeteoro
INC		AX
DEC		CL
CMP		CL,	0
JE		NaoChegou1
JMP		VerificaAlienMovMeteoro5

VerificaAlienMovMeteoroCL4:
MOV		CL,	4
MOV		AX,	141
SUB		FixoY,	14
VerificaAlienMovMeteoro4:
CMP		FixoY, AX
JE		FimAlienMovMeteoro
INC		AX
DEC		CL
CMP		CL,	0
JE		NaoChegou1
JMP		VerificaAlienMovMeteoro4

VerificaAlienMovMeteoroCL3:
MOV		CL,	4
MOV		AX,	141
SUB		FixoY,	28
VerificaAlienMovMeteoro3:
CMP		FixoY, AX
JE		FimAlienMovMeteoro
INC		AX
DEC		CL
CMP		CL,	0
JE		NaoChegou
JMP		VerificaAlienMovMeteoro3

VerificaAlienMovMeteoroCL2:
MOV		CL,	4
MOV		AX,	141
SUB		FixoY,	42
VerificaAlienMovMeteoro2:
CMP		FixoY, AX
JE		FimAlienMovMeteoro
INC		AX
DEC		CL
CMP		CL,	0
JE		NaoChegou
JMP		VerificaAlienMovMeteoro2

VerificaAlienMovMeteoroCL1:
MOV		CL,	4
MOV		AX,	141
SUB		FixoY,	56
VerificaAlienMovMeteoro1:
CMP		FixoY, AX
JE		FimAlienMovMeteoro
INC		AX
DEC		CL
CMP		CL,	0
JE		NaoChegou
JMP		VerificaAlienMovMeteoro1

FimAlienMovMeteoro:
MOV		MeteorosVida[0],	0
MOV		MeteorosVida[1],	0
MOV		MeteorosVida[2],	0
MOV		MeteorosVida[3],	0

NaoChegou:

POP		FixoY
POP		SI
POP		DX
POP		CX
POP		BX
POP		AX

RET
AlienMovMeteoro				ENDP

;=================================================================

END		MAIN
