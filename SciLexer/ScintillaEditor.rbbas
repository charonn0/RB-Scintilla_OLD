#tag Class
Protected Class ScintillaEditor
Inherits RectControl
	#tag Method, Flags = &h1000
		Sub Constructor(Parent As Window, X As Integer, Y As Integer, Width As Integer, Height As Integer)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  If SciLexer.IsAvailable Then
		    mParent = Parent
		    mHandle = SciLexer.Win32.CreateWindowEx(0, "Scintilla", "", SciLexer.Win32.WS_CHILD Or SciLexer.Win32.WS_CLIPCHILDREN Or SciLexer.Win32.WS_TABSTOP Or SciLexer.Win32.WS_VISIBLE, X, Y, Width, Height, Parent.Handle, 0, 0, Nil)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Integer
		  Return mHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parent() As Window
		  Return mParent
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mParent As Window
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
