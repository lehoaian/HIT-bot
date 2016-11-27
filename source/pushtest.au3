#include "global_vars.au3"
#include "commons\click.au3"
#include "commons\sleep.au3"
#include "commons\set_log.au3"
#include "commons\time.au3"
#include "commons\random_gaussian.au3"
#include "commons\write_stats.au3"
#include "commons\push_bullet.au3"

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
DirCreate($dirLogs)
CreateLogFile()
$statusFile = "status.jpg"
_PushFile($statusFile, "imgs", "image/jpeg", "Last Raid", $statusFile)