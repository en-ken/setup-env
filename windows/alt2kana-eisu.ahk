SetIME(IsOn, WinTitle="A")    {
    ControlGet,hwnd,HWND,,,%WinTitle%
    if(WinActive(WinTitle)){
        cbSize := 4+4+(A_PtrSize*6)+16  ;Calculate size of GUITHREDINFO and Allocate
        VarSetCapacity(pgui, cbSize, 0) ;Allocate
        NumPut(cbSize, pgui, 0, "UInt") ;1.Write cbSize
        hwnd := DllCall("GetGUIThreadInfo", Uint,0, Uint,&pgui)
            ? NumGet(pgui, 4+4+A_PtrSize, "UInt") : hwnd ;2.Read hwndActive
        ;GetGUIThreadInfo(in DWORD idThread, inout LPGUITHEREADINFO lpgui)
        ;GUITHREDINFO {
        ;   DWORD cbSize;   <-1.Write by NumPut [pgui]
        ;   DWORD flags;
        ;   HWND hwndActive;
        ;   HWND hwndFocus; <-2.Read by NumGet [pgui +(4+4+A_PtrSize)]
        ;   ~
        ;}
    } 
    return DllCall("SendMessage"
            ,UInt, DllCall("imm32\ImmGetDefaultIMEWnd", Uint, hwnd)
            ,UInt, 0x0283   ;=WM_IME_CONTROL 
            ,Int, 0x006     ;=IMC_SETOPENSTATUS
            ,Int, IsOn)
} 

*~LAlt::Send {Blind}{vk07}
*~RAlt::Send {Blind}{vk07}
LAlt up::
{
  if(A_PriorHotkey == "*~LAlt")
  {
    SetIME(0)
  }
  Return
}
RAlt up::
{
  if(A_PriorHotkey == "*~RAlt")
  {
    SetIME(1)
  }
  Return
}