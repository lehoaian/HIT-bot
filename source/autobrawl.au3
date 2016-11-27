

Func EnterThenReplayBrawl ()
   Local $iPID = Run("C:\Program Files (x86)\BlueStacks\HD-Restart.exe BlueStacks App Player", "")
   Sleep( 20000 )
   SetLog("Start game")

   ; Click app icon
   Click( 225, 125 )
   Sleep( 90000 )
   SetLog("Start game")

   ; Close the ad
   Click( 835, 155 )
   Sleep( 500 )
   SetLog("Close ads")

   Click( 660, 230 )
   Sleep( 1000 )
   SetLog("Idle off")

   ; Go challenge
   Click( 775, 470 )
   Sleep( 1000 )
   SetLog("Go Challenger")

   ; Go arena
   Click( 135, 440 )
   Sleep( 1000 )
   SetLog("Go garena")

   ; Go Brawl
   Click( 635, 465 )
   Sleep( 1000 )
   SetLog("Enter Brawl")

   ;~ ; Loop 10 time
   ;~ For $i = 10 To 1 Step -1
   ;~    SetLog("Brawl time " & $i)
   ;~     ;MsgBox($MB_SYSTEMMODAL, "", "Count down!" & @CRLF & $i)
   ;~    ; Start Duel
   ;~    Click( 770, 500 )
   ;~    Sleep( 15000 )

   ;~    Sleep( 120000 )

   ;~    ; Exit
   ;~    Click( 795, 520 )
   ;~    Sleep( 1000 )
   ;~ Next

   ; Loop for 30 min
   For $i = 1500 To 1 Step -1
	  Click( 778, 517 )
	  Sleep ( 1000 )
   Next

   SetLog("Finish Brawl")

EndFunc