#tag Class
Protected Class AutoComplete
	#tag Method, Flags = &h0
		Sub Constructor(SciRef As Integer)
		  Me.SciRef = SciRef
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowList(PartialString As String, Matches() As String)
		  Dim i As Integer = PartialString.Len
		  Dim mb As MemoryBlock = Join(Matches, " ")
		  Call SciMessage(SciRef, SCI_AUTOCSHOW, Ptr(i), mb)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty


	#tag Constant, Name = SCI_AUTOCSHOW, Type = Double, Dynamic = False, Default = \"2100", Scope = Protected
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
