#tag Class
Protected Class UndoRedo
	#tag Method, Flags = &h0
		Sub BeginAction()
		  Call SciMessage(SciRef, SCI_BEGINUNDOACTION, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanRedo() As Boolean
		  Return SciMessage(SciRef, SCI_CANREDO, Nil, Nil) = 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanUndo() As Boolean
		  Return SciMessage(SciRef, SCI_CANUNDO, Nil, Nil) = 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Reference As Integer)
		  SciRef = Reference
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndAction()
		  Call SciMessage(SciRef, SCI_ENDUNDOACTION, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Redo() As Boolean
		  If CanRedo Then
		    Return SciMessage(SciRef, SCI_REDO, Nil, Nil) = 0
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Undo() As Boolean
		  If CanUndo Then
		    Return SciMessage(SciRef, SCI_UNDO, Nil, Nil) = 0
		  End If
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty


	#tag Constant, Name = SCI_BEGINUNDOACTION, Type = Double, Dynamic = False, Default = \"2078", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_CANREDO, Type = Double, Dynamic = False, Default = \"2016", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_CANUNDO, Type = Double, Dynamic = False, Default = \"2174", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_ENDUNDOACTION, Type = Double, Dynamic = False, Default = \"2079", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_REDO, Type = Double, Dynamic = False, Default = \"2011", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_UNDO, Type = Double, Dynamic = False, Default = \"2176", Scope = Protected
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
