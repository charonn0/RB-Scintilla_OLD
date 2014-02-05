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
   MenuBar         =   1166641151
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   400
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   487
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   113
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Untitled"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   443
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   239
      Underline       =   ""
      Visible         =   True
      Width           =   32
   End
   Begin SciLexer.ScintillaField ScintillaField1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      TopLine         =   ""
      Visible         =   True
      Width           =   438
   End
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
		  'Lexer = New SciLexer.ScintillaField
		  'Lexer.EmbedWithin(Self, 5, 5, Self.Width - 10, Self.Height - 10)
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditClear() As Boolean Handles EditClear.Action
			ScintillaField1.ClearAll
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditRedo() As Boolean Handles EditRedo.Action
			Call ScintillaField1.Redo
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditSelectAll() As Boolean Handles EditSelectAll.Action
			ScintillaField1.SelectAll
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditUndo() As Boolean Handles EditUndo.Action
			Call ScintillaField1.Undo
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Property, Flags = &h1
		Protected Lexer As SciLexer.ScintillaField
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  'Dim i As Integer = ScintillaField1.SendMessage(
		  'MsgBox(ScintillaField1.Text)
		  'MsgBox(Str(ScintillaField1.LineFromPosition(14)))
		  'ScintillaField1.ClearAll
		  'ScintillaField1.Lexer = SciLexer.Lexers.HTML
		  'ScintillaField1.AppendText("Hello, world!")
		  'MsgBox(ScintillaField1.CharAtPos(1))
		  ScintillaField1.SetLineMark(2, 4)
		  'ScintillaField1.AppendText("Hello, world!")
		  'ScintillaField1.Text = "Hello, world!"
		  'ScintillaField1.ReadOnly = Not ScintillaField1.ReadOnly
		  'MsgBox(ScintillaField1.GetLine(1))
		  'MsgBox(Str(ScintillaField1.CurrentLine))
		  'ScintillaField1.EOLVisible = Not ScintillaField1.EOLVisible
		  'ScintillaField1.SetLineMark(ScintillaField1.TopLine)
		  ScintillaField1.SelectRange(-1, -1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScintillaField1
	#tag Event
		Sub ScintillaEvent(EventCode As Integer)
		  Listbox1.AddRow(SciLexer.FormatCode(EventCode))
		  Listbox1.ScrollPosition = Listbox1.ListCount
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.MarginType(0) = 1
		  Me.MarginWidth(0) = 15
		  Me.MarginClickable(0) = True
		  
		  Me.MarginType(1) = 0
		  Me.MarginWidth(1) = 15
		  Me.MarginClickable(1) = True
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChanged()
		  'MsgBox("Changed")
		End Sub
	#tag EndEvent
#tag EndEvents
