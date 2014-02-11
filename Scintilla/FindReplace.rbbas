#tag Class
Protected Class FindReplace
	#tag Method, Flags = &h0
		Sub Constructor(Reference As Integer)
		  SciRef = Reference
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(Pattern As String) As Integer
		  Dim mb As New MemoryBlock(Pattern.LenB + 1)
		  mb.CString(0) = Pattern
		  Return SciMessage(SciRef, SCI_SEARCHINTARGET, mb.Size, mb)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindNext(SearchPattern As String, SearchType As Integer) As Integer
		  Call SciMessage(SciRef,SCI_SEARCHANCHOR, Nil, Nil)
		  Dim mb As New MemoryBlock(SearchPattern.LenB + 1)
		  mb.CString(0) = SearchPattern
		  Return SciMessage(SciRef, SCI_SEARCHNEXT, SearchType, mb)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindPrev(SearchPattern As String, SearchType As Integer) As Integer
		  Call SciMessage(SciRef,SCI_SEARCHANCHOR, Nil, Nil)
		  Dim mb As New MemoryBlock(SearchPattern.LenB + 1)
		  mb.CString(0) = SearchPattern
		  Return SciMessage(SciRef, SCI_SEARCHPREV, SearchType, mb)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replace(ReplaceWith As String) As Integer
		  Dim mb As New MemoryBlock(ReplaceWith.LenB + 1)
		  mb.CString(0) = ReplaceWith
		  Return SciMessage(SciRef, SCI_REPLACETARGET, mb.Size - 1, mb)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TargetFromSelection()
		  ' Sets the start and end positions to the current selection, if any
		  Call SciMessage(SciRef, SCI_TARGETFROMSELECTION, Nil, Nil)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETTARGETEND, 0, 0)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call SciMessage(SciRef, SCI_SETTARGETEND, value, 0)
			End Set
		#tag EndSetter
		EndPosition As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETSEARCHFLAGS, Nil, Nil)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call SciMessage(SciRef, SCI_SETSEARCHFLAGS, value, 0)
			End Set
		#tag EndSetter
		Protected Flags As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return BitAnd(Me.Flags, SCFIND_MATCHCASE) = SCFIND_MATCHCASE
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Me.Flags = Me.Flags Or SCFIND_MATCHCASE
			  Else
			    Me.Flags = Me.Flags Or SCFIND_MATCHCASE
			    Me.Flags = Me.Flags Xor SCFIND_MATCHCASE
			  End If
			End Set
		#tag EndSetter
		MatchCase As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return BitAnd(Me.Flags, SCFIND_POSIX) = SCFIND_POSIX
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Me.Flags = Me.Flags Or SCFIND_POSIX
			  Else
			    Me.Flags = Me.Flags Or SCFIND_POSIX
			    Me.Flags = Me.Flags Xor SCFIND_POSIX
			  End If
			End Set
		#tag EndSetter
		POSIXmode As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return BitAnd(Me.Flags, SCFIND_REGEXP) = SCFIND_REGEXP
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Me.Flags = Me.Flags Or SCFIND_REGEXP
			  Else
			    Me.Flags = Me.Flags Or SCFIND_REGEXP
			    Me.Flags = Me.Flags Xor SCFIND_REGEXP
			  End If
			End Set
		#tag EndSetter
		RegExMode As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return SciMessage(SciRef, SCI_GETTARGETSTART, 0, 0)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call SciMessage(SciRef, SCI_SETTARGETSTART, value, 0)
			End Set
		#tag EndSetter
		StartPosition As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return BitAnd(Me.Flags, SCFIND_WHOLEWORD) = SCFIND_WHOLEWORD
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Me.Flags = Me.Flags Or SCFIND_WHOLEWORD
			  Else
			    Me.Flags = Me.Flags Or SCFIND_WHOLEWORD
			    Me.Flags = Me.Flags Xor SCFIND_WHOLEWORD
			  End If
			End Set
		#tag EndSetter
		WholeWord As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return BitAnd(Me.Flags, SCFIND_WORDSTART) = SCFIND_WORDSTART
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Me.Flags = Me.Flags Or SCFIND_WORDSTART
			  Else
			    Me.Flags = Me.Flags Or SCFIND_WORDSTART
			    Me.Flags = Me.Flags Xor SCFIND_WORDSTART
			  End If
			End Set
		#tag EndSetter
		WordStart As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = SCFIND_MATCHCASE, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCFIND_POSIX, Type = Double, Dynamic = False, Default = \"&h00400000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCFIND_REGEXP, Type = Double, Dynamic = False, Default = \"&h00200000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCFIND_WHOLEWORD, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCFIND_WORDSTART, Type = Double, Dynamic = False, Default = \"&h00100000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_FINDTEXT, Type = Double, Dynamic = False, Default = \"2150", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETSEARCHFLAGS, Type = Double, Dynamic = False, Default = \"2199", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETTARGETEND, Type = Double, Dynamic = False, Default = \"2193", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETTARGETSTART, Type = Double, Dynamic = False, Default = \"2191", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_REPLACETARGET, Type = Double, Dynamic = False, Default = \"2194", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SEARCHANCHOR, Type = Double, Dynamic = False, Default = \"2366", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SEARCHINTARGET, Type = Double, Dynamic = False, Default = \"2197", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SEARCHNEXT, Type = Double, Dynamic = False, Default = \"2367", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SEARCHPREV, Type = Double, Dynamic = False, Default = \"2368", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETSEARCHFLAGS, Type = Double, Dynamic = False, Default = \"2198", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETTARGETEND, Type = Double, Dynamic = False, Default = \"2192", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETTARGETSTART, Type = Double, Dynamic = False, Default = \"2190", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_TARGETFROMSELECTION, Type = Double, Dynamic = False, Default = \"2287", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="EndPosition"
			Group="Behavior"
			Type="Integer"
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
			Name="MatchCase"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="POSIXmode"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegExMode"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartPosition"
			Group="Behavior"
			Type="Integer"
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
			Name="WholeWord"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WordStart"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
