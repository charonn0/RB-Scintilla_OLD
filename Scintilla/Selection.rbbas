#tag Class
Protected Class Selection
	#tag Method, Flags = &h0
		Function AddSelection(Start As Integer, Stop As Integer) As Integer
		  Call SciMessage(SciRef, SCI_ADDSELECTION, Stop, Start)
		  Return SelCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearSelection(NewCaretPosition As Integer = - 1)
		  If NewCaretPosition <= -1 Then NewCaretPosition = 0
		  Call SciMessage(SciRef, SCI_SETEMPTYSELECTION, Ptr(NewCaretPosition), Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Reference As Integer)
		  SciRef = Reference
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSelection(Index As Integer)
		  Call SciMessage(SciRef, SCI_DROPSELECTION, Index, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelCount() As Integer
		  Return SciMessage(SciRef, SCI_GETSELECTIONS, 0, 0) - 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAll()
		  Call SciMessage(SciRef, SCI_SELECTALL, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectRange(Start As Integer, Stop As Integer)
		  ' Use SelectRange(-1, -1) to clear selection
		  Call SciMessage(SciRef, SCI_SETSEL, Start, Stop)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text() As String
		  Dim sz As Integer = SciMessage(SciRef, SCI_GETSELTEXT, 0, 0)
		  Dim mb As New MemoryBlock(sz + 1)
		  Call SciMessage(SciRef, SCI_GETSELTEXT, Nil, mb)
		  Return mb.CString(0)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETMULTIPLESELECTION, Nil, Nil) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call SciMessage(SciRef, SCI_SETMULTIPLESELECTION, 1, 0)
			  Else
			    Call SciMessage(SciRef, SCI_SETMULTIPLESELECTION, 0, 0)
			  End If
			End Set
		#tag EndSetter
		AllowMultiple As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETSELECTIONEND, Nil, Nil)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call SciMessage(SciRef, SCI_SETSELECTIONEND, value, 0)
			End Set
		#tag EndSetter
		SelEnd As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETSELECTIONSTART, Nil, Nil)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call SciMessage(SciRef, SCI_SETSELECTIONSTART, value, 0)
			End Set
		#tag EndSetter
		SelStart As Integer
	#tag EndComputedProperty


	#tag Constant, Name = SCI_ADDSELECTION, Type = Double, Dynamic = False, Default = \"2573", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_DROPSELECTION, Type = Double, Dynamic = False, Default = \"2671", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETMULTIPLESELECTION, Type = Double, Dynamic = False, Default = \"2564", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETSELECTIONEND, Type = Double, Dynamic = False, Default = \"2145", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETSELECTIONS, Type = Double, Dynamic = False, Default = \"2570", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETSELECTIONSTART, Type = Double, Dynamic = False, Default = \"2143", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETSELTEXT, Type = Double, Dynamic = False, Default = \"2161", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SELECTALL, Type = Double, Dynamic = False, Default = \"2013", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETEMPTYSELECTION, Type = Double, Dynamic = False, Default = \"2147", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETMULTIPLESELECTION, Type = Double, Dynamic = False, Default = \"2563", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETSEL, Type = Double, Dynamic = False, Default = \"2160", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETSELECTIONEND, Type = Double, Dynamic = False, Default = \"2144", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETSELECTIONSTART, Type = Double, Dynamic = False, Default = \"2142", Scope = Protected
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
