#include "protheus.ch"
#include "rwmake.ch"
#include "topconn.ch"
#include "plsmger.CH"


#DEFINE __NTAMTRB 80
#define K_Pesquisar			1   //   Pesquisar
#define K_Visualizar			2   //   Visualizar
#define K_Importar			3   //   Incluir
#define K_Selecionar			4   //   Alterar
#define K_Excluir				5   //   Excluir
#DEFINE K_Processar			6
//#DEFINE K_Importar			7

STATIC aCabSZ3 := {}
STATIC aCamZ3  := {}


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ IMPRDA01     ³ Autor ³ RR TEAM		           ³ Data ³ 01.10.13 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³                                                                ³±±
±±³          ³                                                                ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/

User Function RRIMPRDA()

	Local aArea := GetArea()
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Declaracao de variaveis...                                          ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	PRIVATE aRotina		:= MenuDef()
	PRIVATE cCadastro 	:= Oemtoansi("Lote Importação")
	PRIVATE aCores :=	{	{	"SZ2->Z2_STATUS == '1'","BR_AMARELO"	}	,;
							{	"SZ2->Z2_STATUS == '2'","BR_VERDE"		}	,;
							{	"SZ2->Z2_STATUS == '3'","BR_VERMELHO"	}	,;
							{	"SZ2->Z2_STATUS == '4'","BR_BRANCO"	}	,;
							{	"SZ2->Z2_STATUS == '5'","BR_PRETO"		}	 }
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Chama funcao de Browse...                                           ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	
	SZ2->(DbSetOrder(1))
	SZ2->(DbGoTop())
	SZ2->(mBrowse(06,01,22,75,"SZ2",,,,,,aCores))
	
	RestArea(aArea)

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ MenuDef  ³ Autor ³ RR TEAM             ³ Data ³ 01.10.2013 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Utilizacao de menu Funcional                               ³±±
±±³          ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³Array com opcoes da rotina.                                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³Parametros do array a Rotina:                               ³±±
±±³          ³1. Nome a aparecer no cabecalho                             ³±±
±±³          ³2. Nome da Rotina associada                                 ³±±
±±³          ³3. Reservado                                                ³±±
±±³          ³4. Tipo de Transacao a ser efetuada:                        ³±±
±±³          ³       1 - Pesquisa e Posiciona em um Banco de Dados        ³±±
±±³          ³       2 - Simplesmente Mostra os Campos                    ³±±
±±³          ³       3 - Inclui registros no Bancos de Dados              ³±±
±±³          ³       4 - Altera o registro corrente                       ³±±
±±³          ³       5 - Remove o registro corrente do Banco de Dados     ³±±
±±³          ³5. Nivel de acesso                                          ³±±
±±³          ³6. Habilita Menu Funcional                                  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³   DATA   ³ Programador   ³Manutencao efetuada                         ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³          ³               ³                                            ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function MenuDef()

	LOCAL aRot1 := 	{	{ "Pesquisar"		,	'AxPesqui'		,	0,	K_Pesquisar	, 0, .F.},;
							{ "Visualizar"		,	'AxVisual'		,	0,	K_Visualizar	, 0, Nil},;
							{ "&Imp.Planilha"	,	'U_IMPRDA01'	,	0,	3				, 0, Nil},;
							{ "&Selecionar"	,	'U_IMPRDA01'	,	0,	4				, 0, Nil},;
							{ "&Excl. Carga"	,	'U_IMPRDA01'	,	0,	4				, 0, Nil},;
							{ "&Processar"		,	'U_IMPRDA01'	,	0,	4				, 0, Nil},;
							{ "Atu.Cadastro"	,	'U_IMPRDA03'	,	0,	4				, 0, Nil},;
							{ "Legenda"    	,	'U_IMPRDALE'	,	0,	0				, 0, Nil}}
	
Return(aRot1)


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³rrLeg01   ³ Autor ³ RR TEAM			        ³ Data ³21/09/2012³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Utilizacao de menu Funcional                               ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³Array com opcoes da rotina.                                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³Parametros do array a Rotina:                               ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³   DATA   ³ Programador   ³Manutencao efetuada                         ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function IMPRDALE()

	LOCAL aCdCores		:= {}
	LOCAL cCadastro	:= ""
	
	aCdCores  	:=	{	{ 'BR_AMARELO'		,OemtoAnsi('Planilha pendente')						},;
						{ 'BR_VERDE'		,OemtoAnsi('Planilha pronta para importacao')		},;
						{ 'BR_VERMELHO'	,OemtoAnsi('Carga processada com erros')			},;
						{ 'BR_BRANCO'		,OemtoAnsi('Carga processada com sucesso')		},;
						{ 'BR_PRETO'		,OemtoAnsi('Carga excluida')						} }
	
	BrwLegenda(cCadastro,"Status" ,aCdCores)
	
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³rrLeg01   ³ Autor ³ RR TEAM			        ³ Data ³21/09/2012³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Utilizacao de menu Funcional                               ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³Array com opcoes da rotina.                                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³Parametros do array a Rotina:                               ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³   DATA   ³ Programador   ³Manutencao efetuada                         ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function MenuDe2()

	LOCAL aRot :=		{	{	"Pesquisar"	,	'AxPesqui'		,	0 ,	K_Pesquisar		, 0, .F.},;	//"Pesquisar"
						{		"Visualizar"	,	'u_IMPRDA02'	,	0 ,	K_Visualizar		, 0, Nil}}//,;
						//{		"Desconsid."	,	'u_XrrDesReg'	,	0 ,	K_Alterar			, 0, Nil},;
						//{		"Alterar"		,	'u_IMPRDA02'	,	0 ,	K_Alterar			, 0, Nil},;	//"Excluir"
						//{		"Ger.Fam."		,	'u_XrrLot3'	,	0 ,	K_Alterar			, 0, Nil},;
						//{		"Desc.Pend."	,	'u_XrrLot4'	,	0 ,	K_Alterar			, 0, Nil}}

	//Aadd(aRot, { "Legenda"	, "u_XrrLEG02"	, 0	,	K_Pesquisar} )

