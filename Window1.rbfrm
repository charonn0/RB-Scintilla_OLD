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
   Begin SciLexer.ScintillaEditor ScintillaEditor1
      AutoDeactivate  =   True
      CaretPosition   =   ""
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      TopLine         =   ""
      Visible         =   True
      Width           =   463
   End
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
      Left            =   467
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
      Width           =   8
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
		  'Lexer = New SciLexer.ScintillaEditor
		  'Lexer.EmbedWithin(Self, 5, 5, Self.Width - 10, Self.Height - 10)
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditClear() As Boolean Handles EditClear.Action
			ScintillaEditor1.ClearAll
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditRedo() As Boolean Handles EditRedo.Action
			Call ScintillaEditor1.Redo
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditSelectAll() As Boolean Handles EditSelectAll.Action
			ScintillaEditor1.SelectAll
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditUndo() As Boolean Handles EditUndo.Action
			Call ScintillaEditor1.Undo
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Property, Flags = &h1
		Protected Lexer As SciLexer.ScintillaEditor
	#tag EndProperty


#tag EndWindowCode

#tag Events ScintillaEditor1
	#tag Event
		Sub ScintillaEvent(EventCode As Integer)
		  Listbox1.AddRow(SciLexer.FormatCode(EventCode))
		  Listbox1.ScrollPosition = Listbox1.ListCount
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  'Dim i As Integer = ScintillaEditor1.SendMessage(
		  'MsgBox(ScintillaEditor1.Text)
		  'MsgBox(Str(ScintillaEditor1.LineFromPosition(14)))
		  'ScintillaEditor1.ClearAll
		  ScintillaEditor1.Lexer = SciLexer.Lexers.HTML
		End Sub
	#tag EndEvent
#tag EndEvents
