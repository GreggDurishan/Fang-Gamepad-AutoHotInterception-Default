#SingleInstance force
Persistent
#include c:\Program Files\AutoHotInterception\Lib\AutoHotInterception.ahk

AHI := AutoHotInterception()
keyboardId := AHI.GetKeyboardId(0x1038, 0x0310, 1)

KeyEvent(key, state) {
    AHI.SendKeyEvent(KeyboardId, key, state)
}

mappings := {
	; correct fang keys to what their smalltext labels indicate & reasonable guesses on unlabeled ones
	NumpadEnd : "1",
	NumpadPgDn : "3",
	f7 : "-",
	PrintScreen : "=",
	f9 : "l",
	NumpadRight : "CapsLock",
	f5 : "t",
	f10 : "m",
	m : "g",
	Left : "n"
}

for key, value in mappings.OwnProps() {
    AHI.SubscribeKey(keyboardId, GetKeySC(key), true, KeyEvent.Bind(GetKeySC(value)))
}

;  "[", "]", "/", "'" etc. are unfriendly names for a keys in an enum, so have to be done separately
AHI.SubscribeKey(keyboardId, GetKeySC("["), true, KeyEvent.Bind(GetKeySC("PrintScreen")))
AHI.SubscribeKey(keyboardId, GetKeySC("]"), true, KeyEvent.Bind(GetKeySC("ScrollLock")))
AHI.SubscribeKey(keyboardId, GetKeySC("/"), true, KeyEvent.Bind(GetKeySC("z")))
AHI.SubscribeKey(keyboardId, GetKeySC("g"), true, KeyEvent.Bind(GetKeySC("'")))

return
