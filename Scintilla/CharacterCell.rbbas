#tag Class
Protected Class CharacterCell
	#tag Method, Flags = &h0
		Sub Constructor(Position As Integer, Reference As Integer)
		  CharPosition = Position
		  SciRef = Reference
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  Dim char As Integer = SciMessage(SciRef, SCI_GETCHARAT, Ptr(CharPosition), Nil)
		  If char > 0 Then
		    Return Chr(char)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Style() As Scintilla.Style
		  Dim s As Integer = SciMessage(SciRef, SCI_GETSTYLEAT, CharPosition, 0)
		  Return New Scintilla.Style(s, SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Style(Assigns NewStyle As Scintilla.Style)
		  Call SciMessage(SciRef, SCI_STARTSTYLING, CharPosition, &h1F) ' start styling
		  Call SciMessage(SciRef, SCI_SETSTYLING, 1, NewStyle.StyleNumber)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected CharPosition As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty


	#tag Constant, Name = SCI_GETCHARAT, Type = Double, Dynamic = False, Default = \"2007", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETSTYLEAT, Type = Double, Dynamic = False, Default = \"2010", Scope = Protected
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
