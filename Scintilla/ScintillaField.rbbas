#tag Class
Class ScintillaField
Inherits RectControl
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Not RaiseEvent KeyDown(key) Then
		    Call SendMessage(SciHandle, SCI_BEGINUNDOACTION, Nil, Nil)
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  Call SendMessage(SciHandle, SCI_ENDUNDOACTION, Nil, Nil)
		  RaiseEvent KeyUp(key)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  SciHandle = CreateWindowEx(0, "Scintilla", "", WS_CHILD Or WS_CLIPCHILDREN Or WS_TABSTOP Or WS_VISIBLE, Me.Left, Me.Top, Me.Width, Me.Height, Me.Window.Handle, 0, 0, Nil)
		  pHandle = Me.Window.Handle
		  If SciHandle > 0 Then
		    Subclass(pHandle, Me)
		  End If
		  Call SendMessage(SciHandle, SCI_SETSAVEPOINT, Nil, Nil)
		  RaiseEvent Open()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AddMarker(Line As Integer, MarkerStyle As Scintilla.Markers) As Scintilla.Marker
		  Return New Scintilla.Marker(SendMessage(SciHandle, SCI_MARKERADD, Line, Integer(MarkerStyle)))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllMarkersForLine(LineNumber As Integer) As Integer
		  Return SendMessage(SciHandle, SCI_MARKERGET, LineNumber, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendText(Text As String)
		  Dim wparam As Integer = Text.LenB
		  Dim lparam As New MemoryBlock(Text.LenB * 2)
		  lparam.CString(0) = Text
		  Call SendMessage(SciHandle, SCI_APPENDTEXT, Ptr(wparam), lparam)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanRedo() As Boolean
		  Return SendMessage(SciHandle, SCI_CANREDO, Nil, Nil) = 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanUndo() As Boolean
		  Return SendMessage(SciHandle, SCI_CANUNDO, Nil, Nil) = 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CharAtPos(Position As Integer) As String
		  Dim char As Integer = SendMessage(SciHandle, SCI_GETCHARAT, Ptr(Position), Nil)
		  If char > 0 Then
		    Return Chr(char)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CharAtPos(Position As Integer, Assigns NewChar As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearAll()
		  Call SendMessage(SciHandle, SCI_CLEARALL, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearSelection(NewCaretPosition As Integer = - 1)
		  If NewCaretPosition <= -1 Then NewCaretPosition = 0
		  Call SendMessage(SciHandle, SCI_SETEMPTYSELECTION, Ptr(NewCaretPosition), Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  If Not Scintilla.IsAvailable Then
		    Raise New PlatformNotSupportedException
		  End If
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentLine() As Integer
		  Return SendMessage(SciHandle, SCI_GETCURLINE, Nil, Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Attributes( hidden ) Protected Shared Function DefWindowProc(HWND as Integer, msg as Integer, wParam as Ptr, lParam as Ptr) As Integer
		  #pragma X86CallingConvention StdCall
		  #If TargetWin32 Then
		    For Each wndclass As Dictionary In Subclasses
		      If wndclass.HasKey(HWND) Then
		        Dim subclass As ScintillaField = wndclass.Value(HWND)
		        If subclass <> Nil And subclass.WndProc(HWND, msg, wParam, lParam) Then
		          Return 1
		        End If
		      End
		    Next
		    Dim nextWndProc As Integer
		    nextWndProc = WndProcs.Lookup(HWND, INVALID_HANDLE_VALUE)
		    If nextWndProc <> INVALID_HANDLE_VALUE Then
		      Return CallWindowProc(nextWndProc, HWND, msg, wParam, lParam)
		    End If
		    Select Case msg
		    Case WM_CREATE, WM_NCCREATE
		      ' Windows sends these messages when the window is first created, but before this class is fully initialized.
		      ' We must return success else Windows will consider the creation to have failed.
		      Return 1
		    Else
		      #If DebugBuild Then
		        Break ' !!!
		      #endif
		    End Select
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  Call SendMessage(SciHandle, WM_DESTROY, Nil, Nil)
		  UnSubclass(pHandle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLine(Line As Integer) As String
		  Dim len As Integer = SendMessage(SciHandle, SCI_LINELENGTH, Line, 0)
		  Dim mb As New MemoryBlock(len + 1)
		  Call SendMessage(SciHandle, SCI_GETLINE, Ptr(Line), mb)
		  Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDirty() As Boolean
		  Return SendMessage(SciHandle, SCI_GETMODIFY, Nil, Nil) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsDirty(Assigns NewBool As Boolean)
		  Call SendMessage(SciHandle, SCI_SETSAVEPOINT, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineFromPosition(Position As Integer) As Integer
		  Return SendMessage(SciHandle, SCI_LINEFROMPOSITION, Ptr(Position), Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineHasMarker(LineNumber As Integer, MarkerNumber As Integer) As Boolean
		  Dim mb As New MemoryBlock(32)
		  mb.Int32Value(0) = Me.AllMarkersForLine(LineNumber)
		  Return (mb.Byte(MarkerNumber) = 1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MarginClickable(MarginNumber As Integer) As Boolean
		  Return SendMessage(SciHandle, SCI_GETMARGINSENSITIVEN, MarginNumber, 0) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MarginClickable(MarginNumber As Integer, Assigns NewBool As Boolean)
		  If NewBool Then
		    Call SendMessage(SciHandle, SCI_SETMARGINSENSITIVEN, MarginNumber, 1)
		  Else
		    Call SendMessage(SciHandle, SCI_SETMARGINSENSITIVEN, MarginNumber, 0)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MarginType(MarginNumber As Integer) As Integer
		  Return SendMessage(SciHandle, SCI_GETMARGINTYPEN, MarginNumber, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MarginType(MarginNumber As Integer, Assigns NewType As Integer)
		  Call SendMessage(SciHandle, SCI_SETMARGINTYPEN, MarginNumber, NewType)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MarginWidth(MarginNumber As Integer) As Integer
		  Return SendMessage(SciHandle, SCI_GETMARGINWIDTHN, MarginNumber, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MarginWidth(MarginNumber As Integer, Assigns NewWidth As Integer)
		  Call SendMessage(SciHandle, SCI_SETMARGINWIDTHN, MarginNumber, NewWidth)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PositionFromLine(Line As Integer) As Integer
		  Return SendMessage(SciHandle, SCI_POSITIONFROMLINE, Ptr(Line), Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PositionFromXY(X As Integer, Y As Integer) As Integer
		  Return SendMessage(SciHandle, SCI_POSITIONFROMPOINTCLOSE, X, Y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Redo() As Boolean
		  If CanRedo Then
		    Return SendMessage(SciHandle, SCI_REDO, Nil, Nil) = 0
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveMarker(Line As Integer, MarkerToRemove As Scintilla.Marker)
		  Call SendMessage(SciHandle, SCI_MARKERDELETE, Line, MarkerToRemove.MarkerNumber)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScintillaHWND() As Integer
		  Return SciHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollToLine(Line As Integer)
		  Call SendMessage(SciHandle, SCI_GOTOLINE, Line, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollToPosition(Position As Integer)
		  Call SendMessage(SciHandle, SCI_GOTOPOS, Position, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAll()
		  Call SendMessage(SciHandle, SCI_SELECTALL, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedText() As String
		  Dim sz As Integer = SendMessage(SciHandle, SCI_GETSELTEXT, 0, 0)
		  Dim mb As New MemoryBlock(sz + 1)
		  Call SendMessage(SciHandle, SCI_GETSELTEXT, Nil, mb)
		  Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectRange(Start As Integer, Stop As Integer)
		  ' Use SelectRange(-1, -1) to clear selection
		  Call SendMessage(SciHandle, SCI_SETSEL, Start, Stop)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRangeStyle(Start As Integer, Stop As Integer, Assigns NewStyle As Scintilla.Style)
		  If NewStyle.Owner <> SciHandle Then Raise New RuntimeException
		  
		  Call SendMessage(SciHandle, SCI_STARTSTYLING, Start, &h1F) ' start styling
		  Call SendMessage(SciHandle, SCI_SETSTYLING, Stop - Start, NewStyle.StyleNumber)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Style(StyleNumber As Integer) As Scintilla.Style
		  Return New Scintilla.Style(SciHandle, StyleNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StyleAtPosition(Position As Integer) As Scintilla.Style
		  Dim s As Integer = SendMessage(SciHandle, SCI_GETSTYLEAT, Position, 0)
		  Return New Scintilla.Style(SciHandle, s)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub Subclass(SuperWin As Integer, SubWin As ScintillaField)
		  #If TargetWin32 Then
		    If WndProcs.HasKey(SuperWin) Then
		      Dim d As New Dictionary
		      d.Value(SuperWin) = SubWin
		      Subclasses.Append(d)
		      Return
		    End
		    Dim windproc As Ptr = AddressOf DefWindowProc
		    Dim oldWndProc As Integer = SetWindowLong(SuperWin, GWL_WNDPROC, windproc)
		    WndProcs.Value(SuperWin) = oldWndProc
		    Dim d As New Dictionary
		    d.Value(SuperWin) = SubWin
		    Subclasses.Append(d)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Undo() As Boolean
		  If CanUndo Then
		    Return SendMessage(SciHandle, SCI_UNDO, Nil, Nil) = 0
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub UnSubclass(SuperWin As Integer)
		  #If TargetWin32 Then
		    If Not WndProcs.HasKey(SuperWin) Then Return
		    Dim oldWndProc As Ptr = WndProcs.Value(SuperWin)
		    Call SetWindowLong(SuperWin, GWL_WNDPROC, oldWndProc)
		    WndProcs.Remove(SuperWin)
		    Dim wndclass As Dictionary
		    For i As Integer = UBound(Subclasses) DownTo 0
		      wndclass = Subclasses(i)
		      If wndclass.HasKey(SuperWin) Then
		        Subclasses.Remove(i)
		      End
		    Next
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Attributes( hidden ) Protected Function WndProc(HWND as Integer, msg as Integer, wParam as Ptr, lParam as Ptr) As Boolean
		  #pragma Unused HWND
		  #pragma Unused wParam
		  
		  Select Case msg
		  Case WM_NOTIFY
		    Dim notification As SCNotification
		    Dim data As MemoryBlock = lParam
		    notification.StringValue(TargetLittleEndian) = data.StringValue(0, SCNotification.Size)
		    If notification.HWND = Me.SciHandle Then
		      Select Case notification.Code
		        
		      Case SCN_SAVEPOINTREACHED
		        
		        
		      Case SCN_MARGINCLICK
		        Dim l As Integer = LineFromPosition(notification.Position)
		        RaiseEvent MarginClicked(notification.Margin, l)
		        
		      Case SCN_MODIFIED, SCN_SAVEPOINTLEFT
		        RaiseEvent TextChanged()
		      Else
		        RaiseEvent ScintillaEvent(notification.Code)
		      End Select
		      'Return True
		    End If
		    
		  Case WM_SIZING
		    Dim r As Scintilla.RECT
		    Dim s As MemoryBlock = lParam
		    r.StringValue(TargetLittleEndian) = s.StringValue(0, 15)
		    Select Case Integer(wParam)
		    Case 6 'bottom
		      If Me.LockBottom Then
		        
		      End If
		    End Select
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XFromPosition(Position As Integer) As Integer
		  Return SendMessage(SciHandle, SCI_POINTXFROMPOSITION, 0, Position)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function YFromPosition(Position As Integer) As Integer
		  Return SendMessage(SciHandle, SCI_POINTYFROMPOSITION, 0, Position)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event KeyDown(key As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyUp(key As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MarginClicked(MarginNumber As Integer, LineNumber As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Resized()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Resizing()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ScintillaEvent(EventCode As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChanged()
	#tag EndHook


	#tag Note, Name = Event codes
		INVALID_POSITION -1
		SCI_START 2000
		SCI_OPTIONAL_START 3000
		SCI_LEXER_START 4000
		SCI_ADDTEXT 2001
		SCI_ADDSTYLEDTEXT 2002
		SCI_INSERTTEXT 2003
		SCI_CLEARALL 2004
		SCI_CLEARDOCUMENTSTYLE 2005
		SCI_GETLENGTH 2006
		SCI_GETCHARAT 2007
		SCI_GETCURRENTPOS 2008
		SCI_GETANCHOR 2009
		SCI_GETSTYLEAT 2010
		SCI_REDO 2011
		SCI_SETUNDOCOLLECTION 2012
		SCI_SELECTALL 2013
		SCI_SETSAVEPOINT 2014
		SCI_GETSTYLEDTEXT 2015
		SCI_CANREDO 2016
		SCI_MARKERLINEFROSciHandle 2017
		SCI_MARKERDELETEHANDLE 2018
		SCI_GETUNDOCOLLECTION 2019
		SCWS_INVISIBLE 0
		SCWS_VISIBLEALWAYS 1
		SCWS_VISIBLEAFTERINDENT 2
		SCI_GETVIEWWS 2020
		SCI_SETVIEWWS 2021
		SCI_POSITIONFROMPOINT 2022
		SCI_POSITIONFROMPOINTCLOSE 2023
		SCI_GOTOLINE 2024
		SCI_GOTOPOS 2025
		SCI_SETANCHOR 2026
		SCI_GETCURLINE 2027
		SCI_GETENDSTYLED 2028
		SC_EOL_CRLF 0
		SC_EOL_CR 1
		SC_EOL_LF 2
		SCI_CONVERTEOLS 2029
		SCI_GETEOLMODE 2030
		SCI_SETEOLMODE 2031
		SCI_STARTSTYLING 2032
		SCI_SETSTYLING 2033
		SCI_GETBUFFEREDDRAW 2034
		SCI_SETBUFFEREDDRAW 2035
		SCI_SETTABWIDTH 2036
		SCI_GETTABWIDTH 2121
		SC_CP_UTF8 65001
		SC_CP_DBCS 1
		SCI_SETCODEPAGE 2037
		SCI_SETUSEPALETTE 2039
		MARKER_MAX 31
		SC_MARK_CIRCLE 0
		SC_MARK_ROUNDRECT 1
		SC_MARK_ARROW 2
		SC_MARK_SMALLRECT 3
		SC_MARK_SHORTARROW 4
		SC_MARK_EMPTY 5
		SC_MARK_ARROWDOWN 6
		SC_MARK_MINUS 7
		SC_MARK_PLUS 8
		SC_MARK_VLINE 9
		SC_MARK_LCORNER 10
		SC_MARK_TCORNER 11
		SC_MARK_BOXPLUS 12
		SC_MARK_BOXPLUSCONNECTED 13
		SC_MARK_BOXMINUS 14
		SC_MARK_BOXMINUSCONNECTED 15
		SC_MARK_LCORNERCURVE 16
		SC_MARK_TCORNERCURVE 17
		SC_MARK_CIRCLEPLUS 18
		SC_MARK_CIRCLEPLUSCONNECTED 19
		SC_MARK_CIRCLEMINUS 20
		SC_MARK_CIRCLEMINUSCONNECTED 21
		SC_MARK_BACKGROUND 22
		SC_MARK_DOTDOTDOT 23
		SC_MARK_ARROWS 24
		SC_MARK_PIXMAP 25
		SC_MARK_CHARACTER 10000
		SC_MARKNUM_FOLDEREND 25
		SC_MARKNUM_FOLDEROPENMID 26
		SC_MARKNUM_FOLDERMIDTAIL 27
		SC_MARKNUM_FOLDERTAIL 28
		SC_MARKNUM_FOLDERSUB 29
		SC_MARKNUM_FOLDER 30
		SC_MARKNUM_FOLDEROPEN 31
		SC_MASK_FOLDERS 0xFE000000
		SCI_MARKERDEFINE 2040
		SCI_MARKERSETFORE 2041
		SCI_MARKERSETBACK 2042
		SCI_MARKERADD 2043
		SCI_MARKERDELETE 2044
		SCI_MARKERDELETEALL 2045
		SCI_MARKERGET 2046
		SCI_MARKERNEXT 2047
		SCI_MARKERPREVIOUS 2048
		SCI_MARKERDEFINEPIXMAP 2049
		SC_MARGIN_SYMBOL 0
		SC_MARGIN_NUMBER 1
		SCI_SETMARGINTYPEN 2240
		SCI_GETMARGINTYPEN 2241
		SCI_SETMARGINWIDTHN 2242
		SCI_GETMARGINWIDTHN 2243
		SCI_SETMARGINMASKN 2244
		SCI_GETMARGINMASKN 2245
		SCI_SETMARGINSENSITIVEN 2246
		SCI_GETMARGINSENSITIVEN 2247
		STYLE_DEFAULT 32
		STYLE_LINENUMBER 33
		STYLE_BRACELIGHT 34
		STYLE_BRACEBAD 35
		STYLE_CONTROLCHAR 36
		STYLE_INDENTGUIDE 37
		STYLE_LASTPREDEFINED 39
		STYLE_MAX 127
		SC_CHARSET_ANSI 0
		SC_CHARSET_DEFAULT 1
		SC_CHARSET_BALTIC 186
		SC_CHARSET_CHINESEBIG5 136
		SC_CHARSET_EASTEUROPE 238
		SC_CHARSET_GB2312 134
		SC_CHARSET_GREEK 161
		SC_CHARSET_HANGUL 129
		SC_CHARSET_MAC 77
		SC_CHARSET_OEM 255
		SC_CHARSET_RUSSIAN 204
		SC_CHARSET_SHIFTJIS 128
		SC_CHARSET_SYMBOL 2
		SC_CHARSET_TURKISH 162
		SC_CHARSET_JOHAB 130
		SC_CHARSET_HEBREW 177
		SC_CHARSET_ARABIC 178
		SC_CHARSET_VIETNAMESE 163
		SC_CHARSET_THAI 222
		SCI_STYLECLEARALL 2050
		SCI_STYLESETFORE 2051
		SCI_STYLESETBACK 2052
		SCI_STYLESETBOLD 2053
		SCI_STYLESETITALIC 2054
		SCI_STYLESETSIZE 2055
		SCI_STYLESETFONT 2056
		SCI_STYLESETEOLFILLED 2057
		SCI_STYLERESETDEFAULT 2058
		SCI_STYLESETUNDERLINE 2059
		SC_CASE_MIXED 0
		SC_CASE_UPPER 1
		SC_CASE_LOWER 2
		SCI_STYLESETCASE 2060
		SCI_STYLESETCHARACTERSET 2066
		SCI_STYLESETHOTSPOT 2409
		SCI_SETSELFORE 2067
		SCI_SETSELBACK 2068
		SCI_SETCARETFORE 2069
		SCI_ASSIGNCMDKEY 2070
		SCI_CLEARCMDKEY 2071
		SCI_CLEARALLCMDKEYS 2072
		SCI_SETSTYLINGEX 2073
		SCI_STYLESETVISIBLE 2074
		SCI_GETCARETPERIOD 2075
		SCI_SETCARETPERIOD 2076
		SCI_SETWORDCHARS 2077
		SCI_BEGINUNDOACTION 2078
		SCI_ENDUNDOACTION 2079
		INDIC_MAX 7
		INDIC_PLAIN 0
		INDIC_SQUIGGLE 1
		INDIC_TT 2
		INDIC_DIAGONAL 3
		INDIC_STRIKE 4
		INDIC_HIDDEN 5
		INDIC_BOX 6
		INDIC0_MASK 0x20
		INDIC1_MASK 0x40
		INDIC2_MASK 0x80
		INDICS_MASK 0xE0
		SCI_INDICSETSTYLE 2080
		SCI_INDICGETSTYLE 2081
		SCI_INDICSETFORE 2082
		SCI_INDICGETFORE 2083
		SCI_SETWHITESPACEFORE 2084
		SCI_SETWHITESPACEBACK 2085
		SCI_SETSTYLEBITS 2090
		SCI_GETSTYLEBITS 2091
		SCI_SETLINESTATE 2092
		SCI_GETLINESTATE 2093
		SCI_GETMAXLINESTATE 2094
		SCI_GETCARETLINEVISIBLE 2095
		SCI_SETCARETLINEVISIBLE 2096
		SCI_GETCARETLINEBACK 2097
		SCI_SETCARETLINEBACK 2098
		SCI_STYLESETCHANGEABLE 2099
		SCI_AUTOCSHOW 2100
		SCI_AUTOCCANCEL 2101
		SCI_AUTOCACTIVE 2102
		SCI_AUTOCPOSSTART 2103
		SCI_AUTOCCOMPLETE 2104
		SCI_AUTOCSTOPS 2105
		SCI_AUTOCSETSEPARATOR 2106
		SCI_AUTOCGETSEPARATOR 2107
		SCI_AUTOCSELECT 2108
		SCI_AUTOCSETCANCELATSTART 2110
		SCI_AUTOCGETCANCELATSTART 2111
		SCI_AUTOCSETFILLUPS 2112
		SCI_AUTOCSETCHOOSESINGLE 2113
		SCI_AUTOCGETCHOOSESINGLE 2114
		SCI_AUTOCSETIGNORECASE 2115
		SCI_AUTOCGETIGNORECASE 2116
		SCI_USERLISTSHOW 2117
		SCI_AUTOCSETAUTOHIDE 2118
		SCI_AUTOCGETAUTOHIDE 2119
		SCI_AUTOCSETDROPRESTOFWORD 2270
		SCI_AUTOCGETDROPRESTOFWORD 2271
		SCI_REGISTERIMAGE 2405
		SCI_CLEARREGISTEREDIMAGES 2408
		SCI_AUTOCGETTYPESEPARATOR 2285
		SCI_AUTOCSETTYPESEPARATOR 2286
		SCI_SETINDENT 2122
		SCI_GETINDENT 2123
		SCI_SETUSETABS 2124
		SCI_GETUSETABS 2125
		SCI_SETLINEINDENTATION 2126
		SCI_GETLINEINDENTATION 2127
		SCI_GETLINEINDENTPOSITION 2128
		SCI_GETCOLUMN 2129
		SCI_SETHSCROLLBAR 2130
		SCI_GETHSCROLLBAR 2131
		SCI_SETINDENTATIONGUIDES 2132
		SCI_GETINDENTATIONGUIDES 2133
		SCI_SETHIGHLIGHTGUIDE 2134
		SCI_GETHIGHLIGHTGUIDE 2135
		SCI_GETLINEENDPOSITION 2136
		SCI_GETCODEPAGE 2137
		SCI_GETCARETFORE 2138
		SCI_GETUSEPALETTE 2139
		SCI_GETREADONLY 2140
		SCI_SETCURRENTPOS 2141
		SCI_SETSELECTIONSTART 2142
		SCI_GETSELECTIONSTART 2143
		SCI_SETSELECTIONEND 2144
		SCI_GETSELECTIONEND 2145
		SCI_SETPRINTMAGNIFICATION 2146
		SCI_GETPRINTMAGNIFICATION 2147
		SC_PRINT_NORMAL 0
		SC_PRINT_INVERTLIGHT 1
		SC_PRINT_BLACKONWHITE 2
		SC_PRINT_COLOURONWHITE 3
		SC_PRINT_COLOURONWHITEDEFAULTBG 4
		SCI_SETPRINTCOLOURMODE 2148
		SCI_GETPRINTCOLOURMODE 2149
		SCFIND_WHOLEWORD 2
		SCFIND_MATCHCASE 4
		SCFIND_WORDSTART 0x00100000
		SCFIND_REGEXP 0x00200000
		SCFIND_POSIX 0x00400000
		SCI_FINDTEXT 2150
		SCI_FORMATRANGE 2151
		SCI_GETFIRSTVISIBLELINE 2152
		SCI_GETLINE 2153
		SCI_GETLINECOUNT 2154
		SCI_SETMARGINLEFT 2155
		SCI_GETMARGINLEFT 2156
		SCI_SETMARGINRIGHT 2157
		SCI_GETMARGINRIGHT 2158
		SCI_GETMODIFY 2159
		SCI_SETSEL 2160
		SCI_GETSELTEXT 2161
		SCI_GETTEXTRANGE 2162
		SCI_HIDESELECTION 2163
		SCI_POINTXFROMPOSITION 2164
		SCI_POINTYFROMPOSITION 2165
		SCI_LINEFROMPOSITION 2166
		SCI_POSITIONFROMLINE 2167
		SCI_LINESCROLL 2168
		SCI_SCROLLCARET 2169
		SCI_REPLACESEL 2170
		SCI_SETREADONLY 2171
		SCI_NULL 2172
		SCI_CANPASTE 2173
		SCI_CANUNDO 2174
		SCI_EMPTYUNDOBUFFER 2175
		SCI_UNDO 2176
		SCI_CUT 2177
		SCI_COPY 2178
		SCI_PASTE 2179
		SCI_CLEAR 2180
		SCI_SETTEXT 2181
		SCI_GETTEXT 2182
		SCI_GETTEXTLENGTH 2183
		SCI_GETDIRECTFUNCTION 2184
		SCI_GETDIRECTPOINTER 2185
		SCI_SETOVERTYPE 2186
		SCI_GETOVERTYPE 2187
		SCI_SETCARETWIDTH 2188
		SCI_GETCARETWIDTH 2189
		SCI_SETTARGETSTART 2190
		SCI_GETTARGETSTART 2191
		SCI_SETTARGETEND 2192
		SCI_GETTARGETEND 2193
		SCI_REPLACETARGET 2194
		SCI_REPLACETARGETRE 2195
		SCI_SEARCHINTARGET 2197
		SCI_SETSEARCHFLAGS 2198
		SCI_GETSEARCHFLAGS 2199
		SCI_CALLTIPSHOW 2200
		SCI_CALLTIPCANCEL 2201
		SCI_CALLTIPACTIVE 2202
		SCI_CALLTIPPOSSTART 2203
		SCI_CALLTIPSETHLT 2204
		SCI_CALLTIPSETBACK 2205
		SCI_CALLTIPSETFORE 2206
		SCI_CALLTIPSETFOREHLT 2207
		SCI_VISIBLEFROMDOCLINE 2220
		SCI_DOCLINEFROMVISIBLE 2221
		SC_FOLDLEVELBASE 0x400
		SC_FOLDLEVELWHITEFLAG 0x1000
		SC_FOLDLEVELHEADERFLAG 0x2000
		SC_FOLDLEVELBOXHEADERFLAG 0x4000
		SC_FOLDLEVELBOXFOOTERFLAG 0x8000
		SC_FOLDLEVELCONTRACTED 0x10000
		SC_FOLDLEVELUNINDENT 0x20000
		SC_FOLDLEVELNUMBERMASK 0x0FFF
		SCI_SETFOLDLEVEL 2222
		SCI_GETFOLDLEVEL 2223
		SCI_GETLASTCHILD 2224
		SCI_GETFOLDPARENT 2225
		SCI_SHOWLINES 2226
		SCI_HIDELINES 2227
		SCI_GETLINEVISIBLE 2228
		SCI_SETFOLDEXPANDED 2229
		SCI_GETFOLDEXPANDED 2230
		SCI_TOGGLEFOLD 2231
		SCI_ENSUREVISIBLE 2232
		SC_FOLDFLAG_LINEBEFORE_EXPANDED 0x0002
		SC_FOLDFLAG_LINEBEFORE_CONTRACTED 0x0004
		SC_FOLDFLAG_LINEAFTER_EXPANDED 0x0008
		SC_FOLDFLAG_LINEAFTER_CONTRACTED 0x0010
		SC_FOLDFLAG_LEVELNUMBERS 0x0040
		SC_FOLDFLAG_BOX 0x0001
		SCI_SETFOLDFLAGS 2233
		SCI_ENSUREVISIBLEENFORCEPOLICY 2234
		SCI_SETTABINDENTS 2260
		SCI_GETTABINDENTS 2261
		SCI_SETBACKSPACEUNINDENTS 2262
		SCI_GETBACKSPACEUNINDENTS 2263
		SC_TIME_FOREVER 10000000
		SCI_SETMOUSEDWELLTIME 2264
		SCI_GETMOUSEDWELLTIME 2265
		SCI_WORDSTARTPOSITION 2266
		SCI_WORDENDPOSITION 2267
		SC_WRAP_NONE 0
		SC_WRAP_WORD 1
		SCI_SETWRAPMODE 2268
		SCI_GETWRAPMODE 2269
		SC_CACHE_NONE 0
		SC_CACHE_CARET 1
		SC_CACHE_PAGE 2
		SC_CACHE_DOCUMENT 3
		SCI_SETLAYOUTCACHE 2272
		SCI_GETLAYOUTCACHE 2273
		SCI_SETSCROLLWIDTH 2274
		SCI_GETSCROLLWIDTH 2275
		SCI_TEXTWIDTH 2276
		SCI_SETENDATLASTLINE 2277
		SCI_GETENDATLASTLINE 2278
		SCI_TEXTHEIGHT 2279
		SCI_SETVSCROLLBAR 2280
		SCI_GETVSCROLLBAR 2281
		SCI_APPENDTEXT 2282
		SCI_GETTWOPHASEDRAW 2283
		SCI_SETTWOPHASEDRAW 2284
		SCI_TARGETFROMSELECTION 2287
		SCI_LINESJOIN 2288
		SCI_LINESSPLIT 2289
		SCI_SETFOLDMARGINCOLOUR 2290
		SCI_SETFOLDMARGINHICOLOUR 2291
		SCI_LINEDOWN 2300
		SCI_LINEDOWNEXTEND 2301
		SCI_LINEUP 2302
		SCI_LINEUPEXTEND 2303
		SCI_CHARLEFT 2304
		SCI_CHARLEFTEXTEND 2305
		SCI_CHARRIGHT 2306
		SCI_CHARRIGHTEXTEND 2307
		SCI_WORDLEFT 2308
		SCI_WORDLEFTEXTEND 2309
		SCI_WORDRIGHT 2310
		SCI_WORDRIGHTEXTEND 2311
		SCI_HOME 2312
		SCI_HOMEEXTEND 2313
		SCI_LINEEND 2314
		SCI_LINEENDEXTEND 2315
		SCI_DOCUMENTSTART 2316
		SCI_DOCUMENTSTARTEXTEND 2317
		SCI_DOCUMENTEND 2318
		SCI_DOCUMENTENDEXTEND 2319
		SCI_PAGEUP 2320
		SCI_PAGEUPEXTEND 2321
		SCI_PAGEDOWN 2322
		SCI_PAGEDOWNEXTEND 2323
		SCI_EDITTOGGLEOVERTYPE 2324
		SCI_CANCEL 2325
		SCI_DELETEBACK 2326
		SCI_TAB 2327
		SCI_BACKTAB 2328
		SCI_NEWLINE 2329
		SCI_FORMFEED 2330
		SCI_VCHOME 2331
		SCI_VCHOMEEXTEND 2332
		SCI_ZOOMIN 2333
		SCI_ZOOMOUT 2334
		SCI_DELWORDLEFT 2335
		SCI_DELWORDRIGHT 2336
		SCI_LINECUT 2337
		SCI_LINEDELETE 2338
		SCI_LINETRANSPOSE 2339
		SCI_LINEDUPLICATE 2404
		SCI_LOWERCASE 2340
		SCI_UPPERCASE 2341
		SCI_LINESCROLLDOWN 2342
		SCI_LINESCROLLUP 2343
		SCI_DELETEBACKNOTLINE 2344
		SCI_HOMEDISPLAY 2345
		SCI_HOMEDISPLAYEXTEND 2346
		SCI_LINEENDDISPLAY 2347
		SCI_LINEENDDISPLAYEXTEND 2348
		SCI_HOMEWRAP 2349
		SCI_HOMEWRAPEXTEND 2450
		SCI_LINEENDWRAP 2451
		SCI_LINEENDWRAPEXTEND 2452
		SCI_VCHOMEWRAP 2453
		SCI_VCHOMEWRAPEXTEND 2454
		SCI_LINECOPY 2455
		SCI_MOVECARETINSIDEVIEW 2401
		SCI_LINELENGTH 2350
		SCI_BRACEHIGHLIGHT 2351
		SCI_BRACEBADLIGHT 2352
		SCI_BRACEMATCH 2353
		SCI_GETVIEWEOL 2355
		SCI_SETVIEWEOL 2356
		SCI_GETDOCPOINTER 2357
		SCI_SETDOCPOINTER 2358
		SCI_SETMODEVENTMASK 2359
		EDGE_NONE 0
		EDGE_LINE 1
		EDGE_BACKGROUND 2
		SCI_GETEDGECOLUMN 2360
		SCI_SETEDGECOLUMN 2361
		SCI_GETEDGEMODE 2362
		SCI_SETEDGEMODE 2363
		SCI_GETEDGECOLOUR 2364
		SCI_SETEDGECOLOUR 2365
		SCI_SEARCHANCHOR 2366
		SCI_SEARCHNEXT 2367
		SCI_SEARCHPREV 2368
		SCI_LINESONSCREEN 2370
		SCI_USEPOPUP 2371
		SCI_SELECTIONISRECTANGLE 2372
		SCI_SETZOOM 2373
		SCI_GETZOOM 2374
		SCI_CREATEDOCUMENT 2375
		SCI_ADDREFDOCUMENT 2376
		SCI_RELEASEDOCUMENT 2377
		SCI_GETMODEVENTMASK 2378
		SCI_SETFOCUS 2380
		SCI_GETFOCUS 2381
		SCI_SETSTATUS 2382
		SCI_GETSTATUS 2383
		SCI_SETMOUSEDOWNCAPTURES 2384
		SCI_GETMOUSEDOWNCAPTURES 2385
		SC_CURSORNORMAL -1
		SC_CURSORWAIT 4
		SCI_SETCURSOR 2386
		SCI_GETCURSOR 2387
		SCI_SETCONTROLCHARSYMBOL 2388
		SCI_GETCONTROLCHARSYMBOL 2389
		SCI_WORDPARTLEFT 2390
		SCI_WORDPARTLEFTEXTEND 2391
		SCI_WORDPARTRIGHT 2392
		SCI_WORDPARTRIGHTEXTEND 2393
		VISIBLE_SLOP 0x01
		VISIBLE_STRICT 0x04
		SCI_SETVISIBLEPOLICY 2394
		SCI_DELLINELEFT 2395
		SCI_DELLINERIGHT 2396
		SCI_SETXOFFSET 2397
		SCI_GETXOFFSET 2398
		SCI_CHOOSECARETX 2399
		SCI_GRABFOCUS 2400
		CARET_SLOP 0x01
		CARET_STRICT 0x04
		CARET_JUMPS 0x10
		CARET_EVEN 0x08
		SCI_SETXCARETPOLICY 2402
		SCI_SETYCARETPOLICY 2403
		SCI_SETPRINTWRAPMODE 2406
		SCI_GETPRINTWRAPMODE 2407
		SCI_SETHOTSPOTACTIVEFORE 2410
		SCI_SETHOTSPOTACTIVEBACK 2411
		SCI_SETHOTSPOTACTIVEUNDERLINE 2412
		SCI_SETHOTSPOTSINGLELINE 2421
		SCI_PARADOWN 2413
		SCI_PARADOWNEXTEND 2414
		SCI_PARAUP 2415
		SCI_PARAUPEXTEND 2416
		SCI_POSITIONBEFORE 2417
		SCI_POSITIONAFTER 2418
		SCI_COPYRANGE 2419
		SCI_COPYTEXT 2420
		SC_SEL_STREAM 0
		SC_SEL_RECTANGLE 1
		SC_SEL_LINES 2
		SCI_SETSELECTIONMODE 2422
		SCI_GETSELECTIONMODE 2423
		SCI_GETLINESELSTARTPOSITION 2424
		SCI_GETLINESELENDPOSITION 2425
		SCI_LINEDOWNRECTEXTEND 2426
		SCI_LINEUPRECTEXTEND 2427
		SCI_CHARLEFTRECTEXTEND 2428
		SCI_CHARRIGHTRECTEXTEND 2429
		SCI_HOMERECTEXTEND 2430
		SCI_VCHOMERECTEXTEND 2431
		SCI_LINEENDRECTEXTEND 2432
		SCI_PAGEUPRECTEXTEND 2433
		SCI_PAGEDOWNRECTEXTEND 2434
		SCI_STUTTEREDPAGEUP 2435
		SCI_STUTTEREDPAGEUPEXTEND 2436
		SCI_STUTTEREDPAGEDOWN 2437
		SCI_STUTTEREDPAGEDOWNEXTEND 2438
		SCI_WORDLEFTEND 2439
		SCI_WORDLEFTENDEXTEND 2440
		SCI_WORDRIGHTEND 2441
		SCI_WORDRIGHTENDEXTEND 2442
		SCI_SETWHITESPACECHARS 2443
		SCI_SETCHARSDEFAULT 2444
		SCI_AUTOCGETCURRENT 2445
		SCI_ALLOCATE 2446
		SCI_STARTRECORD 3001
		SCI_STOPRECORD 3002
		SCI_SETLEXER 4001
		SCI_GETLEXER 4002
		SCI_COLOURISE 4003
		SCI_SETPROPERTY 4004
		KEYWORDSET_MAX 8
		SCI_SETKEYWORDS 4005
		SCI_SETLEXERLANGUAGE 4006
		SCI_LOADLEXERLIBRARY 4007
		SC_MOD_INSERTTEXT 0x1
		SC_MOD_DELETETEXT 0x2
		SC_MOD_CHANGESTYLE 0x4
		SC_MOD_CHANGEFOLD 0x8
		SC_PERFORMED_USER 0x10
		SC_PERFORMED_UNDO 0x20
		SC_PERFORMED_REDO 0x40
		SC_LASTSTEPINUNDOREDO 0x100
		SC_MOD_CHANGEMARKER 0x200
		SC_MOD_BEFOREINSERT 0x400
		SC_MOD_BEFOREDELETE 0x800
		SC_MODEVENTMASKALL 0xF77
		SCEN_CHANGE 768
		SCEN_SETFOCUS 512
		SCEN_KILLFOCUS 256
		SCK_DOWN 300
		SCK_UP 301
		SCK_LEFT 302
		SCK_RIGHT 303
		SCK_HOME 304
		SCK_END 305
		SCK_PRIOR 306
		SCK_NEXT 307
		SCK_DELETE 308
		SCK_INSERT 309
		SCK_ESCAPE 7
		SCK_BACK 8
		SCK_TAB 9
		SCK_RETURN 13
		SCK_ADD 310
		SCK_SUBTRACT 311
		SCK_DIVIDE 312
		SCMOD_SHIFT 1
		SCMOD_CTRL 2
		SCMOD_ALT 4
		SCN_STYLENEEDED 2000
		SCN_CHARADDED 2001
		SCN_SAVEPOINTREACHED 2002
		SCN_SAVEPOINTLEFT 2003
		SCN_MODIFYATTEMPTRO 2004
		SCN_KEY 2005
		SCN_DOUBLECLICK 2006
		SCN_UPDATEUI 2007
		SCN_MODIFIED 2008
		SCN_MACRORECORD 2009
		SCN_MARGINCLICK 2010
		SCN_NEEDSHOWN 2011
		SCN_PAINTED 2013
		SCN_USERLISTSELECTION 2014
		SCN_URIDROPPED 2015
		SCN_DWELLSTART 2016
		SCN_DWELLEND 2017
		SCN_ZOOM 2018
		SCN_HOTSPOTCLICK 2019
		SCN_HOTSPOTDOUBLECLICK 2020
		SCN_CALLTIPCLICK 2021
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SendMessage(SciHandle, SCI_GETCURRENTPOS, Nil, Nil)
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim wparam As New MemoryBlock(4)
			  wparam.Int32Value(0) = value
			  Call SendMessage(SciHandle, SCI_SETCURRENTPOS, wparam, Nil)
			  
			  
			End Set
		#tag EndSetter
		CaretPosition As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim m As Integer = SendMessage(SciHandle, SCI_GETEOLMODE, Nil, Nil)
			  Select Case m
			  Case 0
			    Return EndOfLine.Windows
			  Case 1
			    Return EndOfLine.Macintosh
			  Case 2
			    Return EndOfLine.UNIX
			  Else
			    Raise New UnsupportedFormatException
			  End Select
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim m As Integer
			  Select Case value
			  Case EndOfLine.Windows
			    m = SendMessage(SciHandle, SCI_SETEOLMODE, 0, 0)
			  Case EndOfLine.Macintosh
			    m = SendMessage(SciHandle, SCI_SETEOLMODE, 1, 0)
			  Case EndOfLine.UNIX
			    m = SendMessage(SciHandle, SCI_SETEOLMODE, 2, 0)
			  Else
			    Raise New UnsupportedFormatException
			  End Select
			End Set
		#tag EndSetter
		EOL As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SendMessage(SciHandle, SCI_GETVIEWEOL, Nil, Nil) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SendMessage(SciHandle, SCI_SETVIEWEOL, 1, 0)
			  Else
			    Call SendMessage(SciHandle, SCI_SETVIEWEOL, 0, 0)
			  End If
			End Set
		#tag EndSetter
		EOLVisible As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  'Return SendMessage(SciHandle, SCI_GETCURRENTPOS, Nil, Nil)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim wparam As New MemoryBlock(4)
			  wparam.Int32Value(0) = Integer(value)
			  Call SendMessage(SciHandle, SCI_SETLEXER, wparam, Nil)
			  
			  
			End Set
		#tag EndSetter
		Lexer As Scintilla.Lexers
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared mWndProcs As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pHandle As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SendMessage(SciHandle, SCI_GETREADONLY, Nil, Nil) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SendMessage(SciHandle, SCI_SETREADONLY, 1, 0)
			  Else
			    Call SendMessage(SciHandle, SCI_SETREADONLY, 0, 0)
			  End If
			End Set
		#tag EndSetter
		ReadOnly As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private SciHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Subclasses() As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim len As Integer = SendMessage(SciHandle, SCI_GETLENGTH, Nil, Nil)
			  Dim mb As New MemoryBlock(len * 2)
			  len = SendMessage(SciHandle, SCI_GETTEXT, Ptr(mb.Size), mb)
			  Dim ret As String = mb.CString(0)
			  Return ret
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim lparam As New MemoryBlock(value.LenB * 2)
			  lparam.CString(0) = value
			  Call SendMessage(SciHandle, SCI_SETTEXT, Nil, lparam)
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SendMessage(SciHandle, SCI_GETFIRSTVISIBLELINE, Nil, Nil)
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim wparam As New MemoryBlock(4)
			  wparam.Int32Value(0) = value
			  Call SendMessage(SciHandle, SCI_SETFIRSTVISIBLELINE, wparam, Nil)
			  
			  
			End Set
		#tag EndSetter
		TopLine As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mWndProcs = Nil Then mWndProcs = New Dictionary
			  return mWndProcs
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWndProcs = value
			End Set
		#tag EndSetter
		Protected Shared WndProcs As Dictionary
	#tag EndComputedProperty


	#tag Constant, Name = SCI_APPENDTEXT, Type = Double, Dynamic = False, Default = \"2282", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_BEGINUNDOACTION, Type = Double, Dynamic = False, Default = \"2078", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_CANREDO, Type = Double, Dynamic = False, Default = \"2016", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_CANUNDO, Type = Double, Dynamic = False, Default = \"2174", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_CLEARALL, Type = Double, Dynamic = False, Default = \"2004", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_ENDUNDOACTION, Type = Double, Dynamic = False, Default = \"2079", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETCHARAT, Type = Double, Dynamic = False, Default = \"2007", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETCURLINE, Type = Double, Dynamic = False, Default = \"2027", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETCURRENTPOS, Type = Double, Dynamic = False, Default = \"2008", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETEOLMODE, Type = Double, Dynamic = False, Default = \"2030", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETFIRSTVISIBLELINE, Type = Double, Dynamic = False, Default = \"2152", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETLENGTH, Type = Double, Dynamic = False, Default = \"2006", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETLEXER, Type = Double, Dynamic = False, Default = \"4002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETLINE, Type = Double, Dynamic = False, Default = \"2153", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETMARGINSENSITIVEN, Type = Double, Dynamic = False, Default = \"2247", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETMARGINTYPEN, Type = Double, Dynamic = False, Default = \"2241", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETMARGINWIDTHN, Type = Double, Dynamic = False, Default = \"2243", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETMODIFY, Type = Double, Dynamic = False, Default = \"2159", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETREADONLY, Type = Double, Dynamic = False, Default = \"2140", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETSELTEXT, Type = Double, Dynamic = False, Default = \"2161", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETSTYLEAT, Type = Double, Dynamic = False, Default = \"2010", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETTEXT, Type = Double, Dynamic = False, Default = \"2182", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETVIEWEOL, Type = Double, Dynamic = False, Default = \"2355", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GOTOLINE, Type = Double, Dynamic = False, Default = \"2024", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GOTOPOS, Type = Double, Dynamic = False, Default = \"2025", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_LINEFROMPOSITION, Type = Double, Dynamic = False, Default = \"2166", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_LINELENGTH, Type = Double, Dynamic = False, Default = \"2350", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_MARKERADD, Type = Double, Dynamic = False, Default = \"2043", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_MARKERDELETE, Type = Double, Dynamic = False, Default = \"2044", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_MARKERGET, Type = Double, Dynamic = False, Default = \"2046", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_POINTXFROMPOSITION, Type = Double, Dynamic = False, Default = \"2164", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_POINTYFROMPOSITION, Type = Double, Dynamic = False, Default = \"2165", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_POSITIONFROMLINE, Type = Double, Dynamic = False, Default = \"2167", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_POSITIONFROMPOINTCLOSE, Type = Double, Dynamic = False, Default = \"2023", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_REDO, Type = Double, Dynamic = False, Default = \"2011", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SELECTALL, Type = Double, Dynamic = False, Default = \"2013", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETCURRENTPOS, Type = Double, Dynamic = False, Default = \"2041", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETEMPTYSELECTION, Type = Double, Dynamic = False, Default = \"2147", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETEOLMODE, Type = Double, Dynamic = False, Default = \"2031", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETFIRSTVISIBLELINE, Type = Double, Dynamic = False, Default = \"2613", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETLEXER, Type = Double, Dynamic = False, Default = \"4001", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETMARGINSENSITIVEN, Type = Double, Dynamic = False, Default = \"2246", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETMARGINTYPEN, Type = Double, Dynamic = False, Default = \"2340", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETMARGINWIDTHN, Type = Double, Dynamic = False, Default = \"2242", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETREADONLY, Type = Double, Dynamic = False, Default = \"2171", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETSAVEPOINT, Type = Double, Dynamic = False, Default = \"2014", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETSEL, Type = Double, Dynamic = False, Default = \"2160", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETSTYLING, Type = Double, Dynamic = False, Default = \"2033", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETTEXT, Type = Double, Dynamic = False, Default = \"2181", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETVIEWEOL, Type = Double, Dynamic = False, Default = \"2356", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_STARTSTYLING, Type = Double, Dynamic = False, Default = \"2032", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_UNDO, Type = Double, Dynamic = False, Default = \"2176", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCN_MARGINCLICK, Type = Double, Dynamic = False, Default = \"2010", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCN_MODIFIED, Type = Double, Dynamic = False, Default = \"2008", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCN_SAVEPOINTLEFT, Type = Double, Dynamic = False, Default = \"2003", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCN_SAVEPOINTREACHED, Type = Double, Dynamic = False, Default = \"2002", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaretPosition"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EOL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EOLVisible"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Position"
			Type="String"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TopLine"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="RectControl"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
