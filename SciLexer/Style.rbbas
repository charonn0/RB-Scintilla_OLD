#tag Class
Protected Class Style
	#tag Method, Flags = &h0
		Sub Constructor(SciHWND As Integer, StyleNumber As Integer)
		  SciWindow = SciHWND
		  mStyleNumber = StyleNumber
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Owner() As Integer
		  Return SciWindow
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StyleNumber() As Integer
		  Return mStyleNumber
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As New MemoryBlock(4)
			  Dim i As Integer = SendMessage(SciWindow, SCI_STYLEGETBACK, Me.StyleNumber, 0)
			  mb.Int32Value(0) = i
			  Return RGB(mb.Byte(0), mb.Byte(1), mb.Byte(2))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim mb As New MemoryBlock(4)
			  mb.ColorValue(0, 32) = value
			  Call SendMessage(SciWindow, SCI_STYLEGETBACK, Me.StyleNumber, mb.Int32Value(0))
			End Set
		#tag EndSetter
		Background As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SendMessage(SciWindow, SCI_STYLEGETBOLD, Me.StyleNumber, 0) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SendMessage(SciWindow, SCI_STYLESETBOLD, Me.StyleNumber, 1)
			  Else
			    Call SendMessage(SciWindow, SCI_STYLESETBOLD, Me.StyleNumber, 0)
			  End If
			End Set
		#tag EndSetter
		Bold As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SendMessage(SciWindow, SCI_STYLEGETITALIC, Me.StyleNumber, 0) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SendMessage(SciWindow, SCI_STYLESETITALIC, Me.StyleNumber, 1)
			  Else
			    Call SendMessage(SciWindow, SCI_STYLESETITALIC, Me.StyleNumber, 0)
			  End If
			End Set
		#tag EndSetter
		Italic As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mStyleNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SciWindow As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As New MemoryBlock(4)
			  Dim i As Integer = SendMessage(SciWindow, SCI_STYLEGETFORE, Me.StyleNumber, 0)
			  mb.Int32Value(0) = i
			  Return RGB(mb.Byte(0), mb.Byte(1), mb.Byte(2))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  'Call SendMessage(SciWindow, SCI_STYLESETFORE, Me.StyleNumber, UInt32(value))
			  Dim mb As New MemoryBlock(4)
			  mb.ColorValue(0, 32) = value
			  Call SendMessage(SciWindow, SCI_STYLESETFORE, Me.StyleNumber, mb.Int32Value(0))
			End Set
		#tag EndSetter
		TextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As New MemoryBlock(128)
			  Call SendMessage(SciWindow, SCI_STYLEGETFONT, Ptr(Me.StyleNumber), mb)
			  Dim ret As String = mb.CString(0)
			  Return ret
			End Get
		#tag EndGetter
		TextFont As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		TextSize As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SendMessage(SciWindow, SCI_STYLEGETUNDERLINE, Me.StyleNumber, 0) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SendMessage(SciWindow, SCI_STYLEGETUNDERLINE, Me.StyleNumber, 1)
			  Else
			    Call SendMessage(SciWindow, SCI_STYLEGETUNDERLINE, Me.StyleNumber, 0)
			  End If
			End Set
		#tag EndSetter
		Underline As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = SCI_STYLEGETBACK, Type = Double, Dynamic = False, Default = \"2482", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_STYLEGETBOLD, Type = Double, Dynamic = False, Default = \"2483", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_STYLEGETFONT, Type = Double, Dynamic = False, Default = \"2486", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_STYLEGETFORE, Type = Double, Dynamic = False, Default = \"2481", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_STYLEGETITALIC, Type = Double, Dynamic = False, Default = \"2484", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_STYLEGETUNDERLINE, Type = Double, Dynamic = False, Default = \"2488", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_STYLESETBACK, Type = Double, Dynamic = False, Default = \"2052", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_STYLESETBOLD, Type = Double, Dynamic = False, Default = \"2053", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_STYLESETFONT, Type = Double, Dynamic = False, Default = \"2056", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_STYLESETFORE, Type = Double, Dynamic = False, Default = \"2051", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_STYLESETITALIC, Type = Double, Dynamic = False, Default = \"2054", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_STYLESETUNDERLINE, Type = Double, Dynamic = False, Default = \"2059", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Background"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Group="Behavior"
			Type="Boolean"
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
			Name="TextColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass