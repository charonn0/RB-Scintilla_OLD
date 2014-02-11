#tag Class
Protected Class Lexer
	#tag Method, Flags = &h0
		Sub Constructor(SciRef As Integer)
		  Me.SciRef = SciRef
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Keywords(Assigns NewWordList() As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(Lex As Scintilla.LexerTypes) As Integer
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return LexerTypes(SciMessage(SciRef, SCI_GETLEXER, Nil, Nil))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim v As Integer = Integer(value)
			  Call SciMessage(SciRef, SCI_SETLEXER, v, 0)
			  Call SciMessage(SciRef, SCI_COLORISE, 0, -1)
			  
			  
			End Set
		#tag EndSetter
		Language As Scintilla.LexerTypes
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim len As Integer = SciMessage(SciRef, SCI_GETLEXERLANGUAGE, Nil, Nil)
			  Dim mb As New MemoryBlock(len + 1)
			  Call SciMessage(SciRef, SCI_GETLEXERLANGUAGE, Nil, mb)
			  Return mb.CString(0).Trim
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim mb As New MemoryBlock(value.LenB + 1)
			  mb.CString(0) = value
			  Call SciMessage(SciRef, SCI_SETLEXERLANGUAGE, Nil, mb)
			End Set
		#tag EndSetter
		Name As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty


	#tag Constant, Name = SCI_COLORISE, Type = Double, Dynamic = False, Default = \"4003", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETLEXER, Type = Double, Dynamic = False, Default = \"4002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETLEXERLANGUAGE, Type = Double, Dynamic = False, Default = \"4012", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETLEXER, Type = Double, Dynamic = False, Default = \"4001", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETLEXERLANGUAGE, Type = Double, Dynamic = False, Default = \"4006", Scope = Protected
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
End Class
#tag EndClass
