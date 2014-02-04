#tag Module
Protected Module Win32
	#tag ExternalMethod, Flags = &h1
		Protected Declare Function CreateWindowEx Lib "User32" Alias "CreateWindowExW" (ExStyle As Integer, ClassName As WString, WindowName As WString, Style As Integer, X As Integer, Y As Integer, Width As Integer, Height As Integer, Parent As Integer, Menu As Integer, Instance As Integer, Param As Ptr) As Integer
	#tag EndExternalMethod


	#tag Constant, Name = WS_CHILD, Type = Double, Dynamic = False, Default = \"&h40000000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WS_CLIPCHILDREN, Type = Double, Dynamic = False, Default = \"&h02000000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WS_TABSTOP, Type = Double, Dynamic = False, Default = \"&h00010000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WS_VISIBLE, Type = Double, Dynamic = False, Default = \"&h10000000", Scope = Protected
	#tag EndConstant


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
