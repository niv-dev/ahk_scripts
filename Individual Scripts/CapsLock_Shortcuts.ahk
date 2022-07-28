;CapsLock Shortcuts
#Persistent
SetCapsLockState, AlwaysOff

*CapsLock::Return
+CapsLock::Return

CapsLock & d::
	Send, ^{Space}
	Sleep, 50
	Send, dic
	Send, {Tab}
Return

CapsLock & t::
	Send, ^{Space}
	Sleep, 50
	Send, translate
	Send, {Tab}
Return

CapsLock & g::
    Run, http://www.google.com/search?q=%clipboard%
Return

CapsLock & w::
    Run, wt
    Sleep 400
    Send, #{Right}
Return

CapsLock & b::
    Run, vivaldi
Return

CapsLock & v::
    Run, code
Return

CapsLock & s::
    Run, spotify
Return

CapsLock & e::
    Run, https://excalidraw.com
Return

CapsLock & m::
    Run, https://akam.managebac.com/student
Return

CapsLock & q::
    Send, #r
    Sleep, 10
    Send, cmd /c scrcpy -m640 -d
    Sleep, 5
    Send, {Enter}
Return

CapsLock & a::
    Send, #r
    Sleep, 10
    Send, cmd /c scrcpy -m640 -e
    Sleep, 5
    Send, {Enter}
Return

CapsLock & j::Down
CapsLock & k::Up
CapsLock & h::Left
CapsLock & l::Right
