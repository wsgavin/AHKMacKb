; Warren Gavin
; warren@dubelyoo.com
;
; TODO:
;     - Instructions on Boot Camp keyboard drivers
;     - Rethink on modules as this is more than just Mac keyboard specific
;
;
; Below is a AutoHotKey script I created to specifically support a wireless Mac keyboard. There are other
; automations defined but I am included them to keep it all in one script.
;
; Features That Worked After Boot Camp Keyboard Drivers Installed
;     - Media Controls
;     - Volume Contols
;     - Fn key

#NoEnv
#MaxHotkeysPerInterval 1000
#SingleInstance force
#InstallKeybdHook

SendMode Input

; Reverse Scroll
WheelUp::Send {WheelDown}
WheelDown::Send {WheelUp}

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



; Microsoft Excel
#IfWinActive, ahk_class XLMAIN

#Up::Send ^{Up}

#Down::Send ^{Down}

#IfWinActive



::dff::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
return




; Save as
#+s::F12
