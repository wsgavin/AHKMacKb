; Warren Gavin
; warren@dubelyoo.com
;
; TODO:
;     - Instructions on Boot Camp keyboard drivers
;     - Rethink on modules as this is more than just Mac keyboard specific
;



#NoEnv
#MaxHotkeysPerInterval 1000
#SingleInstance force
#InstallKeybdHook

SendMode Input


; Reverse Scroll
WheelUp::Send {WheelDown}
WheelDown::Send {WheelUp}


; Media - no longer needed w/Boot Camp drivers
;F10::SendInput {Volume_Mute}
;F11::SendInput {Volume_Down}
;F12::SendInput {Volume_Up}



; Save
#s::Send ^s

; Select all
#a::Send ^a

; Copy
#c::Send ^c

; Paste
#v::Send ^v

; Cut
#x::Send ^x

; Open
#o::Send ^o

; Find
#f::Send ^f

; Find Next
#g::Send ^g

; Undo
#z::Send ^z

; Repeat
#y::Send ^y

; New tab
#t::Send ^t

; Close window
#w::Send ^w

; New window
#n::Send ^n

; Alt Tab flip flop
Lwin & Tab::AltTab

; Bold
#b::Send ^b

; Italics
#i::Send ^i


; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1

; Find Previous
+#g::Send +^g

; Paste as plain text
#+v::Send ^+v

#IfWinActive



::dff::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
return
