#include "global_vars.au3"
#include "commons\click.au3"
#include "commons\sleep.au3"
#include "commons\set_log.au3"
#include "commons\time.au3"
#include "commons\random_gaussian.au3"
#include "commons\write_stats.au3"
#include "commons\push_bullet.au3"
#include <ScreenCapture.au3>
#include <WinAPIGdi.au3>

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

While 1
;~ 	$HWnD = WinGetHandle("MINGW64:/c/Users/anlth/Desktop/hit-bot-src/source")
	WinActivate($HWnD)
	;~ _ScreenCapture_SetBMPFormat(0)
	_ScreenCapture_CaptureWnd("imgs\hourly_status.jpg", $HWnD)
	$statusFile = "hourly_status.jpg"
	Sleep(500)

   _PushFile($statusFile, "imgs", "image/jpg", "Hourly Status", $statusFile)

	FileDelete ("imgs/hourly_status.jpg")
	Sleep(500)

   Sleep ( 1800000 )
WEnd

;~ Local $hHBmp = _ScreenCapture_CaptureWnd("", $HWnD)

;~ ; Create compressed PNG data
;~ Local $pData = 0
;~ Local $iLength = _WinAPI_CompressBitmapBits($hHBmp, $pData, $COMPRESSION_BITMAP_JPEG, 10)

;~ _WinAPI_SaveHBITMAPToFile( "imgs\hourly_status.jpg", $hHBmp )
;~ ; Delete unnecessary bitmaps
;~ _WinAPI_DeleteObject($hHBmp)

;~ ; Free memory
;~ _WinAPI_FreeMemory($pData)