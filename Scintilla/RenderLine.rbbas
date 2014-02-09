#tag Class
Protected Class RenderLine
	#tag Method, Flags = &h0
		Sub Constructor(LineNumber As Integer, Reference As Integer)
		  SciRef = Reference
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Marker(Index As Integer) As Scintilla.Marker
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Marker(Index As Integer, Assigns NewMarker As Scintilla.Marker)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subscript(Index As Integer) As Scintilla.CharacterCell
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Subscript(Index As Integer, Assigns NewChar As Scintilla.CharacterCell)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Text(Assigns NewText As String)
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event GetReference() As Integer
	#tag EndHook


	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty


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
