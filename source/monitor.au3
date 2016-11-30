#include "global_vars.au3"
#include "commons\click.au3"
#include "commons\sleep.au3"
#include "commons\set_log.au3"
#include "commons\time.au3"
#include "commons\random_gaussian.au3"
#include "commons\write_stats.au3"
#include "commons\push_bullet.au3"
#include <ScreenCapture.au3>
#include <GDIPlus.au3>

;Push Bullet--------------------------------------------------------------------------
$PushBulletEnabled = IniRead($config, "notification", "pushbullet", "0")
$PushBullettoken = IniRead($config, "notification", "accounttoken", "")
$PushBullettype = IniRead($config, "notification", "lastraidtype", "0")
$PushBulletattacktype = IniRead($config, "notification", "attackimage", "0")
$PushBulletvillagereport = IniRead($config, "notification", "villagereport", "0")
$PushBulletmatchfound = IniRead($config, "notification", "matchfound", "0")
$PushBulletlastraid = IniRead($config, "notification", "lastraid", "0")
$PushBulletdebug = IniRead($config, "notification", "debug", "0")
$PushBulletremote = IniRead($config, "notification", "remote", "0")
$PushBulletdelete = IniRead($config, "notification", "delete", "0")
$PushBulletfreebuilder = IniRead($config, "notification", "freebuilder", "0")

$access_token = $PushBullettoken
;_Push("title", "msg")
;~ DirCreate($dirLogs)
;~ CreateLogFile()
;~ $statusFile = "Screenshot_7.png"
;~ _PushFile($statusFile, "imgs", "image/png", "Last Raid", $statusFile)



Func monitor_process()
	ConsoleWrite('@@ (34) :(' & @MIN & ':' & @SEC & ') -------------------- monitor_process()' & @CRLF) ;### Function Trace
	$iMonitoringTiming	= IniRead($config, "notification", "monitoring_timing", 60)	; Default í 60 min
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $iMonitoringTiming = ' & $iMonitoringTiming & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
	$bluestack_title	= IniRead($config, "app", "bluestack_title", 0)
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $bluestack_title = ' & $bluestack_title & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

	$sFolder			= "imgs"
	$sImg				= "hourly_status.jpg"
	$sImg_Resize		= "hourly_status_r.jpg"

	While 1
		$HWnD = WinActivate($bluestack_title)

		ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $HWnD = ' & $HWnD & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
		ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : WinWaitActive $i = ' & $i & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

		For $i = 5 To 1 Step -1
			Sleep(200)
			$ret = _ScreenCapture_CaptureWnd($sFolder & '\' & $sImg, $HWnD)
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : _ScreenCapture_CaptureWnd $i = ' & $i & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

			If $ret = True Then
				ExitLoop
			EndIf
		Next
		;Capture screen to bitmap obj

		_GDIPlus_Startup()

		$hBitmap = _GDIPlus_ImageLoadFromFile($sFolder & '\' & $sImg)
		ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $hBitmap = ' & $hBitmap & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console

		If $hBitmap Then
			$iW =_GDIPlus_ImageGetWidth( $hBitmap )
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $iW = ' & $iW & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			$iH = _GDIPlus_ImageGetHeight( $hBitmap )
			ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $iH = ' & $iH & @CRLF & '>Error code: ' & @error & @CRLF) ;### Debug Console
			$hBitmap_Resized = _GDIPlus_ImageResize($hBitmap, $iW / 2, $iH / 2) ;resize image

			;Save to file
			_GDIPlus_ImageSaveToFile ($hBitmap_Resized, $sFolder & '\' & $sImg_Resize )

			;Dispose
			_GDIPlus_ImageDispose($hBitmap)
			_GDIPlus_ImageDispose($hBitmap_Resized)

			_PushFile($sImg_Resize, $sFolder, "image/jpg", "Hourly Status", $sImg)

			FileDelete ($sFolder & '\' & $sImg)
			FileDelete ($sFolder & '\' & $sImg_Resize)

		Else
			_Push("WARNING", "Screen Capture had failed !!! ")
		EndIf

		_GDIPlus_Shutdown()

		;Wait for next wake
		Sleep ( $iMonitoringTiming * 60 * 1000 )
	WEnd
EndFunc

; Monitoring
monitor_process()