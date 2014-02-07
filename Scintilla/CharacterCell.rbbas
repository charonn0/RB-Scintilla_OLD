#tag Class
Protected Class CharacterCell
	#tag Method, Flags = &h0
		Sub Constructor(Position As Integer, Reference As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Style() As Scintilla.Style
		  Dim s As Integer = SciMessage(SciRef, SCI_GETSTYLEAT, CharPosition, 0)
		  Return New Scintilla.Style(s, SciRef)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Style(Assigns NewStyle As Scintilla.Style)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected CharPosition As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SciRef As Integer
	#tag EndProperty


	#tag Constant, Name = SCI_GETSTYLEAT, Type = Double, Dynamic = False, Default = \"2010", Scope = Protected
	#tag EndConstant


End Class
#tag EndClass
