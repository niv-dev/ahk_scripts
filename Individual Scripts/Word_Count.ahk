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
