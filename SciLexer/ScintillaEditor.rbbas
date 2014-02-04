#tag Class
Protected Class ScintillaEditor
Inherits RectControl
	#tag Event
		Sub Open()
		  mHandle = CreateWindowEx(0, "Scintilla", "", WS_CHILD Or WS_CLIPCHILDREN Or WS_TABSTOP Or WS_VISIBLE, Me.Left, Me.Top, Me.Width, Me.Height, Me.Window.Handle, 0, 0, Nil)
		  If mHandle > 0 Then
		    Subclass(Me.Window, Me)
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  If Not SciLexer.IsAvailable Then
		    Raise New PlatformNotSupportedException
		  End If
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function DefWindowProc(HWND as Integer, msg as Integer, wParam as Ptr, lParam as Ptr) As Integer
		  #pragma X86CallingConvention StdCall
		  #If TargetWin32 Then
		    For Each wndclass As Dictionary In Subclasses
		      If wndclass.HasKey(HWND) Then
		        Dim subclass As SciLexer.ScintillaEditor = wndclass.Value(HWND)
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
		  Call Me.SendMessage(WM_DESTROY, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendMessage(SciMessage As Integer, WParam As Ptr, LParam As Ptr) As Integer
		  Return SendMessage(Me.Handle, SciMessage, WParam, LParam)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub Subclass(SuperWin As Window, SubWin As SciLexer.ScintillaEditor)
		  #If TargetWin32 Then
		    If WndProcs.HasKey(SuperWin.Handle) Then
		      Dim d As New Dictionary
		      d.Value(SuperWin.Handle) = SubWin
		      Subclasses.Append(d)
		      Return
		    End
		    Dim windproc As Ptr = AddressOf DefWindowProc
		    Dim oldWndProc As Integer = SetWindowLong(SuperWin.Handle, GWL_WNDPROC, windproc)
		    WndProcs.Value(SuperWin.Handle) = oldWndProc
		    Dim d As New Dictionary
		    d.Value(SuperWin.Handle) = SubWin
		    Subclasses.Append(d)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub UnSubclass(SuperWin As Window)
		  #If TargetWin32 Then
		    If Not WndProcs.HasKey(SuperWin.Handle) Then Return
		    Dim oldWndProc As Ptr = WndProcs.Value(SuperWin.Handle)
		    Call SetWindowLong(SuperWin.Handle, GWL_WNDPROC, oldWndProc)
		    WndProcs.Remove(SuperWin.Handle)
		    Dim wndclass As Dictionary
		    For i As Integer = UBound(Subclasses) DownTo 0
		      wndclass = Subclasses(i)
		      If wndclass.HasKey(SuperWin.Handle) Then
		        Subclasses.Remove(i)
		      End
		    Next
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function WndProc(HWND as Integer, msg as Integer, wParam as Ptr, lParam as Ptr) As Boolean
		  If msg = WM_NOTIFY Then
		    Dim mb As MemoryBlock = lParam
		    Dim h As Integer = mb.UInt32Value(0)
		    If h = Me.mHandle Then
		      Dim code As Integer = mb.UInt32Value(8)
		      Dim id As Ptr
		      If mb.Ptr(4) <> Nil Then id = mb.Ptr(4)
		      RaiseEvent ScintillaEvent(Code)
		      Return True
		    End If
		    'Return WindowMessage(HWND, msg, wParam, lParam)
		  End If
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ScintillaEvent(EventCode As Integer)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mWndProcs As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Subclasses() As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim len As Integer = Me.SendMessage(SCI_GETLENGTH, Nil, Nil)
			  Dim mb As New MemoryBlock(len * 2)
			  Dim nb As New MemoryBlock(4)
			  nb.Int32Value(0) = len
			  len = Me.SendMessage(SCI_GETTEXT, nb, mb)
			  Dim ret As String = mb.WString(0)
			  Return ret
			  
			End Get
		#tag EndGetter
		Text As String
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


	#tag Constant, Name = SCI_GETLENGTH, Type = Double, Dynamic = False, Default = \"2006", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETTEXT, Type = Double, Dynamic = False, Default = \"2182", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETTEXT, Type = Double, Dynamic = False, Default = \"2181", Scope = Protected
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
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
