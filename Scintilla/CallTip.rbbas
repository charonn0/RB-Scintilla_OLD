#tag Class
Protected Class CallTip
	#tag Method, Flags = &h0
		Sub Constructor(SciRef As Integer)
		  Me.SciRef = SciRef
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HideTip()
		  Call SciMessage(SciRef, SCI_CALLTIPCANCEL, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsActive() As Boolean
		  Return SciMessage(SciRef, SCI_CALLTIPACTIVE, Nil, Nil) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowTip(Position As Integer, TipText As String)
		  Dim mb As New MemoryBlock(TipText.LenB + 1)
		  mb.CString(0) = TipText
		  Call SciMessage(SciRef, SCI_CALLTIPSHOW, Ptr(Position), mb)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_CALLTIPPOSSTART, Nil, Nil)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call SciMessage(SciRef, SCI_CALLTIPSETPOSSTART, value, 0)
			End Set
		#tag EndSetter
		Position As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty


	#tag Constant, Name = SCI_CALLTIPACTIVE, Type = Double, Dynamic = False, Default = \"2202", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_CALLTIPCANCEL, Type = Double, Dynamic = False, Default = \"2201", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_CALLTIPPOSSTART, Type = Double, Dynamic = False, Default = \"2203", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_CALLTIPSETPOSSTART, Type = Double, Dynamic = False, Default = \"2214", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_CALLTIPSHOW, Type = Double, Dynamic = False, Default = \"2200", Scope = Protected
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
			Name="Position"
			Group="Behavior"
			Type="Integer"
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
End Class
#tag EndClass
