#tag Window
Begin Window Window1
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   4.0e+2
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
   Width           =   8.17e+2
   Begin ScintillaField ScintillaField1
      AutoDeactivate  =   True
      CaretPosition   =   ""
      Enabled         =   True
      EOLVisible      =   ""
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
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      TopLine         =   ""
      Visible         =   True
      Width           =   438
   End
   Begin Separator Separator1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   254
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   440
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   80
      Visible         =   True
      Width           =   11
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   457
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   "Caret Pos:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   6
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   62
   End
   Begin TextField CaratPos
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   525
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   6
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   51
   End
   Begin CheckBox ShowEOL
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Show EOL"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   581
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   6
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox ReadOnly
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Read Only"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   693
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   6
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin TextArea TextArea1
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   100
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   457
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   291
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   353
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   457
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      Text            =   "Top Line:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   31
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   62
   End
   Begin TextField TopLine
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   525
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   31
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   51
   End
   Begin CheckBox CanRedo
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Can Redo"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   581
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   32
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox Canundo
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Can Undo"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   693
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   32
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   450
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      Text            =   "Current Line:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   56
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   69
   End
   Begin TextField CurrentLine
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   525
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   56
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   51
   End
   Begin CheckBox IsDirty
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Is dirty"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   581
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   56
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   81
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   457
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "Margin 1\rMargin 2\rMargin 3\rMargin 4"
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   88
      Underline       =   ""
      Value           =   0
      Visible         =   True
      Width           =   353
   End
   Begin Timer GUIUpdater
      Height          =   32
      Index           =   -2147483648
      Left            =   839
      LockedInPosition=   False
      Mode            =   1
      Period          =   500
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -30
      Width           =   32
   End
   Begin Oval Oval1
      AutoDeactivate  =   True
      BorderColor     =   &h000000
      BorderWidth     =   1
      Enabled         =   True
      FillColor       =   &hFFFFFF
      Height          =   28
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   457
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      Top             =   171
      Visible         =   True
      Width           =   28
   End
   Begin PopupMenu textFont
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   498
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   174
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin PopupMenu textSize
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   623
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   174
      Underline       =   False
      Visible         =   True
      Width           =   46
   End
   Begin PushButton PushButton2
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
      Left            =   926
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -30
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  'If Scintilla.IsAvailable Then
		  'MsgBox("Available")
		  'Else
		  'MsgBox("Not Available")
		  'End If
		  'Lexer = New ScintillaField
		  'Lexer.EmbedWithin(Self, 5, 5, Self.Width - 10, Self.Height - 10)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  'Dim i As Integer = ScintillaField1.Height
		  'Break
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


	#tag Method, Flags = &h0
		Function GetRefHandler(Sender As MarginEdit) As ScintillaField
		  #pragma Unused Sender
		  Return ScintillaField1
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Lexer As ScintillaField
	#tag EndProperty

	#tag Property, Flags = &h0
		Marker As Scintilla.Marker
	#tag EndProperty


#tag EndWindowCode

#tag Events ScintillaField1
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
	#tag Event
		Sub MarginClicked(MarginNumber As Integer, LineNumber As Integer)
		  'Dim i As Integer = Me.AddMarker(LineNumber, Scintilla.Markers.BoxPlus)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CanRedo
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Canundo
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events IsDirty
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events TabPanel1
	#tag Event
		Sub Open()
		  For i As Integer = 0 To 3
		    Dim m1 As New MarginEdit
		    AddHandler m1.GetReference, WeakAddressOf GetRefHandler
		    m1.MarginNumber = i
		    m1.EmbedWithinPanel(Me, i, 11, 23, m1.Width, m1.Height)
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GUIUpdater
	#tag Event
		Sub Action()
		  CaratPos.Text = Format(ScintillaField1.CaretPosition, "###,###,###,##0")
		  TopLine.Text = Format(ScintillaField1.TopLine, "###,###,###,##0")
		  CurrentLine.Text = Format(ScintillaField1.CurrentLine, "###,###,###,##0")
		  ShowEOL.Value = ScintillaField1.EOLVisible
		  CanRedo.Value = ScintillaField1.CanRedo
		  CanUndo.Value = ScintillaField1.CanUndo
		  ReadOnly.Value = ScintillaField1.ReadOnly
		  textSize.ListIndex = ScintillaField1.Style(0).TextSize - 9
		  Dim f As String = ScintillaField1.Style(0).TextFont.Trim
		  For i As Integer = 0 To textFont.ListCount - 1
		    If textFont.List(i) = f Then
		      textFont.ListIndex = i
		      Exit For
		    End If
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Oval1
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Dim c As Color = me.FillColor
		  Call SelectColor(c, "Choose a Color")
		  me.FillColor = c
		  ScintillaField1.Style(0).TextColor = c
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events textFont
	#tag Event
		Sub Open()
		  Me.AddRow("Font")
		  Me.ListIndex = 0
		  Dim fonts() As String
		  For i As Integer = 1 To FontCount - 1
		    Dim textfont As String = Font(i)
		    fonts.Append(textfont)
		  Next
		  fonts.Sort
		  For i As Integer = 0 To fonts.Ubound
		    Me.AddRow(fonts(i))
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Me.ListIndex >= 1 Then
		    Dim s As Scintilla.Style = ScintillaField1.Style(0)
		    s.TextFont = Me.Text
		    ScintillaField1.SetRangeStyle(0, 5) = s
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events textSize
	#tag Event
		Sub Open()
		  'Me.AddRow("Size")
		  Me.ListIndex = 0
		  For i As Integer = 1 To 54
		    Me.AddRow(Str(i))
		  Next
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  'If Me.ListIndex >= 1 Then
		  ScintillaField1.Style(0).TextSize = CDbl(Me.Text)
		  'End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  Dim rand As New Random
		  For i As Integer = 0 To 4
		    ScintillaField1.Style(i).TextColor = RGB(Rand.InRange(0, 255), Rand.InRange(0, 255), Rand.InRange(0, 255))
		    If Rand.InRange(0, 1) = 1 Then
		      ScintillaField1.Style(i).Bold = True
		    Else
		      ScintillaField1.Style(i).Bold = False
		    End If
		    If Rand.InRange(0, 1) = 1 Then
		      ScintillaField1.Style(i).Italic = True
		    Else
		      ScintillaField1.Style(i).Italic = False
		    End If
		  Next
		  Dim x As Integer
		  For i As Integer = 0 To ScintillaField1.Text.Len
		    ScintillaField1.SetRangeStyle(x, x + 1) = ScintillaField1.Style(x)
		    If x = 4 Then
		      x = 0
		    Else
		      x = x + 1
		    End If
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
