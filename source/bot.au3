#include "global_vars.au3"
#include "commons\click.au3"
#include "commons\sleep.au3"
#include "commons\set_log.au3"
#include "commons\time.au3"
#include "commons\random_gaussian.au3"
#include "commons\write_stats.au3"

#include "sanctuaries.au3"
#include "autobrawl.au3"
#include "autoduel.au3"
#include "autoduel_playtoend.au3"

;Init Logger
DirCreate($dirLogs)
CreateLogFile()

Func RestartApp()
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
EndFunc

; Loop infinity
; Enter Santuaries
RestartApp()
EnterThenPlayToEndGem()

RestartApp()
EnterSanctuaries()

While 1
   RestartApp()
   EnterThenReplayDuel()

   RestartApp()
   EnterThenReplayBrawl()
WEnd

FileClose($hLogFileHandle)
