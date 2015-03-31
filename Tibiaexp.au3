#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <NomadMemory.au3> 
$checka = 1
Func getTibiaCHAR() 
   $Process1 = WinGetProcess("Tibia") 
   $Mem_Open = _MemoryOpen($Process1) 

   $CHAR = _MemoryRead('0x009420BC', $Mem_Open, 'char[50]')   
   return $CHAR
EndFunc   
Func getTibiaHealer() 
   $Process1 = WinGetProcess("Tibia") 
   $Mem_Open = _MemoryOpen($Process1) 

   $healar = _MemoryRead('0x0012E844', $Mem_Open)   
   return $healar
EndFunc   
#Region ### START Koda GUI section ### Form=c:\documents and settings\ongame.alexandreo\meus documentos\ale_bot\tibiaexp\form\tibiaexp.kxf
$Form1_1 = GUICreate("Tibiaexp Bot Heal", 412, 237, 504, 257)
$Group1 = GUICtrlCreateGroup("Tibia Exp Bot Heal", 8, 8, 393, 217)
$txt_ativa = GUICtrlCreateCheckbox("Active", 184, 136, 57, 17)
;~ $Label3 = GUICtrlCreateLabel("Ale balboa", 24, 40, 118, 17)
;~ GUICtrlSetColor(-1, 0xFF0000)
;~ GUICtrlSetCursor (-1, 3)
$Group2 = GUICtrlCreateGroup("Info Player", 16, 24, 145, 89)
GUICtrlCreateGroup("", -99, -99, 1, 1)


GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
   If getTibiaCHAR() <> '' Then
	if $checka == 1 Then
	   $char_info2 = getTibiaCHAR() 
	   $vida = getTibiaHealer() 
	   $checka = 2
	   $Label3 = GUICtrlCreateLabel($char_info2, 24, 40, 118, 17)
	   GUICtrlSetColor(-1, 0xFF0000)
	   GUICtrlSetCursor (-1, 3)
	   $Label1 = GUICtrlCreateLabel("exp", 24, 88, 38, 17)
	   GUICtrlSetColor(-1, 0x000080)
	   GUICtrlSetCursor (-1, 3)
	   $Label2 = GUICtrlCreateLabel($vida, 24, 72, 30, 17)
	  GUICtrlSetColor(-1, 0x008000)
	  GUICtrlSetCursor (-1, 3)
	  $Label4 = GUICtrlCreateLabel("500", 24, 56, 22, 17)
	  GUICtrlSetCursor (-1, 3)
	   EndIf
   Else	
	$checka = 1 
   EndIf   
   
$nMsg = GUIGetMsg()
Switch $nMsg
Case $GUI_EVENT_CLOSE
Exit

Case $txt_ativa
EndSwitch
WEnd
