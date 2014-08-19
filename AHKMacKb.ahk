; Warren Gavin
; warren@dubelyoo.com
;
; Helpful Reminders
;
; # = Windows
; ! = Alt
; ^ = Control
; + = Shift
; < = Left
; > = Right
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
#SingleInstance force
;#MaxHotkeysPerInterval 1000
;#InstallKeybdHook

SendMode Input

EnvGet, ProgFiles32, ProgramFiles(x86)

; Reverse Scroll
WheelUp::Send {WheelDown}
WheelDown::Send {WheelUp}

; Common keyboard shortcut mappings
#s::Send ^s ; Save
#a::Send ^a ; Select all
#c::Send ^c ; Copy
#v::Send ^v ; Paste
#x::Send ^x ; Cut
#o::Send ^o ; Open
#f::Send ^f ; Find
#g::Send ^g ; Find Next
#z::Send ^z ; Undo
#y::Send ^y ; Repeat
#t::Send ^t ; New tab
#w::Send ^w ; Close window
#n::Send ^n ; New window
#b::Send ^b ; Bold
#i::Send ^i ; Italics
Lwin & Tab::AltTab ; Alt Tab flip flop

; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1

  +#g::Send +^g ; Find Previous
  #+v::Send ^+v ; Paste as plain text

#IfWinActive

; Microsoft Excel specifics
#IfWinActive, ahk_class XLMAIN

  #+s::F12 ; Save as
  #Up::Send ^{Up}
  #Down::Send ^{Down}

#IfWinActive

; Microsoft Word specifics
#IfWinActive, ahk_class OpusApp

  #+s::F12 ; Save as

#IfWinActive


; Opens Chrome with a Google search on the selected text.
!#g::
  ClipTemp := Clipboard
  Send ^c
  ClipWait
  StringReplace, Clipboard, Clipboard, %A_Tab%, %A_SPACE%, ALL ; replace tabs w/spaces
  StringReplace, Clipboard, Clipboard, 'r'n'r'n, %A_SPACE%, ALL ; remove duplicate CR+LF's
  StringReplace, Clipboard, Clipboard, 'r'n, %A_SPACE%, ALL ; replace CR+LF w/spaces
  Run, "%ProgFiles32%\Google\Chrome\Application\chrome.exe" "http://www.google.com/search?q=%Clipboard%"
  Clipboard := ClipTemp
  Return

; Opens Sublime to edit AutoHotKey script.
!#e::
  Run, "%A_ProgramFiles%\Sublime Text 2\sublime_text.exe" %A_ScriptFullPath%
  Return

; Reloads AutoHotKey script.
!#r::Reload


; Paste as pure text, http://www.autohotkey.com/community/viewtopic.php?t=11427
; https://gist.github.com/ronjouch/2428558
!#v::
  Clip0 = %ClipBoardAll%
  ClipBoard = %ClipBoard% ; Convert to text
  Send ^v
  Sleep 50 ; Don't change clipboard while it is pasted! (Sleep > 0)
  ClipBoard = %Clip0% ; Restore original ClipBoard
  VarSetCapacity(Clip0, 0) ; Free memory
  Return


; Resize current window to standard sizes
; https://gist.github.com/ronjouch/2428558
MoveWindow(width, height)
{
  WinMove, A, , , , width, height
  ToolTip, %width%x%height%
  Sleep, 500
  ToolTip,
  Return
}

!#1::MoveWindow(1280, 800)
!#2::MoveWindow(1024, 768)
!#3::MoveWindow(800, 600)


; Hotsrings

; Date format for filenames.
::dff::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
Return

; Personal email address
::w@::warren@dubelyoo.com

; Used when commenting in emails, etc.
::wgc::[WG] [/WG]{Left 6}
