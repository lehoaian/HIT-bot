

Func EnterThenReplayDuel()
   ; Go challenge
   Click( 775, 470 )
   Sleep( 1000 )
   SetLog("Go Challenger")

   ; Go arena
   Click( 135, 440 )
   Sleep( 1000 )
   SetLog("Go garena")

   ; Go Duel
   Click( 350, 470 )
   Sleep( 1000 )
   SetLog("Enter Duel")

   ; Loop 10 time
   For $i = 200 To 1 Step -1
	  ; Start Duel
	  Click( 770, 515 )
	  Sleep(300)
	  Click( 925, 30 )
	  Sleep(300)
	  Click( 485, 300 )
	  Sleep(300)
	  Click( 550, 350 )
	  Sleep(300)
	  Click( 750, 95 )
	  Sleep(300)
	  Click( 480, 350 )	; Buy charge
	  Sleep(300)
   ;~    Click( 770, 500 )
   ;~    Click( 770, 500 )
   ;~    Click( 770, 500 )
   ;~    Click( 770, 500 )
   Next
   SetLog ("Finish Duel ---------------")
EndFunc