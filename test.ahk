#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

OutputDebug, DBGVIEWCLEAR

main()


main() {
	IfWinExist,  BlueStacks
		WinActivate,  BlueStacks
	else
		Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\BlueStacks

while 1 {
	ResetView()
	;UpgradeHallFunc()
	HelpMe()
	HelpOthers()
	UpgradeBuilding()
}
ExitApp
}

ImageSearchFunc(image) {
	sleep 1000
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %image%
	if (ErrorLevel = 2) {
		OutputDebug NOT FOUND ERROR
		return 0
	} else {
		if (ErrorLevel = 1) {
			OutputDebug NOT FOUND image %image%
			return 0
		} else {
			FoundX += 40
			FoundY += 60
			MouseMove, %FoundX%, %FoundY%
			OutputDebug POS %FoundX%, %FoundY% on image %image%
			MouseClick, left
			return 1
		}
	}
}

UpgradeHallFunc() {
	UpgradeHall := []
	UpgradeHall[0] := "*100 img\hall.PNG" 
	UpgradeHall[1] := "*100 img\up.PNG" 
	UpgradeHall[2] := "*70 img\go.PNG"
	UpgradeHall[3] := "*100 img\upgrade.PNG"

	timer := 0
	if (ImageSearchFunc(UpgradeHall[0]) == 1) {
		while (ImageSearchFunc(UpgradeHall[3]) == 0) {
				if (ImageSearchFunc(UpgradeHall[1]) == 1)
					ImageSearchFunc(UpgradeHall[2])
				else
					break
				timer += 1
				if (timer > 10)
					break
		}
	}
}

ResetView() {
	ImageSearchFunc("*70 img\map.PNG")
	ImageSearchFunc("*70 img\city.PNG")
}

UpgradeBuilding() {
	BuildOrder := []
	BuildOrder [0] := "*140 img\build.PNG"
	BuildOrder [1] := "*100 img\hammer.PNG"
	BuildOrder [2] := "*100 img\build_button.PNG"
	BuildOrder [3] := "*100 img\up.PNG"
	BuildOrder [4] := "*50 img\upgrade.PNG"
	BuildOrder [5] := "*50 img\help.PNG"
	BuildOrder [6] := "*50 img\speedUp.PNG"
	BuildOrder [7] := "*50 img\getMore.PNG"
	BuildOrder [8] := "*10 img\cross2.PNG"
	
	if (ImageSearchFunc(BuildOrder[0]) == 1) {
		if (ImageSearchFunc(BuildOrder[1]) == 1) {
			if (ImageSearchFunc(BuildOrder[6]) == 1) {
				ImageSearchFunc(BuildOrder[8])
				ImageSearchFunc(BuildOrder[8])
				return 0
			}
			if (ImageSearchFunc(BuildOrder[2]) == 1) {
				if (ImageSearchFunc(BuildOrder[3]) == 1) {
					if (ImageSearchFunc(BuildOrder[4]) == 1) {
						return ImageSearchFunc(BuildOrder[5])
					}
				}
			}
		}
	}
	
	if (ImageSearchFunc(BuildOrder[7]) == 1) {
		ImageSearchFunc(BuildOrder[8])
		ImageSearchFunc(BuildOrder[8])
		ImageSearchFunc(BuildOrder[8])
		return 1
	}
	return 0
}

HelpMe() {
	ImageSearchFunc("*30 img\helpMe.PNG")
}

HelpOthers() {
	ImageSearchFunc("*100 img\helpOthers.PNG")
}

Esc::ExitApp  ;Escape key will exit... place this at the bottom of the script