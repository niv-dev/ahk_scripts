; This is the setting that runs smoothest on my
; system. Depending on your video card and cpu
; power, you may want to raise or lower this value.
SetWinDelay,2

CoordMode,Mouse
return

!LButton::
If DoubleAlt
{
    MouseGetPos,,,KDE_id
    ; This message is mostly equivalent to WinMinimize,
    ; but it avoids a bug with PSPad.
    PostMessage,0x112,0xf020,,,ahk_id %KDE_id%
    DoubleAlt := false
    return
}
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; Get the initial window position.
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
Loop
{
    GetKeyState,KDE_Button,LButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
    KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
    WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; Move the window to the new position.
}
return

!RButton::
If DoubleAlt
{
    MouseGetPos,,,KDE_id
    ; Toggle between maximized and restored state.
    WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
    If KDE_Win
        WinRestore,ahk_id %KDE_id%
    Else
        WinMaximize,ahk_id %KDE_id%
    DoubleAlt := false
    return
}
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; Get the initial window position and size.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
; Define the window region the mouse is currently in.
; The four regions are Up and Left, Up and Right, Down and Left, Down and Right.
If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
    KDE_WinLeft := 1
Else
    KDE_WinLeft := -1
If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
    KDE_WinUp := 1
Else
    KDE_WinUp := -1
Loop
{
    GetKeyState,KDE_Button,RButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    ; Get the current window position and size.
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    ; Then, act according to the defined region.
    WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; Y of resized window
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; W of resized window
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; H of resized window
    KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
    KDE_Y1 := (KDE_Y2 + KDE_Y1)
}
return

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

^!r:: ; press control+alt+r to reload
  Msgbox, Do you really want to reload this script?
  ifMsgBox, Yes
    Reload
  return

;Search Google for Copied Text
^!c::
{
 Send, ^c
 Sleep 50
 Run, https://www.google.com/search?q=%clipboard%
 Return
}

;Alt-K opens KP.
!k::Send, ^{Space}

;Update Windows-Shift-S to be compatible with ShareX. 
#+s::Send, !s

;Windows + Dot Hides the Titlebar. 
LWIN & LButton::
WinSet, Style, -0xC00000, A
return
;

;+Windows + Dot Shows the Titlebar.
LWIN & RButton::
WinSet, Style, +0xC00000, A
return
;

;Alt-J Changes Windows (Simulates Alt-Tab)
!j::Tab

;Simualates Media_Play_Pause, Media_Next, and Media_Prev
!i::Send {Media_Prev}
!o::Send {Media_Play_Pause}
!p::Send {Media_Next}

;Control Alt T opens KP To-do.
^!t::
Send, ^{Space}
Sleep, 50
Send, todo
Send, {Tab}
Return 

;KEYPIRINHA SCRIPTS
!e::Send, ^{Space} everythi {Tab}

!q::Send, ^{Space} sharex {Tab}

#+.::Send, ^{Space} symbo {Tab}

^+/::
Send, ^c
Send, ^{Space}
Sleep, 50
Send,  dic {Tab}
Send, %clipboard%
Return

;Shortcuts / Replacements
::nmail::nivyan.lakhani@gmail.com
::pmail::nivyan.l@pm.me
::#0ac::#0a0c12
::0ac::0a0c12

;Copy without formatting (useful for Copying PDFs)
!+c::
Send, ^c
Send, ^{Space}
Send, ^v
Send, ^a
Send, ^c
Send, {Esc} {Esc}
Return

;Control Alt S opens up saved folder. 
^!s:: Run "C:\Users\hp\Pictures\Saved"

;Edits the Current AHK Script.
^!+a::
Run, notepad "C:\Users\hp\Downloads\014 - Productivity Apolications\Keypirinha\portable\Profile\User\websearch.ini"
^!a::Edit "C:\Users\hp\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\google.ahk"



;Script to count words. 
^#!w::
  OldClipboard := ClipboardAll
  Clipboard = ;clears the Clipboard
  Send, ^c
  ClipWait 0 ;pause for Clipboard data
  If ErrorLevel
  {
    MsgBox, No text selected!
  }
  RegExReplace(Clipboard, ".*?[a-zA-Z-(']+" ,
        , OutputVarCount, -1, 1) 
  MsgBox, %OutputVarCount% words!
  Clipboard := OldClipboard
Return

;Sumatra Scripts (VIM keybindings)
#IfWinActive, ahk_exe SumatraPDF.exe
+a::send, ^{WheelUp}
+s::send, ^{WheelDown}
+j::send, +{Down}
+k::send, +{Up}
+h::send, +{Left}
+l::send, +{Right}

;KP VIM Keybindings.
#IfWinActive, Keypirinha
+j::Down
+k::Up
+l::Tab
+Enter::Tab

;Spotify VIM Keybindings
#IfWinActive, ahk_exe Spotify.exe
+Enter::^Enter
+j::Down
+k::Up

;ShareX VIM Keybindings
#IfWinActive, ahk_exe ShareX.exe
+j::Down
+k::Up
