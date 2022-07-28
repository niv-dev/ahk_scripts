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
