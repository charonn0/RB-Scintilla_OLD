#tag Class
Protected Class Annotation
	#tag Method, Flags = &h0
		Sub Constructor(LineNum As Integer, Reference As Integer)
		  mLineNumber = LineNum
		  SciRef = Reference
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineNumber() As Integer
		  Return mLineNumber
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Owner() As Integer
		  Return SciRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove()
		  Call SciMessage(SciRef, SCI_ANNOTATIONSETTEXT, Ptr(LineNumber), Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Style() As Scintilla.Style
		  Dim nm As Integer = SciMessage(SciRef, SCI_ANNOTATIONGETSTYLE, LineNumber, 0)
		  Return New Scintilla.Style(nm, SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Style(Assigns NewStyle As Scintilla.Style)
		  If NewStyle.Owner <> Me.Owner Then Raise New RuntimeException ' styles are instance-specific
		  Call SciMessage(SciRef, SCI_ANNOTATIONSETSTYLE, LineNumber, NewStyle.StyleNumber)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_ANNOTATIONGETVISIBLE, 0, 0) = 2
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SciMessage(SciRef, SCI_ANNOTATIONSETVISIBLE, 2, 0)
			  ElseIf Me.Visible Then
			    Call SciMessage(SciRef, SCI_ANNOTATIONSETVISIBLE, 1, 0)
			  End If
			End Set
		#tag EndSetter
		Boxed As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mLineNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim len As Integer = SciMessage(SciRef, SCI_ANNOTATIONGETTEXT, LineNumber, 0)
			  Dim mb As New MemoryBlock(len + 1)
			  Call SciMessage(SciRef, SCI_ANNOTATIONGETTEXT, Ptr(LineNumber), mb)
			  Return mb.CString(0)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim mb As New MemoryBlock(value.LenB + 1)
			  mb.CString(0) = value
			  Call SciMessage(SciRef, SCI_ANNOTATIONSETTEXT, Ptr(LineNumber), mb)
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_ANNOTATIONGETVISIBLE, 0, 0) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SciMessage(SciRef, SCI_ANNOTATIONSETVISIBLE, 1, 0)
			  Else
			    Call SciMessage(SciRef, SCI_ANNOTATIONSETVISIBLE, 0, 0)
			  End If
			End Set
		#tag EndSetter
		Visible As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = SCI_ANNOTATIONGETSTYLE, Type = Double, Dynamic = False, Default = \"2543", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_ANNOTATIONGETTEXT, Type = Double, Dynamic = False, Default = \"2541", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_ANNOTATIONGETVISIBLE, Type = Double, Dynamic = False, Default = \"2549", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_ANNOTATIONSETSTYLE, Type = Double, Dynamic = False, Default = \"2542", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_ANNOTATIONSETTEXT, Type = Double, Dynamic = False, Default = \"2540", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_ANNOTATIONSETVISIBLE, Type = Double, Dynamic = False, Default = \"2548", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Boxed"
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
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
