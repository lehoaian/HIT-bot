
#include <Date.au3>


Func EnterSanctuaries()
   ; Go challenge
   Click( 775, 470 )
   Sleep( 1000 )
   SetLog("Go Challenger")

   ; Go Sanctuaries
   Click( 380, 190 )
   Sleep( 1000 )
   SetLog("Go Sanctuaries")


   Local $sShortDayName = _DateDayOfWeek(@WDAY, $DMW_SHORTNAME)

   If  $sShortDayName = "Sun" Or $sShortDayName = "Mon" Or $sShortDayName = "Wed" Or $sShortDayName = "Fri" Then
	  ;Light
	  Click( 350, 465 )
	  Sleep( 1000 )
	  SetLog("Go Sanctuaries Of Light")

	  Click( 200, 450 )
	  Sleep( 1000 )

	  Click( 580, 500 )
	  Sleep( 1000 )

	  Sleep ( 300000 ) ; Wait to end
   EndIf

   If  $sShortDayName = "Sun" Or $sShortDayName = "Tue" Or $sShortDayName = "Thu" Or $sShortDayName = "Sat" Then
	  ;Light
	  Click( 610, 465 )
	  Sleep( 1000 )
	  SetLog("Go Sanctuaries Of Blood")

	  Click( 200, 450 )
	  Sleep( 1000 )

	  Click( 580, 500 )
	  Sleep( 1000 )

	  Sleep ( 300000 ) ; Wait to end
   EndIf
   SetLog("Go Sanctuaries ---- Finish")
EndFunc