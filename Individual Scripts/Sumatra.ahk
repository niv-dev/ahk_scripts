;Sumatra Scripts (VIM keybindings)
#IfWinActive, ahk_exe SumatraPDF.exe
+a::send, ^{WheelUp}
+s::send, ^{WheelDown}
+j::send, +{Down}
+k::send, +{Up}
+h::send, +{Left}
+l::send, +{Right}