Return(aRot)


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ IMPRDA01  ³ Autor ³ RR TEAM              ³ Data ³01/10/2013³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Rotina de Importacao de RDAs                      ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ Parametros do array a Rotina:                              ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function IMPRDA01(cAlias,nReg,nOpc)

	Local nRecSZ2 		:= SZ2->(Recno())
	Local codPerg 		:= "IMPRDA01A"
	Local lOk			:= .T.
	Local aErro		:= {}
	Local aDePara		:= {}
	Local nI			:= 1
	Local cCodPla		:= ""
	Local aTabelas		:= {'BAU','BAW','BAX','BB8','BBF'}
	
	Local fileDesc
	Local cFileName
	
	//PRIVATE nOpcx	    := nOpc
	
	PRIVATE aCores		:= {	{"SZ3->Z3_SITREG == '1'"				,"BR_AMARELO"		} ,;
								{"SZ3->Z3_SITREG == '2'"				,"BR_VERDE"		} ,;
								{"SZ3->Z3_SITREG == '3'"				,"BR_VERMELHO"	} ,;
								{"SZ3->Z3_SITREG == '5'"				,"BR_BRANCO"		} ,;
								{"SZ3->Z3_SITREG == '4'"				,"BR_PRETO"		} }
								
	//alert(nOpc)
	
	If nOpc == K_Selecionar
	
		aRotina := MenuDe2()
		cCadastro 	:= Oemtoansi("Itens Importacao")
		
		// Chama funcao de Browse...
		cFiltro    := "@Z3_FILIAL = '"+xFilial("SZ3")+"' AND Z3_LOTRDA = '"+SZ2->Z2_LOTRDA+"'"
		cFiltro    += " AND D_E_L_E_T_ = ' '"
		
		// Determina os campos que serao gravados logo os que serao exibidos no browse
		aDePara := U_IMPRDADP()
		
		If Len( aCabSZ3 ) == 0
			Store Header "SZ3" TO aCabSZ3 For (aScan(aDePara,{|x| alltrim(SX3->X3_CAMPO) $ alltrim(x[2])}) > 0)
		EndIf
		
		//SetKey( VK_F8 , { || u_rrDesReg() } )
		DbSelectArea("SZ3")
		SET FILTER TO &cFiltro
		SZ3->(DbSetOrder(1))
		SZ3->(dbGoTop())
		SZ3->(mBrowse(06,01,22,75,"SZ3",aCabSZ3,NIL,NIL,NIL,NIL,aCores))
		
		//SetKey( VK_F8 , nil )
		
		DbSelectArea("SZ3")
		SET FILTER TO
		SZ2->(DbGoTo(nRecSZ2))

	ElseIf nOpc == K_Importar
		
		If lOk
			cArqImp := cGetFile("Arquivos CSV (*.CSV) |*.csv|","Selecione o arquivo CSV para importacao",0,"",.T.,(GETF_NETWORKDRIVE,GETF_LOCALHARD),.T.)
		Endif
		
		If lOk .AND. (Empty(cArqImp) .or. Ft_FUse(cArqImp) == -1)
			lOk := .F.
			Ft_FUse()
			MsgStop("Arquivo invalido.")
		Endif
		
		If lOk .and. !ChkLayou()
			lOk := .F.
			Ft_FUse()
			MsgStop("Layout do arquivo invalido. A importacao nao podera ser feita pois as colunas do arquivo nao condizem com o Layout utilizado asdf.")
		Endif
		
		If lOk
		    fileDesc := -1
		    cFileName := ""
		    cFileName := substring(cArqImp,1,len(cArqImp)-4) + "_erros.csv"
			fileDesc := MSFCREATE( cFileName )
			if (fileDesc == -1)
				MsgAlert("Houve um problema na criação do arquivo de erros.")
				lOk := .F.
			endif
		EndIf
		
		If lOk .and.  Aviso("Importacao de Massas", "Confirma a importaçao das massas?", {"Sim","Nao"}) == 1
			
			Processa({|| lOk := ImpPlanilha(cArqImp,aErro)},"Processando","Aguarde, processando preparação dos arquivos",.F.)
			
			If !lOk .and. Len(aErro) > 0
			
				MsgStop("Importacao concluida mas foram encontradas inconsistencias.")
				
				// Desabilito variável de inclusão para que a funcao nao repita automaticamente
				Inclui := .F.
				
				// Chamo tela com erros.
				//PLSCRIGEN(aErro,{ {"Linha","@C",24} , {"RDA","@C",60 }, {"Inconsistencia","@C",250 } },"Impressão de Inconsistências.")
				GeraArqErros(fileDesc,aErro)
				
			    If (fileDesc <> -1)
			    	fClose(fileDesc)
			    EndIf
				
				MsgAlert("As inconsistências podem ser visualizadas em: " + cFileName + " .")
				
			Else
			
				// Se não houve erros, a planilha está pronta para ser carregada no sistema (status = 2).
				SZ2->(RecLock("SZ2",.F.))
					SZ2->Z2_STATUS := '2'
				SZ2->(MsUnlock())
				
				MsgStop("Importacao concluida.")
				
			Endif
			
		Else
			If lOk
				MsgStop("Processamento abortado.")
			Endif
			lOk := .F.
		Endif
		
		Ft_FUse()
	    If (fileDesc <> -1)
	    	fClose(fileDesc)
	    EndIf

	ElseIf nOpc == K_Processar
	
		If SZ2->Z2_STATUS == '5'
		
			MsgStop("Planilha já excluída.")
			Return
			
		EndIf
	
		If SZ2->Z2_STATUS == '3' .OR. SZ2->Z2_STATUS == '4'
		
			MsgStop("Planilha já processada.")
			Return
			
		EndIF
	
		lOk     := .T.
		nRecSZ2 := SZ2->(Recno())
		
		If SZ2->Z2_STATUS == '2'
		
			// Verifica se já existe planilha processada e não excluída.
			SZ2->(DbGoTop())
			While !SZ2->(EoF())
			
				If SZ2->Z2_STATUS == '3' .OR. SZ2->Z2_STATUS == '4'
				
					lOk := .F.
					Exit
					
				EndIf
				
				SZ2->(DbSkip())
				
			EndDo
			
			If !lOk
				
				MsgStop("Já existe planilha processada [Lote " + SZ2->Z2_LOTRDA + "]. Para processar uma planilha, cargas anteriores devem ser excluídas.")
				Return
			
			EndIf				
			
			SZ2->(DbGoTo(nRecSZ2))
		
			If MsgYesNo("Deseja iniciar o processamento?")
			
				Processa({|| lOk:= procPlanilha(nRecSZ2,aErro,nOpc) },"Processando","Aguarde, processando preparação dos arquivos",.F.)
				
				If !lOk .and. Len(aErro) > 0
				
					MsgStop("Importacao concluida mas foram encontradas inconsistencias.")
					
					//PLSCRIGEN(aErro,{ {"Linha","@C",24} , {"RDA","@C",60 }, {"Inconsistencia","@C",250 } },"Impressão de Inconsistências.")
					
					MsgStop("Escolha o Diretório para salvar o Arquivo com os Erros.")
					
					cDir := cGetFile("*.*","Selecione o Diretório",0,"C:\",.T.,GETF_LOCALFLOPPY + GETF_LOCALHARD + GETF_NETWORKDRIVE + GETF_RETDIRECTORY)
					
				    fileDesc := -1
				    cFileName := ""
				    cFileName := cDir + SZ2->Z2_LOTRDA + "_erros.csv"
					fileDesc := MSFCREATE( cFileName )
					if (fileDesc == -1)
						MsgAlert("Houve um problema na criação do arquivo de erros.")
						lOk := .F.
					endif
					
					GeraArqErros(fileDesc,aErro)
					
					// Marco como carga incorreta.
					SZ2->(RecLock("SZ2",.F.))
						SZ2->Z2_STATUS := '3'
					SZ2->(MsUnlock())
					
				    If (fileDesc <> -1)
				    	fClose(fileDesc)
				    EndIf
				    
				    MsgAlert("As inconsistências podem ser visualizadas em: " + cFileName + " .")
					
				Else
				
					Aviso( "Processamento", "Processamento concluido com sucesso!", { "Ok" }, 2 )
					
					// Marco como carga OK.
					SZ2->(RecLock("SZ2",.F.))
						SZ2->Z2_STATUS := '4'
					SZ2->(MsUnlock())
					
				EndIf
				
		   	Endif
		   	
		ElseIf SZ2->Z2_STATUS == '1'

			MsgStop("O Planilha ainda não está pronta para ser carregada no sistema, pois ainda há inconsistências.")
			
		Else
		
			MsgStop("Planilha já processada.")

		Endif
		
	    If (fileDesc <> -1)
	    	fClose(fileDesc)
	    EndIf

	ElseIf nOpc == K_Excluir
		
		If SZ2->Z2_STATUS == '3' .OR. SZ2->Z2_STATUS == '4'
		
			If MsgYesNo("Esta ação irá limpar todo o cadastro de RDAs. Deseja mesmo continuar?")
	
				For nI := 1 To Len(aTabelas)
				
					If TcCanOpen(RetSqlName(aTabelas[nI]))
					
						If (TCSQLExec("TRUNCATE TABLE " + RetSqlName(aTabelas[nI])) < 0)
							Return MsgStop("TCSQLError() " + TCSQLError())
						EndIf
						
					EndIf
				
				Next
				
				// Marco com carga excluida.
				SZ2->(RecLock("SZ2",.F.))
					SZ2->Z2_STATUS := '5'
				SZ2->(MsUnlock())
				
				MsgAlert("Carga excluída com sucesso!")
						
			Else
			
				MsgStop("Ação cancelada.")
				
			EndIf
			
		ElseIf SZ2->Z2_STATUS == '5'
		
			MsgStop("Carga já excluída.")
		
		Else
		
			MsgStop("Esta Planilha ainda não foi Processada, logo não existe carga para ser Excluída.")
			
		EndIf
	
	Endif

Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ CHKLAYOU  ³ Autor ³ RR TEAM              ³ Data ³21/09/2012³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Verifica a validade do layout de importacao                ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³ Validade do Layout (.T. se OK ou .F.)                      |±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ Parametros do array a Rotina:                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function ChkLayou()

	Local lRet			:= .T.
	Local xChave		:= ""
	Local aArray		:= {}
	Local cConteudo	:= ""
	Local aHeader		:= {}
	
	// Pego a primeira linha do arquivo
	If !FT_FEOF()
	
		xChave := alltrim( FT_FREADLN() )
		aArray := {}
		
		If At(';',xChave) > 0
		
			While (nPos := At(';',xChave)) > 0
				cConteudo := AllTrim(SubStr(xChave,1,nPos-1))
				xChave := AllTrim(SubStr(xChave,nPos+1,Len(xChave)))
				AaDd(aArray,cConteudo)
			EndDo
			
			If !Empty(xChave)
				AaDd(aArray,xChave)
			Elseif nPos < Len(aHeader)
				AaDd(aArray,'')
			Endif
			
		EndIf
		
		aHeader	:=	aClone(aArray)
		
	Endif
	
	// Coloco validacoes nas colunas para ver se elas nao foram suprimidas
	lRet1 := .F.
	If Len(aHeader) == 33
		lRet1 := ("CODIGO_LEGADO" $ Upper(aHeader[01]))
		lRet1 := lRet1 .AND. ("FISICA_JURIDICA"		$ Upper(aHeader[02]))
		lRet1 := lRet1 .AND. ("NOME" 					$ upper(aHeader[03]))
		lRet1 := lRet1 .AND. ("NOME_FANTASIA"			$ upper(aHeader[04]))
		lRet1 := lRet1 .AND. ("CPF_CNPJ"				$ upper(aHeader[05]))
		lRet1 := lRet1 .AND. ("DATA_INCLUSAO"			$ upper(aHeader[06]))
		lRet1 := lRet1 .AND. ("DATA_CREDENCIAMENTO"	$ upper(aHeader[07]))
		lRet1 := lRet1 .AND. ("SEXO"						$ upper(aHeader[08]))
		lRet1 := lRet1 .AND. ("CONSELHO"				$ upper(aHeader[09]))
		lRet1 := lRet1 .AND. ("UF_CONSELHO"				$ upper(aHeader[10]))
		lRet1 := lRet1 .AND. ("INSCRICAO_CONSELHO"		$ upper(aHeader[11]))
		lRet1 := lRet1 .AND. ("CLASSE_RDA"				$ upper(aHeader[12]))
		lRet1 := lRet1 .AND. ("FORMA_PAGAMENTO"		$ upper(aHeader[13]))
		lRet1 := lRet1 .AND. ("COD_TIP_LOGRAD"			$ upper(aHeader[14]))
		lRet1 := lRet1 .AND. ("LOGRADOURO"				$ upper(aHeader[15]))
		lRet1 := lRet1 .AND. ("NUMERO"					$ upper(aHeader[16]))
		lRet1 := lRet1 .AND. ("COMPLEMENTO"				$ upper(aHeader[17]))
		lRet1 := lRet1 .AND. ("CEP"						$ upper(aHeader[18]))
		lRet1 := lRet1 .AND. ("BAIRRO"					$ upper(aHeader[19]))
		lRet1 := lRet1 .AND. ("COD_MUNICIPIO"			$ upper(aHeader[20]))
		lRet1 := lRet1 .AND. ("DDD"						$ upper(aHeader[21]))
		lRet1 := lRet1 .AND. ("TELEFONE"				$ upper(aHeader[22]))
		lRet1 := lRet1 .AND. ("CONTATO"					$ upper(aHeader[23]))
		lRet1 := lRet1 .AND. ("EMAIL"					$ upper(aHeader[24]))
		lRet1 := lRet1 .AND. ("FAX"						$ upper(aHeader[25]))
		lRet1 := lRet1 .AND. ("TIPO_LOCAL"				$ upper(aHeader[26]))
		lRet1 := lRet1 .AND. ("REGIONAL"				$ upper(aHeader[27]))
		lRet1 := lRet1 .AND. ("DATA_INCLUSAO_LOCAL"	$ upper(aHeader[28]))
		lRet1 := lRet1 .AND. ("GUIA_LOCAL"				$ upper(aHeader[29]))
		lRet1 := lRet1 .AND. ("COD_ESPECIALIDADE"		$ upper(aHeader[30]))
		lRet1 := lRet1 .AND. ("DATA_INCLUSAO_ESP"		$ upper(aHeader[31]))
		lRet1 := lRet1 .AND. ("GUIA_ESPECIALIDADE"		$ upper(aHeader[32]))
		lRet1 := lRet1 .AND. ("ESP_PRINCIPAL"			$ upper(aHeader[33]))

	Endif
	
	lRet := lRet1

Return lRet


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ImpPlanilha    ³ Autor ³ RR TEAM			³ Data ³21/09/2012³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³Array com opcoes da rotina.                                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³Parametros do array a Rotina:                               ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³   DATA   ³ Programador   ³Manutencao efetuada                         ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function ImpPlanilha(cArquivo,aErro)

	Local lOk			:= .T.
	Local xChave		:= ""
	Local aArray		:= {}
	Local cConteudo	:= ""
	Local aHeader		:= {}
	Local aStruc		:= {}
	Local nI			:= 1
	Local np			:= 1
	Local aDePara		:= {}
	Local cLote		:= ""//strzero(1,TamSX3("Z3_LOTRDA")[1])
	Local cSeq			:= StrZero(1,6)//strzero(1,TamSX3("Z3_SEQLOT")[1])
	Local nAux			:= 1
	Local nQtdMax 		:= 10
	Local aRetPto		:= {.T.,{}}
	Local cMatEmp		:= ""
	Local dDatGer		:= ctod('')
	Local nPos			:= 0
	
	Private cTrb    := ""
	
	While !FT_FEOF() .and. !(nAux >= nQtdMax)   //inseri o controle para considerar o arquivo em eof se o csv esitiver com mais que 10 linhas assim: ;;;;;;;;;;;;
		
		xChave := Upper( AllTrim( FT_FREADLN() ) )
		
		If Empty(alltrim(strtran(xChave,';',''))) .Or. Empty(alltrim(strtran(xChave,',','')))
			IncProc("Desconsiderando Linha ["+alltrim(str(nAux))+"]")
			nAux++
			FT_FSKIP()
			loop
		Else
			IncProc("Lendo Linha ["+alltrim(str(nAux))+"]")
		Endif
		
		aArray := {}
		If At(';',xChave) > 0
			While (nPos := At(';',xChave)) > 0
				cConteudo    := AllTrim(SubStr(xChave,1,nPos-1))
				xChave := AllTrim(SubStr(xChave,nPos+1,Len(xChave)))
				AaDd(aArray,cConteudo)
			EndDo
			If !Empty(xChave)
				AaDd(aArray,xChave)
			Elseif nPos < Len(aHeader)
				AaDd(aArray,SPACE(__NTAMTRB))
			Endif
		EndIf
		If nAux == 1
			aStruc	:= {}
			For nI:=1 to Len(aArray)
				aadd(aStruc,{"COL"+alltrim(strzero(nI,2)),"C",__NTAMTRB,0})
			Next
			cTrb    := CriaTrab(aStruc,.T.)
			If Select("DADOS") > 0
				DADOS->(DbCloseArea())
			Endif
			DbUseArea(.T.,,cTrb,"DADOS",.T.)
		Else
			DADOS->(Reclock("DADOS",.T.))
			For nI:=1 to Len(aStruc)//tem que ser o struc aqui ao inves de aArray, pois podem ter mais colunas preenchidas do que colunas de cabecalho
				&("DADOS->COL"+alltrim(strzero(nI,2))) := aArray[nI]
			Next
			DADOS->(MsUnlock())
		EndIf
		nAux++
		nQtdMax++
		FT_FSKIP()
	Enddo
	
	//Determina os campos que serao gravados
	aDePara := U_IMPRDADP()
	
	//Tratamento para importar Varios SubContratos em uma unica familia (utiizado so uma vez para ajustar cadastro)
	DbSelectArea("DADOS")
	DADOS->(DbGoTop())

	// Gera numero do lote de importacao a partir da data
	cLote := dtos(Date()) + StrTran(time(),":","")

	SZ2->(Reclock("SZ2",.T.))
		SZ2->Z2_LOTRDA := cLote
		SZ2->Z2_ARQIMP := cArquivo
		SZ2->Z2_DATPRO := dDataBase
		SZ2->Z2_STATUS := '1'
	SZ2->(MsUnlock())
	
	dVigIni := Ctod("")
	
	ProcRegua(nAux)
	nAux := 1
	
	While !DADOS->(Eof())
			
		IncProc("Gravando e Validando Linha ["+alltrim(str(nAux))+"]");ProcessMessage()
		nAux++
		
		SZ3->(Reclock("SZ3",.T.))
		
		SZ3->Z3_SITREG := '2'
		SZ3->Z3_LOTRDA := cLote
		SZ3->Z3_SEQLOT := cSeq
		
		For nI:=1 to Len(aDePara)
				
			If Type("SZ3->"+aDePara[nI][2]) == "D"
				&("SZ3->"+aDePara[nI][2]) := cTod(&("DADOS->"+aDePara[nI][1]))
			Elseif Type("SZ3->"+aDePara[nI][2]) == "N"
				&("SZ3->"+aDePara[nI][2]) := val(&("DADOS->"+aDePara[nI][1]))
			Else
				&("SZ3->"+aDePara[nI][2]) := Upper(NoAcento(AllTrim(&("DADOS->"+aDePara[nI][1]))))
			Endif
			
		Next
		
		SZ3->(MsUnlock())
		
		U_IMPRDAAJ(SZ3->(Recno()))
		aRetPto := U_IMPRDAVL(SZ3->(Recno()),.F.,cLote) 
		
		If !aRetPto[1]
			SZ3->(Reclock("SZ3",.F.))
			SZ3->Z3_SITREG := '1' //gravo ele como pendente
			for nI:=1 to Len(aRetPto[2])
				SZ3->Z3_MEMO	:= "["+DToC(dDataBase)+" - "+Time()+"] ->	"+aRetPto[2][nI]+chr(13)+chr(10)+SZ3->Z3_MEMO
			next
			For nP:=1 to Len(aRetPto[2])
				aadd(aErro,{cSeq,alltrim(SZ3->Z3_NOMRDA),aRetPto[2][np]})
			NExt
			lOk := .F.
			SZ3->(MsUnlock())
		Endif
		
		cSeq := soma1(cSeq)
		DADOS->(DbSkip())
		
	EndDo
	
	DADOS->(DbCloseArea())

Return lOk


User Function IMPRDADP()

	Local aDePara := {}
	
	AaDd(aDePara, {"COL01"	,'Z3_CODLEG' } )
	AaDd(aDePara, {"COL02"	,'Z3_FISJUR' } )
	AaDd(aDePara, {"COL03"	,'Z3_NOMRDA' } )
	AaDd(aDePara, {"COL04"	,'Z3_NOMFAN' } )
	AaDd(aDePara, {"COL05"	,'Z3_CPFCGC' } )
	AaDd(aDePara, {"COL06"	,'Z3_DATINC' } )
	AaDd(aDePara, {"COL07"	,'Z3_DATCRE' } )
	AaDd(aDePara, {"COL08"	,'Z3_SEXRDA' } )
	AaDd(aDePara, {"COL09"	,'Z3_CONRDA' } )
	AaDd(aDePara, {"COL10"	,'Z3_ESTCON' } )
	AaDd(aDePara, {"COL11"	,'Z3_INSCON' } )
	AaDd(aDePara, {"COL12"	,'Z3_CLASSE' } )
	AaDd(aDePara, {"COL13"	,'Z3_FORPAG' } )
	AaDd(aDePara, {"COL14"	,'Z3_TIPLOG' } )
	AaDd(aDePara, {"COL15"	,'Z3_LOGRAD' } )
	AaDd(aDePara, {"COL16"	,'Z3_NUMERO' } )
	AaDd(aDePara, {"COL17"	,'Z3_COMPLE' } )
	AaDd(aDePara, {"COL18"	,'Z3_CEPRDA' } )
	AaDd(aDePara, {"COL19"	,'Z3_BAIRRO' } )
	AaDd(aDePara, {"COL20"	,'Z3_CODMUN' } )
	AaDd(aDePara, {"COL21"	,'Z3_DDDRDA' } )
	AaDd(aDePara, {"COL22"	,'Z3_TELEFO' } )
	AaDd(aDePara, {"COL23"	,'Z3_CONTAT' } )
	AaDd(aDePara, {"COL24"	,'Z3_EMAIL'  } )
	AaDd(aDePara, {"COL25"	,'Z3_FAXRDA' } )
	AaDd(aDePara, {"COL26"	,'Z3_TIPLOC' } )
	AaDd(aDePara, {"COL27"	,'Z3_REGION' } )
	AaDd(aDePara, {"COL28"	,'Z3_DATLOC' } )
	AaDd(aDePara, {"COL29"	,'Z3_LOCGUI' } )
	AaDd(aDePara, {"COL30"	,'Z3_CODESP' } )
	AaDd(aDePara, {"COL31"	,'Z3_DATESP' } )
	AaDd(aDePara, {"COL32"	,'Z3_ESPGUI' } )
	AaDd(aDePara, {"COL33"	,'Z3_ESPPRI' } )
	
Return aDePara


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³MenuDe2   ³ Autor ³ RR TEAM			        ³ Data ³21/09/2012³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Utilizacao de menu Funcional                               ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³Array com opcoes da rotina.                                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³Parametros do array a Rotina:                               ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³   DATA   ³ Programador   ³Manutencao efetuada                         ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function IMPRDA02(cAlias,nReg,nOpc)

	LOCAL I__f		:= 0
	LOCAL nI		:= 1
	LOCAL aArea	:= GetArea()
	LOCAL aSize	:= {}
	LOCAL aObjects	:= {}
	LOCAL aInfo	:= {}
	LOCAL nOpca	:= 0
	LOCAL aPosObj	:= {}
	LOCAL cSitAnt	:= ""
	PRIVATE oDlgP1
	
/*
	If SZ3->Z3_SITREG == '5' .and. nOpc == K_Alterar
		MsgStop("Lote ja processado, nao sera possivel a alteraçao")
		return
	Endif
*/
	
	aSize    := MsAdvSize()
	
	AAdd( aObjects, { 100, 20, .t., .f. } )
	AAdd( aObjects, { 100, 100, .t., .t.,.t. } )
	
	aInfo := { aSize[ 1 ], aSize[ 2 ], aSize[ 3 ], aSize[ 4 ], 3, 3 }
	aPosObj := MsObjSize( aInfo, aObjects,.T. )
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Dialog															   ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	DEFINE MSDIALOG oDlgP1 TITLE "Manutencao" FROM aSize[7],0 To aSize[6],aSize[5] OF GetWndDefault() pixel
	
	Copy "SZ3" TO MEMORY
	
	// Determina os campos que serao gravados logo os que serao exibidos no browse
	aDePara := U_IMPRDADP()
	
	If Len( aCamZ3 ) == 0
		STORE FIELD "SZ3" TO aCamZ3 For (aScan(aDePara,{|x| alltrim(SX3->X3_CAMPO) $ alltrim(x[2])+"#Z3_SITREG#Z3_MEMO"}) > 0)
	EndIf
	cSitAnt := M->Z3_SITREG
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Monta Enchoice...                                                        ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Zero()
	oEncP1 := SZ3->(MsMGet():New("SZ3",SZ3->(Recno()),nOpc,,,,aCamZ3,{005,005,aPosObj[2][4],aPosObj[2][3]},,,,,,oDlgP1,,,.T.,))

/*	
	If nOpc == K_Alterar
		For nI := 1 To Len(oEncP1:AENTRYCTRLS)
			cCampo := AllTrim(oEncP1:aEntryctrls[nI]:CREADVAR)
			cCampo := StrTran(cCampo,"M->","")
			If (aScan(aDePara,{|x| alltrim(cCampo) $ alltrim(x[2])+"#Z3_SITREG#Z3_MEMO"}) > 0) .and. !(cCampo $ "Z3_TIPOPE,Z3_VERPLA")
				oEncP1:AENTRYCTRLS[nI]:LREADONLY     := .F.
				oEncP1:AENTRYCTRLS[nI]:LACTIVE       := .T.
				oEncP1:AENTRYCTRLS[nI]:LVALIDATING   := .T.
			Endif
		Next
	Endif
*/

	//ACTIVATE MSDIALOG oDlgP1 Center ON INIT EnChoiceBar(oDlgP1,{|| Iif(Obrigatorio(oEncP1:aGets,oEncP1:aTela) .and. u_rrVldIn(cSitAnt,.T.),(nOpca:=1,oDlgP1:End()),nOpca:=2) },{||nOpca:=2,oDlgP1:End()},.F.,{})
	ACTIVATE MSDIALOG oDlgP1 Center ON INIT EnChoiceBar(oDlgP1,{|| nOpca:=2,oDlgP1:End() },{|| nOpca:=2,oDlgP1:End() },.F.,{})
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Inicializa transacao...                                                    ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	If nOpca ==  1
		PLUPTENC("SZ3",nOpc)
	Endif
	RestArea(aArea)
	
Return




/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³procPlanilha   ³ Autor ³ RR TEAM	       ³ Data ³21/09/2012³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ 							                                  ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³Array com opcoes da rotina.                                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³Parametros do array a Rotina:                               ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³   DATA   ³ Programador   ³Manutencao efetuada                         ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static function procPlanilha(nRecSZ2,aErro,nOpc)

	LOCAL aRecnos := {}
	LOCAL aRetGrav := {}
	LOCAL nI 	  := 1
	LOCAL nAux	  := 1
	
	If SZ3->(MsSeek(xFilial("SZ3")+SZ2->Z2_LOTRDA))
	
		While !SZ3->(Eof()) .and. xFilial("SZ3")+SZ2->Z2_LOTRDA == SZ3->(Z3_FILIAL+Z3_LOTRDA)
		
			IncProc("Lendo Registro ["+alltrim(str(nAux))+"]");ProcessMessage()

			If SZ3->Z3_SITREG == '2' .OR. SZ3->Z3_SITREG == '4' 
				aadd(aRecnos,SZ3->(Recno()))
			Endif
			
			SZ3->(DbSkip())
			
		EndDo
		
	EndIf
	
	Procregua(Len(aRecnos))
	
	For nI:=1 to Len(aRecnos)
	
		SZ3->(DbGoTo(aRecnos[nI]))
		
		IncProc("Usr. ["+alltrim(substr(SZ3->Z3_NOMRDA,1,30))+"]");ProcessMessage()
		SZ3->(RegToMemory("SZ3",.F.))
		
		aRetGrav := gravaRDA(.F.,.F.)
		
		If !Empty(aRetGrav).And. !aRetGrav[1,2]
			aadd(aErro,{SZ3->Z3_SEQLOT,alltrim(SZ3->Z3_NOMRDA),aRetGrav[1,1]})
		EndIf
		
	Next
/*	
	SZ2->(DbGoTo(nRecSZ2))
	SZ2->(Reclock("SZ2",.F.))
		SZ2->Z2_STATUS := '2'
	SZ2->(MsUnlock())
*/
	
Return




/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³gravaRDA³Autor ³ Thiago Paris          ³ Data ³ 06.07.12    ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³                                                      	    ³±±
±±³          ³                                                      	    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function gravaRDA(lHelp,lVldReg)
	
	Local aRet	  := {}
	
	If M->Z3_SITREG == '2' .OR. M->Z3_SITREG == '4'
		
		aDados := {}
	
		aAdd( aDados,{"OPERADORA"					,GetNewPar("MV_XOPIMP", "0990")		})		
		aAdd( aDados,{"CODIGOLEGADO"					,M->Z3_CODLEG	})
		aAdd( aDados,{"FISICAJURIDICA"				,M->Z3_FISJUR	})
		aAdd( aDados,{"NOME"							,M->Z3_NOMRDA	})
		aAdd( aDados,{"NOMEFANTASIA"					,M->Z3_NOMFAN	})
		aAdd( aDados,{"CPFCNPJ"						,M->Z3_CPFCGC	})
		aAdd( aDados,{"DATAINCLUSAO"				,Iif(!Empty(M->Z3_DATINC),DToC(M->Z3_DATINC),"00/00/0000") })
		aAdd( aDados,{"DATACREDENCIAMENTO"			,Iif(!Empty(M->Z3_DATCRE),DToC(M->Z3_DATCRE),"00/00/0000") })
		aAdd( aDados,{"SEXO"							,M->Z3_SEXRDA	})
		aAdd( aDados,{"CONSELHO"						,M->Z3_CONRDA	})
		aAdd( aDados,{"UFCONSELHO"					,M->Z3_ESTCON	})
		aAdd( aDados,{"INSCRICAOCONSELHO"			,M->Z3_INSCON	})
		aAdd( aDados,{"CLASSERDA"					,M->Z3_CLASSE	})
		aAdd( aDados,{"FORMAPAGAMENTO"				,M->Z3_FORPAG	})
		aAdd( aDados,{"CODTIPLOGRAD"					,M->Z3_TIPLOG	})
		aAdd( aDados,{"LOGRADOURO"					,M->Z3_LOGRAD	})
		aAdd( aDados,{"NUMERO"						,M->Z3_NUMERO	})
		aAdd( aDados,{"COMPLEMENTO"					,M->Z3_COMPLE	})
		aAdd( aDados,{"CEP"							,M->Z3_CEPRDA	})
		aAdd( aDados,{"BAIRRO"						,M->Z3_BAIRRO	})
		aAdd( aDados,{"CODMUNICIPIO"					,M->Z3_CODMUN	})
		aAdd( aDados,{"DDD"							,M->Z3_DDDRDA	})
		aAdd( aDados,{"TELEFONE"						,M->Z3_TELEFO	})
		aAdd( aDados,{"CONTATO"						,M->Z3_CONTAT	})
		aAdd( aDados,{"EMAIL"							,M->Z3_EMAIL	})
		aAdd( aDados,{"FAX"							,M->Z3_FAXRDA	})
		aAdd( aDados,{"TIPOLOCAL"					,M->Z3_TIPLOC	})
		aAdd( aDados,{"REGIONAL"						,M->Z3_REGION	})
		aAdd( aDados,{"DATAINCLUSAOLOCAL"			,Iif(!Empty(M->Z3_DATLOC),DToC(M->Z3_DATLOC),"00/00/0000")	})
		aAdd( aDados,{"GUIALOCAL"					,M->Z3_LOCGUI	})
		aAdd( aDados,{"CODESPECIALIDADE"			,M->Z3_CODESP	})
		aAdd( aDados,{"DATAINCLUSAOESP"				,Iif(!Empty(M->Z3_DATESP),DToC(M->Z3_DATESP),"00/00/0000")	})
		aAdd( aDados,{"GUIAESPECIALIDADE"			,M->Z3_ESPGUI	})
		aAdd( aDados,{"ESPPRINCIPAL"					,M->Z3_ESPPRI	})
	
		aRet := U_RRPLS002(aDados,lHelp,lVldReg,/*lIncPrfSaude*/.F.,/*lFornecedor*/.T.,/*lUtilCEP*/.F.)
        
		If aRet[1][2]
			SZ3->(RecLock("SZ3",.F.))
				SZ3->Z3_MEMO		:= "["+DToC(dDataBase)+" - "+Time()+"] ->	"+aRet[1][1]+chr(13)+chr(10)+M->Z3_MEMO
				SZ3->Z3_SITREG	:= '5' //registro gravado
			SZ3->(MsUnlock())
		Else
			SZ3->(RecLock("SZ3",.F.))
				SZ3->Z3_MEMO		:= "["+DToC(dDataBase)+" - "+Time()+"] -> "+aRet[1][1]+chr(13)+chr(10)+M->Z3_MEMO
				SZ3->Z3_SITREG	:= '4' //registro nao gravado
			SZ3->(MsUnlock())
		Endif

	EndIf
	
Return aRet



Static Function GeraArqErros(fileDesc,aErro)

	Local nI := 0
	
	//PLSCRIGEN(aErro,{ {"Linha","@C",24} , {"RDA","@C",60 }, {"Inconsistencia","@C",250 } },"Impressão de Inconsistências.")
	
	If (fileDesc <> -1)
		fWrite(fileDesc, "Linha;RDA;Inconsistencia;" + Chr(13) + Chr(10))
	EndIf
	
	For nI := 1 To Len(aErro)

		If (fileDesc <> -1)
			fWrite(fileDesc, aErro[nI][1] + ';' + aErro[nI][2] + ';' + aErro[nI][3] + ';' + Chr(13) + Chr(10))
		EndIf
		
	Next

Return


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ IMPRDA03     ³ Autor ³ RR TEAM		           ³ Data ³ 31.05.14 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Atualiza cadastro de Fornecedor vinculado a RDA importado, via ³±±
±±³          ³ layout específico                                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/

User Function IMPRDA03()

	Local cArqImp	:= ''
	Local lOk		:= .T.

	cArqImp := cGetFile("Arquivos CSV (*.CSV) |*.csv|","Selecione o arquivo CSV para atualização",0,"",.T.,(GETF_NETWORKDRIVE,GETF_LOCALHARD),.T.)
	
	If (Empty(cArqImp) .or. Ft_FUse(cArqImp) == -1)
		lOk := .F.
		Ft_FUse()
		MsgStop("Arquivo invalido.")
	Endif
	
	If lOk .and. !ChkLay03()
		lOk := .F.
		Ft_FUse()
		MsgStop("Layout do arquivo invalido. A importacao nao podera ser feita pois as colunas do arquivo nao condizem com o Layout utilizado.")
	Endif

	If lOk .and.  Aviso(	"Atualização de Cadastro", "Confirma a Atualização das RDAs?" + Chr(13)+Chr(10) + Chr(13)+Chr(10) + ;
							"Importante: Esta rotina substituirá dados do cadastro de Fornecedores e RDA de acordo com as informações do arquivo sem nenhum tipo de validação", {"Sim","Nao"}) == 1
		
		Processa({|| lOk := ImpAtuFornec(cArqImp)},"Processando","Aguarde, processando arquivo",.F.)
			
		MsgStop("Importacao concluida.")

	Else
		If lOk
			MsgStop("Processamento abortado.")
		Endif
		lOk := .F.
	Endif

	Ft_FUse()

Return


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ CHKLAY03  ³ Autor ³ RR TEAM              ³ Data ³31/05/2014³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Verifica a validade do layout de atualizacao de fornecedor ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³ Validade do Layout (.T. se OK ou .F.)                      |±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ Parametros do array a Rotina:                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function ChkLay03()

	Local lRet			:= .T.
	Local xChave		:= ""
	Local aArray		:= {}
	Local cConteudo	:= ""
	Local aHeader		:= {}
	Local cTabela		:= ''
	
	Local nI			:= 0
	
	// Pego a primeira linha do arquivo
	If !FT_FEOF()
	
		xChave := alltrim( FT_FREADLN() )
		aArray := {}
		
		If At(';',xChave) > 0
		
			While (nPos := At(';',xChave)) > 0
				cConteudo := AllTrim(SubStr(xChave,1,nPos-1))
				xChave := AllTrim(SubStr(xChave,nPos+1,Len(xChave)))
				AaDd(aArray,cConteudo)
			EndDo
			
			If !Empty(xChave)
				AaDd(aArray,xChave)
			Elseif nPos < Len(aHeader)
				AaDd(aArray,'')
			Endif
			
		EndIf
		
		aHeader	:=	aClone(aArray)
		
	Endif
	
	// Validação das colunas
	lRet := ("CODIGO_LEGADO" $ Upper(aHeader[01]))
	If !lRet
		alert("O cabeçalho da primeira coluna do arquivo deve ser codigo_legado.")
	Else
		For nI := 2 To Len(aHeader)
			cTabela := Iif("A2_" $ Upper(aHeader[nI]), "SA2->", "BAU->")
			//alert(cTabela + '(FieldPos("' + Upper(aHeader[nI]) + '")) > 0')
			lRet := lRet .AND. (&(cTabela + '(FieldPos("' + Upper(aHeader[nI]) + '")) > 0'))
			If !lRet
				alert("O campo " + Upper(aHeader[nI]) + " não existe no Sistema.")
			End
		Next nI
	EndIf

Return lRet


/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³ImpAtuFornec   ³ Autor ³ RR TEAM			³ Data ³31/05/2014³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³Array com opcoes da rotina.                                 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³Parametros do array a Rotina:                               ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³   DATA   ³ Programador   ³Manutencao efetuada                         ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function ImpAtuFornec(cArquivo)

	Local lOk			:= .T.
	Local xChave		:= ""
	Local aArray		:= {}
	Local cConteudo	:= ""
	Local aHeader		:= {}
	Local aStruc		:= {}
	Local nI			:= 1
	Local np			:= 1
	Local aDePara		:= {}
	Local cLote		:= ""//strzero(1,TamSX3("Z3_LOTRDA")[1])
	Local cSeq			:= StrZero(1,6)//strzero(1,TamSX3("Z3_SEQLOT")[1])
	Local nAux			:= 1
	Local aRetPto		:= {.T.,{}}
	Local cMatEmp		:= ""
	Local dDatGer		:= ctod('')
	Local nPos			:= 0
	Local cCodLeg		:= ''
	Local cTabela		:= ''
	
	While !FT_FEOF()
		
		xChave := Upper( AllTrim( FT_FREADLN() ) )
		aArray := {}
		
		If At(';',xChave) > 0
			While (nPos := At(';',xChave)) > 0
				cConteudo    := AllTrim(SubStr(xChave,1,nPos-1))
				xChave := AllTrim(SubStr(xChave,nPos+1,Len(xChave)))
				AaDd(aArray,cConteudo)
			EndDo
			If !Empty(xChave)
				AaDd(aArray,xChave)
			Elseif nPos < Len(aHeader)
				AaDd(aArray,SPACE(__NTAMTRB))
			Endif
		EndIf
		
		If nAux == 1
			aHeader := aClone(aArray)
		Else
			cCodLeg := aArray[1]
			BAU->(DbOrderNickname('RDABAU01'))//BAU_FILIAL + BAU_YCDLEG
			If BAU->(MsSeek(xFilial("BAU")+cCodLeg))
				SA2->(DbSetOrder(1))
				If SA2->(MsSeek(xFilial("SA2")+BAU->(BAU_CODSA2+BAU_LOJSA2)))
					For nI := 2 To Len(aHeader)
						cTabela := Iif("A2_" $ Upper(aHeader[nI]), "SA2", "BAU")
						&(cTabela + '->(RecLock("' + cTabela + '",.F.))')
						If Type(cTabela+"->"+aHeader[nI]) == "D"
							&(cTabela+"->"+aHeader[nI]) := cTod(aArray[nI])
						Elseif Type(cTabela+"->"+aHeader[nI]) == "N"
							&(cTabela+"->"+aHeader[nI]) := val(aArray[nI])
						Else
							&(cTabela+"->"+aHeader[nI]) := Upper(NoAcento(AllTrim(aArray[nI])))
						Endif
						&(cTabela + '->(MsUnlock())')
					Next nI
				Else
					alert("Fornecedor não encontrado [" + xFilial("SA2")+BAU->(BAU_CODSA2+BAU_LOJSA2) + "].")
				EndIf
			Else
				alert("RDA não encontrado [" + xFilial("BAU")+cCodLeg + "].")
			EndIf
		EndIf
		nAux++
		FT_FSKIP()
		
	Enddo

Return lOk
