#tag Module
Protected Module SciLexer
	#tag ExternalMethod, Flags = &h21
		Private Declare Function CallWindowProc Lib "User32" Alias "CallWindowProcW" (WindowProc As Integer, HWND As Integer, msg As Integer, wParam As Ptr, lParam As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function CreateWindowEx Lib "User32" Alias "CreateWindowExW" (ExStyle As Integer, ClassName As WString, WindowName As WString, Style As Integer, X As Integer, Y As Integer, Width As Integer, Height As Integer, Parent As Integer, Menu As Integer, Instance As Integer, Param As Ptr) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function IsAvailable() As Boolean
		  Return System.IsFunctionAvailable("Scintilla_DirectFunction", "SciLexer")
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function SendMessage Lib "User32" Alias "SendMessageW" (HWND As Integer, Message As UInt32, WParam As Ptr, LParam As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function SetWindowLong Lib "User32" Alias "SetWindowLongW" (HWND As Integer, Index As Integer, NewLong As Ptr) As Integer
	#tag EndExternalMethod


	#tag Constant, Name = GWL_WNDPROC, Type = Double, Dynamic = False, Default = \"-4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = INVALID_HANDLE_VALUE, Type = Double, Dynamic = False, Default = \"&hffffffff", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_CREATE, Type = Double, Dynamic = False, Default = \"&h0001", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_DESTROY, Type = Double, Dynamic = False, Default = \"&h0002", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_NCCREATE, Type = Double, Dynamic = False, Default = \"&h0081", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_NOTIFY, Type = Double, Dynamic = False, Default = \"&h004E", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_CHILD, Type = Double, Dynamic = False, Default = \"&h40000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_CLIPCHILDREN, Type = Double, Dynamic = False, Default = \"&h02000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_TABSTOP, Type = Double, Dynamic = False, Default = \"&h00010000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_VISIBLE, Type = Double, Dynamic = False, Default = \"&h10000000", Scope = Private
	#tag EndConstant


	#tag Structure, Name = JDR, Flags = &h0
		g As Integer
		  a As Integer
		h As Integer
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
