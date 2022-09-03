!+Space::
Send, ^c
query = %clipboard%
#EscapeChar ~

URLDownloadToFile, https://api.wolframalpha.com/v1/result?i=%query%~%3F&appid=HX7QQ2-YRAKXGRUT4, answer.txt
FileRead, answer, answer.txt
FileDelete, answer.txt

clipboard = %answer%

Send, ^v
return

^!+Space::
Send, ^a
Sleep, 100
Send, ^c
query = %clipboard%
#EscapeChar ~

URLDownloadToFile, https://api.wolframalpha.com/v1/result?i=%query%~%3F&appid=HX7QQ2-YRAKXGRUT4, answer.txt
FileRead, answer, answer.txt
FileDelete, answer.txt

clipboard = %answer%

Send, ^v
return
