#include "global_vars.au3"
#include "commons\click.au3"
#include "commons\sleep.au3"
#include "commons\set_log.au3"
#include "commons\time.au3"
#include "commons\random_gaussian.au3"
#include "commons\write_stats.au3"
#include <Date.au3>

Func comm_restart_app()
	ConsoleWrite('@@ (10) :(' & @MIN & ':' & @SEC & ') comm_restart_app()' & @CRLF) ;### Function Trace
	;Read config
	$bluestack_wait_on_restart = IniRead($config, "app", "bluestack_wait_on_restart", 0)
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $bluestack_wait_on_restart = ' & $bluestack_wait_on_restart & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	$bluestack_restart_cmd = IniRead($config, "app", "bluestack_restart_cmd", 0)
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $bluestack_restart_cmd = ' & $bluestack_restart_cmd & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

	; Start BlueStack
	Local $iPID = Run($bluestack_restart_cmd, "")
	Sleep( $bluestack_wait_on_restart )

	; Click app icon
	Click( 225, 125 )
	Sleep( 90000 )

	; Close the ad
	Click( 835, 155 )
	Sleep( 500 )
	ConsoleWrite("Close ads")

	Click( 660, 230 )
	Sleep( 1000 )
	ConsoleWrite("Idle off")
EndFunc

Func event_duel_20time()
	ConsoleWrite('@@ (36) :(' & @MIN & ':' & @SEC & ') event_duel_20time()' & @CRLF) ;### Function Trace
	; Read config
	$duel_20_time_active	= IniRead($config, "event", "duel_20_time_active", 0)
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $duel_20_time_active = ' & $duel_20_time_active & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	$duel_20_time_date		= IniRead($config, "event", "duel_20_time_date","")
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $duel_20_time_date = ' & $duel_20_time_date & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

	If $duel_20_time_active Then
		If $duel_20_time_date <> _NowDate() Then
			; Start dual in 20x20 times.
			comm_restart_app()

			; Go challenge
			Click( 775, 470 )
			Sleep( 1000 )
			ConsoleWrite("Go Challenger")

			; Go arena
			Click( 135, 440 )
			Sleep( 1000 )
			ConsoleWrite("Go garena")

			; Go Duel
			Click( 350, 470 )
			Sleep( 1000 )
			ConsoleWrite("Enter Duel")

			; Loop 10 time
			For $i = 4000 To 1 Step -1
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
			Next

			; Update config when finish this event
			IniWrite($config, "event", "duel_20_time_date", _NowDate())
		EndIf
	EndIf
EndFunc

Func brawl_play_10time()
	ConsoleWrite('@@ (87) :(' & @MIN & ':' & @SEC & ') brawl_play_10time()' & @CRLF) ;### Function Trace

	comm_restart_app()

	; Go challenge
	Click( 775, 470 )
	Sleep( 1000 )
	ConsoleWrite("Go Challenger")

	; Go arena
	Click( 135, 440 )
	Sleep( 1000 )
	ConsoleWrite("Go garena")

	; Go Brawl
	Click( 635, 465 )
	Sleep( 1000 )
	ConsoleWrite("Enter Brawl")

	For $i = 1500 To 1 Step -1
	  Click( 778, 517 )
	  Sleep ( 1000 )
	Next

   ConsoleWrite("Finish Brawl")
EndFunc

Func duel_play_10time()
	ConsoleWrite('@@ (115) :(' & @MIN & ':' & @SEC & ') duel_play_10time()' & @CRLF) ;### Function Trace
	; Restart app
	comm_restart_app()

	; Go challenge
	Click( 775, 470 )
	Sleep( 1000 )
	ConsoleWrite("Go Challenger")

	; Go arena
	Click( 135, 440 )
	Sleep( 1000 )
	ConsoleWrite("Go garena")

	; Go Duel
	Click( 350, 470 )
	Sleep( 1000 )
	ConsoleWrite("Enter Duel")

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
	Next
	ConsoleWrite ("Finish Duel ---------------")
EndFunc


Func sanctuaries_play_1time()
	ConsoleWrite('@@ (155) :(' & @MIN & ':' & @SEC & ') sanctuaries_play_1time()' & @CRLF) ;### Function Trace
	; Restart app
	comm_restart_app()

	; Go challenge
	Click( 775, 470 )
	Sleep( 1000 )
	ConsoleWrite("Go Challenger")

	; Go Sanctuaries
	Click( 380, 190 )
	Sleep( 1000 )
	ConsoleWrite("Go Sanctuaries")

	Local $sShortDayName = _DateDayOfWeek(@WDAY, $DMW_SHORTNAME)
	If  $sShortDayName = "Sun" Or $sShortDayName = "Mon" Or $sShortDayName = "Wed" Or $sShortDayName = "Fri" Then
		;Light
		Click( 350, 465 )
		Sleep( 1000 )
		ConsoleWrite("Go Sanctuaries Of Light")

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
		ConsoleWrite("Go Sanctuaries Of Blood")

		Click( 200, 450 )
		Sleep( 1000 )

		Click( 580, 500 )
		Sleep( 1000 )

		Sleep ( 300000 ) ; Wait to end
	EndIf
	ConsoleWrite("Go Sanctuaries ---- Finish")
EndFunc

Func init_bot()
	ConsoleWrite('@@ (203) :(' & @MIN & ':' & @SEC & ') init_bot()' & @CRLF) ;### Function Trace
	;Init Logger
	DirCreate($dirLogs)
	CreateLogFile()
EndFunc

Func end_bot()
	ConsoleWrite('@@ (208) :(' & @MIN & ':' & @SEC & ') end_bot()' & @CRLF) ;### Function Trace
	FileClose($hLogFileHandle)
EndFunc

init_bot()



; start_bot
While 1
	event_duel_20time()
;~ 	sanctuaries_play_1time()
	duel_play_10time()
	brawl_play_10time()
WEnd

end_bot()

