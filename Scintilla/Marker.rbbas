#tag Class
Protected Class Marker
	#tag Method, Flags = &h0
		Sub Constructor(MarkerNum As Integer, Reference As Integer)
		  MarkerHandle = MarkerNum
		  SciRef = Reference
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MarkerNumber() As Integer
		  Return MarkerHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PixMap(Assigns RawPixMapData As String)
		  Dim mb As New MemoryBlock(RawPixMapData.LenB + 1)
		  mb.CString(0) = RawPixMapData
		  Call SciMessage(SciRef, SCI_MARKERDEFINEPIXMAP, MarkerNumber, mb)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  'Dim mb As New MemoryBlock(4)
			  'Dim i As Integer = RaiseEvent SendMessage(SCI_STYLEGETBACK, Me.StyleNumber, 0)
			  'mb.Int32Value(0) = i
			  'Return RGB(mb.Byte(0), mb.Byte(1), mb.Byte(2))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim mb As New MemoryBlock(4)
			  mb.ColorValue(0, 32) = value
			  Call SciMessage(SciRef, SCI_MARKERSETBACK, MarkerNumber, mb.Int32Value(0))
			End Set
		#tag EndSetter
		Background As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  'Dim mb As New MemoryBlock(4)
			  'Dim i As Integer = RaiseEvent SendMessage(SCI_STYLEGETFORE, Me.StyleNumber, 0)
			  'mb.ColorValue(0, 32) = Color(i)
			  'Return mb.ColorValue(0, 32)
			  ''RGB(mb.Byte(0), mb.Byte(1), mb.Byte(2))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  'Call SciMessage(SciWindow, SCI_STYLESETFORE, Me.StyleNumber, UInt32(value))
			  Dim mb As New MemoryBlock(4)
			  mb.Byte(0) = value.Red
			  mb.Byte(1) = value.Green
			  mb.Byte(2) = value.Blue
			  Call SciMessage(SciRef, SCI_MARKERSETFORE, MarkerNumber, mb.Int32Value(0))
			End Set
		#tag EndSetter
		Foreground As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected MarkerHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  Call SciMessage(SciRef, SCI_MARKERDEFINE, MarkerNumber, value)
			End Set
		#tag EndSetter
		Type As Integer
	#tag EndComputedProperty


	#tag Constant, Name = SCI_MARKERDEFINE, Type = Double, Dynamic = False, Default = \"2040", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_MARKERDEFINEPIXMAP, Type = Double, Dynamic = False, Default = \"2049", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_MARKERSETBACK, Type = Double, Dynamic = False, Default = \"2042", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCI_MARKERSETFORE, Type = Double, Dynamic = False, Default = \"2041", Scope = Protected
	#tag EndConstant


	#tag Enum, Name = Markers, Type = Integer, Flags = &h0
		CIRCLE
		  ROUNDRECT
		  ARROW
		  SMALLRECT
		  SHORTARROW
		  EMPTY
		  ARROWDOWN
		  MINUS
		  PLUS
		  VLINE
		  LCORNER
		  TCORNER
		  BOXPLUS
		  BOXPLUSCONNECTED
		  BOXMINUS
		  BOXMINUSCONNECTED
		  LCORNERCURVE
		  TCORNERCURVE
		  CIRCLEPLUS
		  CIRCLEPLUSCONNECTED
		  CIRCLEMINUS
		  CIRCLEMINUSCONNECTED
		  BACKGROUND
		  DOTDOTDOT
		  ARROWS
		  PIXMAP
		  FOLDEREND=25
		  FOLDEROPENMID
		  FOLDERMIDTAIL
		  FOLDERSUB
		  FOLDER
		  FOLDEROPEN
		SC_MARK_CHARACTER=1000
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Background"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Foreground"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
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
	#tag EndViewBehavior
End Class
#tag EndClass
