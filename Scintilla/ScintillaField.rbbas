#tag Class
Class ScintillaField
Inherits RectControl
	#tag Event
		Sub Close()
		  UnSubclass(ParentHandle)
		  UnSubclass(SciRef)
		  RaiseEvent Close()
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  ' RealStudio does not raise this event.
		  #pragma Unused base
		  #pragma Unused x
		  #pragma Unused y
		  Break
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  ' RealStudio does not raise this event.
		  #pragma Unused hitItem
		  Break
		End Function
	#tag EndEvent

	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  ' RealStudio does not raise this event.
		  #pragma Unused obj
		  #pragma Unused action
		  Break
		End Function
	#tag EndEvent

	#tag Event
		Sub DragExit(obj As DragItem, action As Integer)
		  ' RealStudio does not raise this event.
		  #pragma Unused obj
		  #pragma Unused action
		  Break
		End Sub
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  ' RealStudio does not raise this event.
		  #pragma Unused obj
		  #pragma Unused action
		  #pragma Unused x
		  #pragma Unused y
		  Break
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  ' RealStudio does not raise this event.
		  #pragma Unused obj
		  #pragma Unused action
		  Break
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  ' RealStudio does not raise this event.
		  #pragma Unused Key
		  Break
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  ' RealStudio does not raise this event.
		  #pragma Unused Key
		  Break
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  ' RealStudio does not raise this event.
		  Break
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  ' RealStudio does not raise this event.
		  Break
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  ' RealStudio does not raise this event.
		  #pragma Unused X
		  #pragma Unused Y
		  Break
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  ' RealStudio does not raise this event.
		  #pragma Unused X
		  #pragma Unused Y
		  #pragma Unused deltaX
		  #pragma Unused deltaY
		  Break
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  #If TargetWin32 Then
		    ParentHandle = CreateWindowEx(0, "RB_Pane", "", WS_CHILD Or WS_CLIPCHILDREN Or WS_VISIBLE Or WS_EX_CONTROLPARENT, Me.Left, Me.Top, Me.Width, Me.Height, Me.Window.Handle, 0, 0, Nil)
		    SciRef = CreateWindowEx(WS_EX_CONTROLPARENT, "Scintilla", "", WS_CHILD Or WS_CLIPCHILDREN Or WS_TABSTOP Or WS_VISIBLE , Me.Left, Me.Top, Me.Width, Me.Height, Me.Window.Handle, 0, 0, Nil)
		    Dim h As Integer = SetParent(SciRef, ParentHandle)
		    If h = Me.Window.Handle Then
		      LockRect = New REALbasic.Rect(Me.Left, Me.Top, Me.Width, Me.Height)
		      If SciRef <= 0 Then Raise New PlatformNotSupportedException
		      
		      Me.Lexer = Scintilla.LexerTypes.NULL
		      
		      Call SciMessage(SciRef, SCI_SETMODEVENTMASK, SC_MODEVENTMASKALL, 0)
		      
		      Subclass(ParentHandle, Me)
		      Subclass(SciRef, Me)
		      Subclass(h, Me)
		      Call SciMessage(SciRef, SCI_SETSAVEPOINT, Nil, Nil)
		      Call SciMessage(SciRef, SCI_USEPOPUP, 0, 0)
		      
		      
		      For i As Integer = 25 To 31
		        Me.Markers(i).Type = i - 25
		      Next
		    Else
		      Raise New RuntimeException
		    End If
		    
		  #endif
		  RaiseEvent Open()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AppendText(Text As String)
		  If Text <> "" Then
		    Dim wparam As Integer = Text.LenB
		    Dim lparam As New MemoryBlock(Text.LenB * 2)
		    lparam.CString(0) = Text
		    Call SciMessage(SciRef, SCI_APPENDTEXT, wparam, lparam)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Autocomplete() As Scintilla.AutoComplete
		  Return New Scintilla.AutoComplete(SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CallTip() As Scintilla.CallTip
		  Return New Scintilla.CallTip(SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CharAtPos(Position As Integer) As Scintilla.CharacterCell
		  Return New Scintilla.CharacterCell(Position, SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearAll()
		  Call SciMessage(SciRef, SCI_CLEARALL, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  If Not Scintilla.IsAvailable Then
		    Dim err As New PlatformNotSupportedException
		    err.Message = "SciLexer.dll is not available."
		    Raise err
		  End If
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Attributes( hidden ) Protected Shared Function DefWindowProc(HWND as Integer, msg as Integer, wParam as Ptr, lParam as Ptr) As Integer
		  #If TargetWin32 Then
		    #pragma X86CallingConvention StdCall
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
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Dimensions() As REALbasic.Rect
		  Dim wr As RECT
		  If Not GetWindowRect(SciRef, wr) Then
		    wr.left = GetLastError()
		    Break
		  End If
		  Return New REALbasic.Rect(wr.left, wr.top, wr.right - wr.left, wr.bottom - wr.top)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EmptyUndoBuffer()
		  Call SciMessage(SciRef, SCI_EMPTYUNDOBUFFER, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EOL() As Scintilla.EOL
		  Return New Scintilla.EOL(SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Integer
		  Return ParentHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function History() As Scintilla.UndoRedo
		  Return New Scintilla.UndoRedo(SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDirty() As Boolean
		  Return SciMessage(SciRef, SCI_GETMODIFY, Nil, Nil) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsDirty(Assigns NewBool As Boolean)
		  #pragma Unused NewBool
		  #pragma Warning "Fix Me"
		  'Call SciMessage(SciRef, SCI_SETSAVEPOINT, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  Return SciMessage(SciRef, SCI_GETSTATUS, Nil, Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lexer() As Scintilla.Lexer
		  Return New Scintilla.Lexer(SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Lexer(Assigns LexNum As Scintilla.LexerTypes)
		  Me.Lexer.Language = LexNum
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Line(LineNumber As Integer) As Scintilla.RenderLine
		  If LineNumber = -1 Then LineNumber = SciMessage(SciRef, SCI_GETCURLINE, Nil, Nil)
		  Return New Scintilla.RenderLine(LineNumber, SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineFromPosition(Position As Integer) As Scintilla.RenderLine
		  Return New Scintilla.RenderLine(SciMessage(SciRef, SCI_LINEFROMPOSITION, Position, 0), SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Margin(Index As Integer) As Scintilla.Margin
		  Return New Scintilla.Margin(Index, SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Markers(MarkerNumber As Integer) As Scintilla.Marker
		  Return New Scintilla.Marker(MarkerNumber, SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PositionFromLine(Line As Integer) As Integer
		  Return SciMessage(SciRef, SCI_POSITIONFROMLINE, Line, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PositionFromXY(X As Integer, Y As Integer) As Integer
		  Return SciMessage(SciRef, SCI_CHARPOSITIONFROMPOINT, X, Y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScintillaHandle() As Integer
		  Return SciRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollToLine(Line As Integer)
		  Call SciMessage(SciRef, SCI_GOTOLINE, Line, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollToPosition(Position As Integer)
		  Call SciMessage(SciRef, SCI_GOTOPOS, Position, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Search() As Scintilla.FindReplace
		  Return New Scintilla.FindReplace(SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Selection() As Scintilla.Selection
		  Return New Scintilla.Selection(SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFocus()
		  Call Scintilla.SetFocus(SciRef)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRangeStyle(Start As Integer, Stop As Integer, Assigns NewStyle As Scintilla.Style)
		  Call SciMessage(SciRef, SCI_STARTSTYLING, Start, &h1F) ' start styling
		  Call SciMessage(SciRef, SCI_SETSTYLING, Stop - Start, NewStyle.StyleNumber)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Style(StyleNumber As Integer) As Scintilla.Style
		  Return New Scintilla.Style(StyleNumber, SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Style(StyleNumber As Integer, Assigns CopyStyle As Scintilla.Style)
		  Dim s As Scintilla.Style = Me.Style(StyleNumber)
		  s.Background = CopyStyle.Background
		  s.Bold = CopyStyle.Bold
		  s.Hotspot = CopyStyle.Hotspot
		  s.Italic = CopyStyle.Italic
		  s.TextColor = CopyStyle.TextColor
		  s.TextFont = CopyStyle.TextFont
		  s.TextSize = CopyStyle.TextSize
		  s.Underline = CopyStyle.Underline
		End Sub
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
		  #If TargetWin32 Then
		    If HWND = SciRef Then ' Message to the Scintilla window
		      Select Case msg
		      Case WM_KEYUP
		        Dim s As String = Chr(Integer(wParam))
		        If s <> "" Then
		          RaiseEvent KeyUp(s)
		          Me.History.EndAction()
		        End If
		        
		      Case WM_KEYDOWN
		        Dim s As String = Chr(Integer(wParam))
		        If s <> "" Then
		          RaiseEvent KeyDown(s)
		          Me.History.BeginAction()
		        End If
		        
		      Case WM_RBUTTONUP, WM_LBUTTONUP
		        Dim p As RealBasic.POINT = ScreenToClient(lParam, SciRef)
		        If Not IsContextualClick Then
		          RaiseEvent MouseUp(p.X, p.Y)
		        Else
		          Break
		        End If
		        
		      Case WM_LBUTTONDOWN, WM_RBUTTONDOWN
		        Dim p As RealBasic.POINT = ScreenToClient(lParam, SciRef)
		        Dim swap As Boolean = (GetSystemMetrics(SM_SWAPBUTTON) <> 0)
		        If msg = WM_LBUTTONDOWN Then
		          RaiseEvent MouseDown(p.X, p.Y, swap)
		        Else
		          RaiseEvent MouseDown(p.X, p.Y, Not swap)
		        End If
		        
		      Case WM_MOUSEMOVE
		        Dim p As RealBasic.POINT = ScreenToClient(lParam, SciRef)
		        Dim r As New REALbasic.Rect(Me.Left, Me.Top, Me.Width, Me.Height)
		        If r.Contains(p) Then
		          If Not CursorEntered Then
		            CursorEntered = True
		            RaiseEvent MouseEnter()
		          End If
		          RaiseEvent MouseMove(p.X, p.Y)
		        End If
		        
		      Case WM_MOUSELEAVE
		        CursorEntered = False
		        RaiseEvent MouseExit()
		        
		        'Case WM_MOUSEWHEEL
		        'Dim delta As Int16 = Bitwise.ShiftRight(Integer(wParam), 16)
		        'Break
		      Case WM_SETFOCUS
		        RaiseEvent GotFocus()
		        
		      Case WM_KILLFOCUS
		        RaiseEvent LostFocus()
		        
		      Case WM_CONTEXTMENU
		        Dim base As New MenuItem("")
		        Dim p As RealBasic.POINT = ScreenToClient(lParam, SciRef)
		        If RaiseEvent ConstructContextualMenu(base, p.X, p.Y) Then
		          base = base.PopUp
		          If base <> Nil Then
		            Return RaiseEvent ContextualMenuAction(base)
		          End If
		        End If
		        
		      End Select
		    ElseIf HWND = ParentHandle Then ' Message to the container child window
		      Select Case msg
		        
		      Case WM_SETFOCUS
		        RaiseEvent GotFocus()
		        
		      Case WM_NOTIFY
		        Dim notification As SCNotification
		        Dim data As MemoryBlock = lParam
		        notification.StringValue(TargetLittleEndian) = data.StringValue(0, SCNotification.Size)
		        If notification.HWND = Me.SciRef Then
		          Select Case notification.Code
		            
		          Case SCN_AUTOCCANCELLED
		            RaiseEvent AutoCompletionCancel
		            
		          Case SCN_AUTOCSELECTION 'SCN_AUTOCCHARDELETED
		            Dim mb As MemoryBlock = notification.text
		            RaiseEvent AutocompleteSelection(mb.CString(0))
		            
		          Case SCN_UPDATEUI
		            Super.Invalidate(False)
		            
		          Case SCN_STYLENEEDED
		            Dim s As Integer = SciMessage(SciRef, SCI_GETENDSTYLED, Nil, Nil)
		            s = PositionFromLine(LineFromPosition(s).LineNumber)
		            RaiseEvent StyleNeeded(s, notification.Position)
		            
		          Case SCN_SAVEPOINTREACHED
		            
		          Case SCN_HOTSPOTCLICK
		            RaiseEvent HotspotClicked(notification.Position)
		            
		          Case SCN_HOTSPOTDOUBLECLICK
		            RaiseEvent HotspotDoubleClicked(notification.Position)
		            
		          Case SCN_MARGINCLICK
		            Dim l As RenderLine = LineFromPosition(notification.Position)
		            RaiseEvent MarginClicked(notification.Margin, l.LineNumber)
		            
		          Case SCN_MODIFIED
		            Dim mt As Integer = notification.ModificationType
		            If BitAnd(mt, SC_MOD_DELETETEXT) = SC_MOD_DELETETEXT Or _
		              BitAnd(mt, SCEN_CHANGE) = SCEN_CHANGE Or _
		              BitAnd(mt, SC_MOD_INSERTTEXT) = SC_MOD_INSERTTEXT Or _
		              BitAnd(mt, SC_PERFORMED_UNDO) = SC_PERFORMED_UNDO Or _
		              BitAnd(mt, SC_PERFORMED_REDO) = SC_PERFORMED_REDO _
		              Then RaiseEvent TextChanged()
		              
		              'If BitAnd(mt, SC_MOD_DELETETEXT) = SC_MOD_DELETETEXT Or _
		              'BitAnd(mt, SC_MOD_INSERTTEXT) = SC_MOD_INSERTTEXT Or _
		              'BitAnd(mt, SC_PERFORMED_UNDO) = SC_PERFORMED_UNDO Or _
		              'BitAnd(mt, SC_PERFORMED_REDO) = SC_PERFORMED_REDO _
		              'Then RaiseEvent TextChanged()
		              
		              
		              
		          End Select
		          
		          
		        Else
		          RaiseEvent ScintillaEvent(notification.Code)
		        End If
		        'Return True
		      End Select
		    ElseIf HWND = Me.Window.Handle Then ' message to the top-level window
		      Select Case msg
		      Case WM_SIZING
		        RaiseEvent Resizing()
		        
		      Case WM_SIZE
		        Dim p As New MemoryBlock(8)
		        Dim i As Integer = Integer(lParam)
		        p.Int32Value(0) = BitAnd(i, &hFFFF)
		        p.Int16Value(4) = ShiftRight(i, 16)
		        Dim wr As RECT
		        If Not GetWindowRect(ParentHandle, wr) Then
		          i = GetLastError()
		          Break
		        End If
		        Dim r As New REALbasic.Rect(wr.left, wr.top, wr.right - wr.left, wr.bottom - wr.top)
		        
		        If Me.LockLeft Then Me.Left = LockRect.Left
		        If Me.LockTop Then Me.Top = LockRect.Top
		        If Me.LockBottom Then Me.Height = r.Height - LockRect.Bottom
		        If Me.LockRight Then Me.Width = r.Width - LockRect.Width
		        
		        RaiseEvent Resized()
		        
		      End Select
		      
		    Else ' some other window; this should never happen
		      'Break
		    End If
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function WndProcs() As Dictionary
		  #If TargetWin32 Then
		    Static mWndProcs As Dictionary
		    If mWndProcs = Nil Then mWndProcs = New Dictionary
		    Return mWndProcs
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XFromPosition(Position As Integer) As Integer
		  Return SciMessage(SciRef, SCI_POINTXFROMPOSITION, 0, Position)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function YFromPosition(Position As Integer) As Integer
		  Return SciMessage(SciRef, SCI_POINTYFROMPOSITION, 0, Position)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AutocompleteSelection(SelectedText As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutoCompletionCancel()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ContextualMenuAction(hitItem as MenuItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GotFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HotspotClicked(Position As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HotspotDoubleClicked(Position As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(key As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyUp(key As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LostFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MarginClicked(MarginNumber As Integer, LineNumber As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer, IsContextualClick As Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseEnter()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseExit()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseMove(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(X As Integer, Y As Integer)
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
		Event StyleNeeded(StartPosition As Integer, EndPosition As Integer)
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
		SCI_MARKERLINEFROSciRef 2017
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
			  Return SciMessage(SciRef, SCI_GETMOUSEDOWNCAPTURES, Nil, Nil) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SciMessage(SciRef, SCI_SETMOUSEDOWNCAPTURES, 1, 0)
			  Else
			    Call SciMessage(SciRef, SCI_SETMOUSEDOWNCAPTURES, 0, 0)
			  End If
			End Set
		#tag EndSetter
		AcceptFocus As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETUNDOCOLLECTION, Nil, Nil) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    EmptyUndoBuffer()
			    Call SciMessage(SciRef, SCI_SETUNDOCOLLECTION, 1, 0)
			  Else
			    Call SciMessage(SciRef, SCI_SETUNDOCOLLECTION, 0, 0)
			  End If
			End Set
		#tag EndSetter
		AllowUndo As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' in millisecs
			  Return SciMessage(SciRef, SCI_GETCARETPERIOD, Nil, Nil)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' in millisecs
			  Call SciMessage(SciRef, SCI_SETCARETPERIOD, value, 0)
			End Set
		#tag EndSetter
		CaretPeriod As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETCURRENTPOS, Nil, Nil)
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim wparam As New MemoryBlock(4)
			  wparam.Int32Value(0) = value
			  Call SciMessage(SciRef, SCI_SETCURRENTPOS, wparam, Nil)
			  
			  
			End Set
		#tag EndSetter
		CaretPosition As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private CursorEntered As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETBUFFEREDDRAW, Nil, Nil) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SciMessage(SciRef, SCI_GETBUFFEREDDRAW, 1, 0)
			  Else
			    Call SciMessage(SciRef, SCI_GETBUFFEREDDRAW, 0, 0)
			  End If
			End Set
		#tag EndSetter
		DoubleBuffered As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETLINECOUNT, Nil, Nil)
			End Get
		#tag EndGetter
		LineCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected LockRect As REALbasic.Rect
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETOVERTYPE, Nil, Nil) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SciMessage(SciRef, SCI_SETOVERTYPE, 1, 0)
			  Else
			    Call SciMessage(SciRef, SCI_SETOVERTYPE, 0, 0)
			  End If
			End Set
		#tag EndSetter
		Overtype As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private ParentHandle As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETREADONLY, Nil, Nil) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SciMessage(SciRef, SCI_SETREADONLY, 1, 0)
			  Else
			    Call SciMessage(SciRef, SCI_SETREADONLY, 0, 0)
			  End If
			End Set
		#tag EndSetter
		ReadOnly As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private SciRef As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Subclasses() As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim len As Integer = SciMessage(SciRef, SCI_GETLENGTH, Nil, Nil)
			  If len > 0 Then
			    Dim mb As New MemoryBlock(len * 2)
			    len = SciMessage(SciRef, SCI_GETTEXT, mb.Size, mb)
			    Dim ret As String = mb.CString(0)
			    Return ret
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim lparam As Ptr
			  If value <> "" Then
			    lparam = New MemoryBlock(value.LenB * 2)
			    lparam.CString(0) = value
			  End If
			  #pragma NilObjectChecking Off
			  Call SciMessage(SciRef, SCI_SETTEXT, Nil, lparam)
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETFIRSTVISIBLELINE, Nil, Nil)
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim wparam As New MemoryBlock(4)
			  wparam.Int32Value(0) = value
			  Call SciMessage(SciRef, SCI_SETFIRSTVISIBLELINE, wparam, Nil)
			  
			  
			End Set
		#tag EndSetter
		TopLine As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private WndAtom As Integer
	#tag EndProperty


	#tag Constant, Name = GWL_WNDPROC, Type = Double, Dynamic = False, Default = \"-4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INVALID_HANDLE_VALUE, Type = Double, Dynamic = False, Default = \"&hffffffff", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCEN_CHANGE, Type = Double, Dynamic = False, Default = \"768", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCEN_KILLFOCUS, Type = Double, Dynamic = False, Default = \"256", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCEN_SETFOCUS, Type = Double, Dynamic = False, Default = \"512", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCI_APPENDTEXT, Type = Double, Dynamic = False, Default = \"2282", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_CHARPOSITIONFROMPOINT, Type = Double, Dynamic = False, Default = \"2561", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_CHARPOSITIONFROMPOINTCLOSE, Type = Double, Dynamic = False, Default = \"2562", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_CLEARALL, Type = Double, Dynamic = False, Default = \"2004", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_EMPTYUNDOBUFFER, Type = Double, Dynamic = False, Default = \"2175", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETBUFFEREDDRAW, Type = Double, Dynamic = False, Default = \"2034", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETCARETPERIOD, Type = Double, Dynamic = False, Default = \"2075", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETCURLINE, Type = Double, Dynamic = False, Default = \"2027", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETCURRENTPOS, Type = Double, Dynamic = False, Default = \"2008", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETENDSTYLED, Type = Double, Dynamic = False, Default = \"2028", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETFIRSTVISIBLELINE, Type = Double, Dynamic = False, Default = \"2152", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETLENGTH, Type = Double, Dynamic = False, Default = \"2006", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETLINECOUNT, Type = Double, Dynamic = False, Default = \"2154", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETMODEVENTMASK, Type = Double, Dynamic = False, Default = \"2378", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETMODIFY, Type = Double, Dynamic = False, Default = \"2159", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETMOUSEDOWNCAPTURES, Type = Double, Dynamic = False, Default = \"2385", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETOVERTYPE, Type = Double, Dynamic = False, Default = \"2187", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETREADONLY, Type = Double, Dynamic = False, Default = \"2140", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETREPRESENTATION, Type = Double, Dynamic = False, Default = \"2666", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETSTATUS, Type = Double, Dynamic = False, Default = \"2383", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETTEXT, Type = Double, Dynamic = False, Default = \"2182", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETUNDOCOLLECTION, Type = Double, Dynamic = False, Default = \"2019", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GOTOLINE, Type = Double, Dynamic = False, Default = \"2024", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GOTOPOS, Type = Double, Dynamic = False, Default = \"2025", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_LINEFROMPOSITION, Type = Double, Dynamic = False, Default = \"2166", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_POINTXFROMPOSITION, Type = Double, Dynamic = False, Default = \"2164", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_POINTYFROMPOSITION, Type = Double, Dynamic = False, Default = \"2165", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_POSITIONFROMLINE, Type = Double, Dynamic = False, Default = \"2167", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_POSITIONFROMPOINT, Type = Double, Dynamic = False, Default = \"2022", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_POSITIONFROMPOINTCLOSE, Type = Double, Dynamic = False, Default = \"2023", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETBUFFEREDDRAW, Type = Double, Dynamic = False, Default = \"2035", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETCARETPERIOD, Type = Double, Dynamic = False, Default = \"2076", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETCURRENTPOS, Type = Double, Dynamic = False, Default = \"2041", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETFIRSTVISIBLELINE, Type = Double, Dynamic = False, Default = \"2613", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETMODEVENTMASK, Type = Double, Dynamic = False, Default = \"2359", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETMOUSEDOWNCAPTURES, Type = Double, Dynamic = False, Default = \"2384", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETOVERTYPE, Type = Double, Dynamic = False, Default = \"2186", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETREADONLY, Type = Double, Dynamic = False, Default = \"2171", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETREPRESENTATION, Type = Double, Dynamic = False, Default = \"2665", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETSAVEPOINT, Type = Double, Dynamic = False, Default = \"2014", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETTEXT, Type = Double, Dynamic = False, Default = \"2181", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETUNDOCOLLECTION, Type = Double, Dynamic = False, Default = \"2012", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_USEPOPUP, Type = Double, Dynamic = False, Default = \"2371", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCN_AUTOCCANCELLED, Type = Double, Dynamic = False, Default = \"2025", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCN_AUTOCCHARDELETED, Type = Double, Dynamic = False, Default = \"2026", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCN_AUTOCSELECTION, Type = Double, Dynamic = False, Default = \"2022", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCN_HOTSPOTCLICK, Type = Double, Dynamic = False, Default = \"2019", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCN_HOTSPOTDOUBLECLICK, Type = Double, Dynamic = False, Default = \"2020", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCN_MARGINCLICK, Type = Double, Dynamic = False, Default = \"2010", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCN_MODIFIED, Type = Double, Dynamic = False, Default = \"2008", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCN_SAVEPOINTLEFT, Type = Double, Dynamic = False, Default = \"2003", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCN_SAVEPOINTREACHED, Type = Double, Dynamic = False, Default = \"2002", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCN_STYLENEEDED, Type = Double, Dynamic = False, Default = \"2000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCN_UPDATEUI, Type = Double, Dynamic = False, Default = \"2007", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_LASTSTEPINUNDOREDO, Type = Double, Dynamic = False, Default = \"&h100", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MODEVENTMASKALL, Type = Double, Dynamic = False, Default = \"&h7FFFF", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_BEFOREDELETE, Type = Double, Dynamic = False, Default = \"&h800", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_BEFOREINSERT, Type = Double, Dynamic = False, Default = \"&h400", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGEANNOTATION, Type = Double, Dynamic = False, Default = \"&h20000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGEFOLD, Type = Double, Dynamic = False, Default = \"&h8", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGEINDICATOR, Type = Double, Dynamic = False, Default = \"&h4000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGELINESTATE, Type = Double, Dynamic = False, Default = \"&h8000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGEMARGIN, Type = Double, Dynamic = False, Default = \"&h10000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGEMARKER, Type = Double, Dynamic = False, Default = \"&h200", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGESTYLE, Type = Double, Dynamic = False, Default = \"&h4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_DELETETEXT, Type = Double, Dynamic = False, Default = \"&h2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_INSERTTEXT, Type = Double, Dynamic = False, Default = \"&h1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_LEXERSTATE, Type = Double, Dynamic = False, Default = \"&h80000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MULTILINEUNDOREDO, Type = Double, Dynamic = False, Default = \"&h1000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_PERFORMED_REDO, Type = Double, Dynamic = False, Default = \"&h40", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_PERFORMED_UNDO, Type = Double, Dynamic = False, Default = \"&h20", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_PERFORMED_USER, Type = Double, Dynamic = False, Default = \"&h10", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_STARTACTION, Type = Double, Dynamic = False, Default = \"&h2000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SM_SWAPBUTTON, Type = Double, Dynamic = False, Default = \"23", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_CONTEXTMENU, Type = Double, Dynamic = False, Default = \"&h007B", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_KEYDOWN, Type = Double, Dynamic = False, Default = \"&h0100", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_KEYUP, Type = Double, Dynamic = False, Default = \"&h0101", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_KILLFOCUS, Type = Double, Dynamic = False, Default = \"&h0008", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_LBUTTONDOWN, Type = Double, Dynamic = False, Default = \"&h0201", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_LBUTTONUP, Type = Double, Dynamic = False, Default = \"&h0202", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_LBUTTONUP1, Type = Double, Dynamic = False, Default = \"&h0202", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_MOUSELEAVE, Type = Double, Dynamic = False, Default = \"&h02A3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_MOUSEMOVE, Type = Double, Dynamic = False, Default = \"&h0200", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_MOUSEWHEEL, Type = Double, Dynamic = False, Default = \"&h020A", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_NOTIFY, Type = Double, Dynamic = False, Default = \"&h004E", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_RBUTTONDOWN, Type = Double, Dynamic = False, Default = \"&h0204", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_RBUTTONUP, Type = Double, Dynamic = False, Default = \"&h0205", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_SETFOCUS, Type = Double, Dynamic = False, Default = \"&h0007", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_SIZE, Type = Double, Dynamic = False, Default = \"&h0005", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_SIZING, Type = Double, Dynamic = False, Default = \"&h0214", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_CHILD, Type = Double, Dynamic = False, Default = \"&h40000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_CLIPCHILDREN, Type = Double, Dynamic = False, Default = \"&h02000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_EX_CONTROLPARENT, Type = Double, Dynamic = False, Default = \"&h00010000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_TABSTOP, Type = Double, Dynamic = False, Default = \"&h00010000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_VISIBLE, Type = Double, Dynamic = False, Default = \"&h10000000", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowUndo"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="RectControl"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaretPeriod"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaretPosition"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffered"
			Group="Behavior"
			Type="Boolean"
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
			Name="LineCount"
			Group="Behavior"
			Type="Integer"
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
			Name="Overtype"
			Group="Behavior"
			Type="Boolean"
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
