#tag Class
Protected Class Margin
	#tag Method, Flags = &h0
		Sub Clickable(MarginNumber As Integer, Assigns NewBool As Boolean)
		  If NewBool Then
		    Call SciMessage(SciRef, SCI_SETMARGINSENSITIVEN, MarginNumber, 1)
		  Else
		    Call SciMessage(SciRef, SCI_SETMARGINSENSITIVEN, MarginNumber, 0)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(MarginNumber As Integer, Reference As Integer)
		  SciRef = Reference
		  mMarginNumber = MarginNumber
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MarginClickable(MarginNumber As Integer) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MarginNumber() As Integer
		  Return mMarginNumber
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Owner() As Integer
		  Return SciRef
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETMARGINSENSITIVEN, MarginNumber, 0) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SciMessage(SciRef, SCI_SETMARGINSENSITIVEN, MarginNumber, 1)
			  Else
			    Call SciMessage(SciRef, SCI_SETMARGINSENSITIVEN, MarginNumber, 0)
			  End If
			End Set
		#tag EndSetter
		Clickable As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mMarginNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETMARGINWIDTHN, MarginNumber, 0)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call SciMessage(SciRef, SCI_SETMARGINWIDTHN, MarginNumber, value)
			End Set
		#tag EndSetter
		Type As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETMARGINWIDTHN, MarginNumber, 0)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call SciMessage(SciRef, SCI_SETMARGINWIDTHN, MarginNumber, value)
			End Set
		#tag EndSetter
		Width As Integer
	#tag EndComputedProperty


	#tag Constant, Name = SCI_GETMARGINSENSITIVEN, Type = Double, Dynamic = False, Default = \"2247", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETMARGINTYPEN, Type = Double, Dynamic = False, Default = \"2241", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETMARGINWIDTHN, Type = Double, Dynamic = False, Default = \"2243", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETMARGINSENSITIVEN, Type = Double, Dynamic = False, Default = \"2246", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETMARGINTYPEN, Type = Double, Dynamic = False, Default = \"2340", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETMARGINWIDTHN, Type = Double, Dynamic = False, Default = \"2242", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Clickable"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
