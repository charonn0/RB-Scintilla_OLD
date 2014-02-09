#tag Class
Protected Class EOL
	#tag Method, Flags = &h0
		Sub Constructor(Reference As Integer)
		  SciRef = Reference
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConvertTo(NewEOL As String)
		  Dim m As Integer
		  Select Case NewEOL
		  Case EndOfLine.Windows
		    m = SciMessage(SciRef, SCI_CONVERTEOLS, 0, 0)
		  Case EndOfLine.Macintosh
		    m = SciMessage(SciRef, SCI_CONVERTEOLS, 1, 0)
		  Case EndOfLine.UNIX
		    m = SciMessage(SciRef, SCI_CONVERTEOLS, 2, 0)
		  Else
		    Raise New UnsupportedFormatException
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  Dim m As Integer = SciMessage(SciRef, SCI_GETEOLMODE, Nil, Nil)
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
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( deprecated )  Sub Operator_Convert(NewEOL As String)
		  Dim m As Integer
		  Select Case NewEOL
		  Case EndOfLine.Windows
		    m = SciMessage(SciRef, SCI_SETEOLMODE, 0, 0)
		  Case EndOfLine.Macintosh
		    m = SciMessage(SciRef, SCI_SETEOLMODE, 1, 0)
		  Case EndOfLine.UNIX
		    m = SciMessage(SciRef, SCI_SETEOLMODE, 2, 0)
		  Else
		    Raise New UnsupportedFormatException
		  End Select
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETVIEWEOL, Nil, Nil) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SciMessage(SciRef, SCI_SETVIEWEOL, 1, 0)
			  Else
			    Call SciMessage(SciRef, SCI_SETVIEWEOL, 0, 0)
			  End If
			End Set
		#tag EndSetter
		Visible As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = SCI_CONVERTEOLS, Type = Double, Dynamic = False, Default = \"2029", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETEOLMODE, Type = Double, Dynamic = False, Default = \"2030", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETVIEWEOL, Type = Double, Dynamic = False, Default = \"2355", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETEOLMODE, Type = Double, Dynamic = False, Default = \"2031", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETVIEWEOL, Type = Double, Dynamic = False, Default = \"2356", Scope = Protected
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
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
