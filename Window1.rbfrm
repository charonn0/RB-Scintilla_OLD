#tag Window
Begin Window Window1
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1854007295
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  'If SciLexer.IsAvailable Then
		  'MsgBox("Available")
		  'Else
		  'MsgBox("Not Available")
		  'End If
		  Lexer = New SciLexer.ScintillaEditor(Self, 5, 5, Self.Width - 10, Self.Height - 10)
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected Lexer As SciLexer.ScintillaEditor
	#tag EndProperty


#tag EndWindowCode

