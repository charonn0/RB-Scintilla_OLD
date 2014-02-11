#tag Class
Protected Class RenderLine
	#tag Method, Flags = &h0
		Function Annotation() As Scintilla.Annotation
		  Return New Scintilla.Annotation(Me.LineNumber, SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(LineNumber As Integer, Reference As Integer)
		  SciRef = Reference
		  mLineNumber = LineNumber
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndPosition() As Integer
		  Return SciMessage(SciRef, SCI_GETLINEENDPOSITION, LineNumber, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasMarker(OtherMarker As Scintilla.Marker) As Boolean
		  Dim i As Integer = SciMessage(SciRef, SCI_MARKERGET, LineNumber, 0)
		  Return (Bitwise.ShiftLeft(OtherMarker.MarkerNumber, 1) And i) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineNumber() As Integer
		  Return mLineNumber
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveMarker(MarkerHandle As Integer)
		  Call SciMessage(SciRef, SCI_MARKERDELETE, LineNumber, MarkerHandle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetMarker(NewMarker As Scintilla.Marker) As Integer
		  Call SciMessage(SciRef, SCI_MARKERADD, LineNumber, NewMarker.MarkerNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartPosition() As Integer
		  Return SciMessage(SciRef, SCI_POSITIONFROMLINE, LineNumber, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Style() As Scintilla.Style
		  'Dim nm As Integer = SciMessage(SciRef, SCI_ANNOTATIONGETSTYLE, LineNumber, 0)
		  'Return New Scintilla.Style(nm, SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Style(Assigns NewStyle As Scintilla.Style)
		  #pragma Unused NewStyle
		  #pragma Warning "Fix Me"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tag() As Variant
		  If Tags = Nil Then Tags = New Dictionary
		  Dim i As Integer = SciMessage(SciRef, SCI_GETLINESTATE, 0, 0)
		  If Tags.HasKey(i) Then Return Tags.Value(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Tag(Assigns NewTag As Variant)
		  If Tags = Nil Then Tags = New Dictionary
		  Dim rand As New Random
		  Dim i As Integer
		  Do
		    i = Rand.InRange(1, &hFFFFFFFE)
		  Loop Until Not Tags.HasKey(i)
		  Tags.Value(i) = NewTag
		  Call SciMessage(SciRef, SCI_SETLINESTATE, mLineNumber, i)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text() As String
		  Dim len As Integer = SciMessage(SciRef, SCI_LINELENGTH, mLineNumber, 0)
		  Dim mb As New MemoryBlock(len + 1)
		  Call SciMessage(SciRef, SCI_GETLINE, mLineNumber, mb)
		  Return mb.CString(0)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event GetReference() As Integer
	#tag EndHook


	#tag Property, Flags = &h1
		Protected mLineNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared Tags As Dictionary
	#tag EndProperty


	#tag Constant, Name = SCI_GETLINE, Type = Double, Dynamic = False, Default = \"2153", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETLINEENDPOSITION, Type = Double, Dynamic = False, Default = \"2136", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_GETLINESTATE, Type = Double, Dynamic = False, Default = \"2093", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_LINELENGTH, Type = Double, Dynamic = False, Default = \"2350", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_MARKERADD, Type = Double, Dynamic = False, Default = \"2043", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_MARKERDELETE, Type = Double, Dynamic = False, Default = \"2044", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_MARKERGET, Type = Double, Dynamic = False, Default = \"2046", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_POSITIONFROMLINE, Type = Double, Dynamic = False, Default = \"2167", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_SETLINESTATE, Type = Double, Dynamic = False, Default = \"2092", Scope = Protected
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
