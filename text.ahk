#NoEnv
SetBatchLines -1

;
Gui, font, cBlack s35 w1000, Courier new
Gui, Add, Text, Center w1000, Welcome to Windows Customizer
;

;
Gui, Margin, 100, 100
Gui, font, cBlack s25 w700, Courier new
Gui, Add, Button, Center h70 w500 gOpenCustomizeCursorWindow, Customize cursor
;

;
Gui, Margin, 0, 50
Gui, font, cBlack s25 w700, Courier new
Gui, Add, Button, Center h70 w500 gOpenCustomizeAnimationWindow, Customize delete animation
;

;
Gui, Margin, 0, 50
Gui, font, cBlack s25 w700, Courier new
Gui, Add, Button, Center h70 w500 gDeleteFiles, Delete files
;

;
Gui, Add, Picture, X625 Y180 w300 h300, cat1.jpg
Gui, Color, F2D09D
Gui, Show, w1000 h550 , Windows Customizer
 
return

OpenCustomizeCursorWindow:
	Gui,3:Color,Black
	Gui,3:Color,ControlColor, Black
	Gui,3: Add, ActiveX, w1000 h550 vWMP, WMPLayer.OCX
	WMP.Url := "video.mp4"
	WMP.uiMode := "none"                   ; no WMP controls
	WMP.stretchToFit := 1                  ; video is streched to the given activex range
	WMP.enableContextMenu := 0             ; no reaction to right click in the video field
	WMP.settings.setMode("autoRewind", true)
	Gui,3: Show, w1000 h550  Center, Player GUI
	Sleep, 5700
	Gui,3: Cancel
	extensions :="cur"
	FileSelectFile, file, 2, , Select Compatible File:%extensions%
	SplitPath,file, name, dir, ext, name_no_ext, drive
	hCursor := DllCall("LoadCursorFromFile", "Str", file, "Ptr")
	DllCall("SetSystemCursor", "Ptr", hCursor, "Int", 32512)
return

OpenCustomizeAnimationWindow:
	Gui, 2: Add, Picture, w200 h250 gMenuHandler, black.jpg
	Gui, 2: Add, Picture, w200 h250 gMenuHandler, white.jpg
	Gui, 2: Color, F2D09D
	Gui, 2: Show, , Choose your side 
return

DeleteFiles:
	FileSelectFile, file, 2, ,
	MsgBox, 1, Deleting file, Do you want delete this file?
	if MsgBox No
		filename:= "cry.mp4"
	else
		filename:= "clip.mp4"
	
	Gui,4:Color,Black
	Gui,4:Color,ControlColor, Black
	Gui,4: Add, ActiveX, w1000 h550 vWMP, WMPLayer.OCX
	WMP.Url := filename
	WMP.uiMode := "none"                   ; no WMP controls
	WMP.stretchToFit := 1                  ; video is streched to the given activex range
	WMP.enableContextMenu := 0             ; no reaction to right click in the video field
	WMP.settings.setMode("autoRewind", true)
	Gui,4: Show, w1000 h550  Center, Player GUI
	Sleep, 5000
	Gui,4: Cancel
	
	

return

MenuHandler:
	MsgBox Animation accepted
return
