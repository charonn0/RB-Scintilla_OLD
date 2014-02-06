#tag Module
Protected Module SciLexer
	#tag ExternalMethod, Flags = &h21
		Private Declare Function CallWindowProc Lib "User32" Alias "CallWindowProcW" (WindowProc As Integer, HWND As Integer, msg As Integer, wParam As Ptr, lParam As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function CreateWindowEx Lib "User32" Alias "CreateWindowExW" (ExStyle As Integer, ClassName As WString, WindowName As WString, Style As Integer, X As Integer, Y As Integer, Width As Integer, Height As Integer, Parent As Integer, Menu As Integer, Instance As Integer, Param As Ptr) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function FormatCode(code As Integer) As String
		  Select Case code
		  Case -1
		    Return "INVALID_POSITION"
		  Case 2000
		    Return "SCI_START"
		  Case 3000
		    Return "SCI_OPTIONAL_START"
		  Case 4000
		    Return "SCI_LEXER_START"
		  Case 2001
		    Return "SCI_ADDTEXT"
		  Case 2002
		    Return "SCI_ADDSTYLEDTEXT"
		  Case 2003
		    Return "SCI_INSERTTEXT"
		  Case 2004
		    Return "SCI_CLEARALL"
		  Case 2005
		    Return "SCI_CLEARDOCUMENTSTYLE"
		  Case 2006
		    Return "SCI_GETLENGTH"
		  Case 2007
		    Return "SCI_GETCHARAT"
		  Case 2008
		    Return "SCI_GETCURRENTPOS"
		  Case 2009
		    Return "SCI_GETANCHOR"
		  Case 2010
		    Return "SCI_GETSTYLEAT"
		  Case 2011
		    Return "SCI_REDO"
		  Case 2012
		    Return "SCI_SETUNDOCOLLECTION"
		  Case 2013
		    Return "SCI_SELECTALL"
		  Case 2014
		    Return "SCI_SETSAVEPOINT"
		  Case 2015
		    Return "SCI_GETSTYLEDTEXT"
		  Case 2016
		    Return "SCI_CANREDO"
		  Case 2017
		    Return "SCI_MARKERLINEFROMHANDLE"
		  Case 2018
		    Return "SCI_MARKERDELETEHANDLE"
		  Case 2019
		    Return "SCI_GETUNDOCOLLECTION"
		  Case 0
		    Return "SCWS_INVISIBLE"
		  Case 1
		    Return "SCWS_VISIBLEALWAYS"
		  Case 2
		    Return "SCWS_VISIBLEAFTERINDENT"
		  Case 2020
		    Return "SCI_GETVIEWWS"
		  Case 2021
		    Return "SCI_SETVIEWWS"
		  Case 2022
		    Return "SCI_POSITIONFROMPOINT"
		  Case 2023
		    Return "SCI_POSITIONFROMPOINTCLOSE"
		  Case 2024
		    Return "SCI_GOTOLINE"
		  Case 2025
		    Return "SCI_GOTOPOS"
		  Case 2026
		    Return "SCI_SETANCHOR"
		  Case 2027
		    Return "SCI_GETCURLINE"
		  Case 2028
		    Return "SCI_GETENDSTYLED"
		  Case 0
		    Return "SC_EOL_CRLF"
		  Case 1
		    Return "SC_EOL_CR"
		  Case 2
		    Return "SC_EOL_LF"
		  Case 2029
		    Return "SCI_CONVERTEOLS"
		  Case 2030
		    Return "SCI_GETEOLMODE"
		  Case 2031
		    Return "SCI_SETEOLMODE"
		  Case 2032
		    Return "SCI_STARTSTYLING"
		  Case 2033
		    Return "SCI_SETSTYLING"
		  Case 2034
		    Return "SCI_GETBUFFEREDDRAW"
		  Case 2035
		    Return "SCI_SETBUFFEREDDRAW"
		  Case 2036
		    Return "SCI_SETTABWIDTH"
		  Case 2121
		    Return "SCI_GETTABWIDTH"
		  Case 65001
		    Return "SC_CP_UTF8"
		  Case 1
		    Return "SC_CP_DBCS"
		  Case 2037
		    Return "SCI_SETCODEPAGE"
		  Case 2039
		    Return "SCI_SETUSEPALETTE"
		  Case 31
		    Return "MARKER_MAX"
		  Case 0
		    Return "SC_MARK_CIRCLE"
		  Case 1
		    Return "SC_MARK_ROUNDRECT"
		  Case 2
		    Return "SC_MARK_ARROW"
		  Case 3
		    Return "SC_MARK_SMALLRECT"
		  Case 4
		    Return "SC_MARK_SHORTARROW"
		  Case 5
		    Return "SC_MARK_EMPTY"
		  Case 6
		    Return "SC_MARK_ARROWDOWN"
		  Case 7
		    Return "SC_MARK_MINUS"
		  Case 8
		    Return "SC_MARK_PLUS"
		  Case 9
		    Return "SC_MARK_VLINE"
		  Case 10
		    Return "SC_MARK_LCORNER"
		  Case 11
		    Return "SC_MARK_TCORNER"
		  Case 12
		    Return "SC_MARK_BOXPLUS"
		  Case 13
		    Return "SC_MARK_BOXPLUSCONNECTED"
		  Case 14
		    Return "SC_MARK_BOXMINUS"
		  Case 15
		    Return "SC_MARK_BOXMINUSCONNECTED"
		  Case 16
		    Return "SC_MARK_LCORNERCURVE"
		  Case 17
		    Return "SC_MARK_TCORNERCURVE"
		  Case 18
		    Return "SC_MARK_CIRCLEPLUS"
		  Case 19
		    Return "SC_MARK_CIRCLEPLUSCONNECTED"
		  Case 20
		    Return "SC_MARK_CIRCLEMINUS"
		  Case 21
		    Return "SC_MARK_CIRCLEMINUSCONNECTED"
		  Case 22
		    Return "SC_MARK_BACKGROUND"
		  Case 23
		    Return "SC_MARK_DOTDOTDOT"
		  Case 24
		    Return "SC_MARK_ARROWS"
		  Case 25
		    Return "SC_MARK_PIXMAP"
		  Case 10000
		    Return "SC_MARK_CHARACTER"
		  Case 25
		    Return "SC_MARKNUM_FOLDEREND"
		  Case 26
		    Return "SC_MARKNUM_FOLDEROPENMID"
		  Case 27
		    Return "SC_MARKNUM_FOLDERMIDTAIL"
		  Case 28
		    Return "SC_MARKNUM_FOLDERTAIL"
		  Case 29
		    Return "SC_MARKNUM_FOLDERSUB"
		  Case 30
		    Return "SC_MARKNUM_FOLDER"
		  Case 31
		    Return "SC_MARKNUM_FOLDEROPEN"
		  Case &hFE000000
		    Return "SC_MASK_FOLDERS"
		  Case 2040
		    Return "SCI_MARKERDEFINE"
		  Case 2041
		    Return "SCI_MARKERSETFORE"
		  Case 2042
		    Return "SCI_MARKERSETBACK"
		  Case 2043
		    Return "SCI_MARKERADD"
		  Case 2044
		    Return "SCI_MARKERDELETE"
		  Case 2045
		    Return "SCI_MARKERDELETEALL"
		  Case 2046
		    Return "SCI_MARKERGET"
		  Case 2047
		    Return "SCI_MARKERNEXT"
		  Case 2048
		    Return "SCI_MARKERPREVIOUS"
		  Case 2049
		    Return "SCI_MARKERDEFINEPIXMAP"
		  Case 0
		    Return "SC_MARGIN_SYMBOL"
		  Case 1
		    Return "SC_MARGIN_NUMBER"
		  Case 2240
		    Return "SCI_SETMARGINTYPEN"
		  Case 2241
		    Return "SCI_GETMARGINTYPEN"
		  Case 2242
		    Return "SCI_SETMARGINWIDTHN"
		  Case 2243
		    Return "SCI_GETMARGINWIDTHN"
		  Case 2244
		    Return "SCI_SETMARGINMASKN"
		  Case 2245
		    Return "SCI_GETMARGINMASKN"
		  Case 2246
		    Return "SCI_SETMARGINSENSITIVEN"
		  Case 2247
		    Return "SCI_GETMARGINSENSITIVEN"
		  Case 32
		    Return "STYLE_DEFAULT"
		  Case 33
		    Return "STYLE_LINENUMBER"
		  Case 34
		    Return "STYLE_BRACELIGHT"
		  Case 35
		    Return "STYLE_BRACEBAD"
		  Case 36
		    Return "STYLE_CONTROLCHAR"
		  Case 37
		    Return "STYLE_INDENTGUIDE"
		  Case 39
		    Return "STYLE_LASTPREDEFINED"
		  Case 127
		    Return "STYLE_MAX"
		  Case 0
		    Return "SC_CHARSET_ANSI"
		  Case 1
		    Return "SC_CHARSET_DEFAULT"
		  Case 186
		    Return "SC_CHARSET_BALTIC"
		  Case 136
		    Return "SC_CHARSET_CHINESEBIG5"
		  Case 238
		    Return "SC_CHARSET_EASTEUROPE"
		  Case 134
		    Return "SC_CHARSET_GB2312"
		  Case 161
		    Return "SC_CHARSET_GREEK"
		  Case 129
		    Return "SC_CHARSET_HANGUL"
		  Case 77
		    Return "SC_CHARSET_MAC"
		  Case 255
		    Return "SC_CHARSET_OEM"
		  Case 204
		    Return "SC_CHARSET_RUSSIAN"
		  Case 128
		    Return "SC_CHARSET_SHIFTJIS"
		  Case 2
		    Return "SC_CHARSET_SYMBOL"
		  Case 162
		    Return "SC_CHARSET_TURKISH"
		  Case 130
		    Return "SC_CHARSET_JOHAB"
		  Case 177
		    Return "SC_CHARSET_HEBREW"
		  Case 178
		    Return "SC_CHARSET_ARABIC"
		  Case 163
		    Return "SC_CHARSET_VIETNAMESE"
		  Case 222
		    Return "SC_CHARSET_THAI"
		  Case 2050
		    Return "SCI_STYLECLEARALL"
		  Case 2051
		    Return "SCI_STYLESETFORE"
		  Case 2052
		    Return "SCI_STYLESETBACK"
		  Case 2053
		    Return "SCI_STYLESETBOLD"
		  Case 2054
		    Return "SCI_STYLESETITALIC"
		  Case 2055
		    Return "SCI_STYLESETSIZE"
		  Case 2056
		    Return "SCI_STYLESETFONT"
		  Case 2057
		    Return "SCI_STYLESETEOLFILLED"
		  Case 2058
		    Return "SCI_STYLERESETDEFAULT"
		  Case 2059
		    Return "SCI_STYLESETUNDERLINE"
		  Case 0
		    Return "SC_CASE_MIXED"
		  Case 1
		    Return "SC_CASE_UPPER"
		  Case 2
		    Return "SC_CASE_LOWER"
		  Case 2060
		    Return "SCI_STYLESETCASE"
		  Case 2066
		    Return "SCI_STYLESETCHARACTERSET"
		  Case 2409
		    Return "SCI_STYLESETHOTSPOT"
		  Case 2067
		    Return "SCI_SETSELFORE"
		  Case 2068
		    Return "SCI_SETSELBACK"
		  Case 2069
		    Return "SCI_SETCARETFORE"
		  Case 2070
		    Return "SCI_ASSIGNCMDKEY"
		  Case 2071
		    Return "SCI_CLEARCMDKEY"
		  Case 2072
		    Return "SCI_CLEARALLCMDKEYS"
		  Case 2073
		    Return "SCI_SETSTYLINGEX"
		  Case 2074
		    Return "SCI_STYLESETVISIBLE"
		  Case 2075
		    Return "SCI_GETCARETPERIOD"
		  Case 2076
		    Return "SCI_SETCARETPERIOD"
		  Case 2077
		    Return "SCI_SETWORDCHARS"
		  Case 2078
		    Return "SCI_BEGINUNDOACTION"
		  Case 2079
		    Return "SCI_ENDUNDOACTION"
		  Case 7
		    Return "INDIC_MAX"
		  Case 0
		    Return "INDIC_PLAIN"
		  Case 1
		    Return "INDIC_SQUIGGLE"
		  Case 2
		    Return "INDIC_TT"
		  Case 3
		    Return "INDIC_DIAGONAL"
		  Case 4
		    Return "INDIC_STRIKE"
		  Case 5
		    Return "INDIC_HIDDEN"
		  Case 6
		    Return "INDIC_BOX"
		  Case &h20
		    Return "INDIC0_MASK"
		  Case &h40
		    Return "INDIC1_MASK"
		  Case &h80
		    Return "INDIC2_MASK"
		  Case &hE0
		    Return "INDICS_MASK"
		  Case 2080
		    Return "SCI_INDICSETSTYLE"
		  Case 2081
		    Return "SCI_INDICGETSTYLE"
		  Case 2082
		    Return "SCI_INDICSETFORE"
		  Case 2083
		    Return "SCI_INDICGETFORE"
		  Case 2084
		    Return "SCI_SETWHITESPACEFORE"
		  Case 2085
		    Return "SCI_SETWHITESPACEBACK"
		  Case 2090
		    Return "SCI_SETSTYLEBITS"
		  Case 2091
		    Return "SCI_GETSTYLEBITS"
		  Case 2092
		    Return "SCI_SETLINESTATE"
		  Case 2093
		    Return "SCI_GETLINESTATE"
		  Case 2094
		    Return "SCI_GETMAXLINESTATE"
		  Case 2095
		    Return "SCI_GETCARETLINEVISIBLE"
		  Case 2096
		    Return "SCI_SETCARETLINEVISIBLE"
		  Case 2097
		    Return "SCI_GETCARETLINEBACK"
		  Case 2098
		    Return "SCI_SETCARETLINEBACK"
		  Case 2099
		    Return "SCI_STYLESETCHANGEABLE"
		  Case 2100
		    Return "SCI_AUTOCSHOW"
		  Case 2101
		    Return "SCI_AUTOCCANCEL"
		  Case 2102
		    Return "SCI_AUTOCACTIVE"
		  Case 2103
		    Return "SCI_AUTOCPOSSTART"
		  Case 2104
		    Return "SCI_AUTOCCOMPLETE"
		  Case 2105
		    Return "SCI_AUTOCSTOPS"
		  Case 2106
		    Return "SCI_AUTOCSETSEPARATOR"
		  Case 2107
		    Return "SCI_AUTOCGETSEPARATOR"
		  Case 2108
		    Return "SCI_AUTOCSELECT"
		  Case 2110
		    Return "SCI_AUTOCSETCANCELATSTART"
		  Case 2111
		    Return "SCI_AUTOCGETCANCELATSTART"
		  Case 2112
		    Return "SCI_AUTOCSETFILLUPS"
		  Case 2113
		    Return "SCI_AUTOCSETCHOOSESINGLE"
		  Case 2114
		    Return "SCI_AUTOCGETCHOOSESINGLE"
		  Case 2115
		    Return "SCI_AUTOCSETIGNORECASE"
		  Case 2116
		    Return "SCI_AUTOCGETIGNORECASE"
		  Case 2117
		    Return "SCI_USERLISTSHOW"
		  Case 2118
		    Return "SCI_AUTOCSETAUTOHIDE"
		  Case 2119
		    Return "SCI_AUTOCGETAUTOHIDE"
		  Case 2270
		    Return "SCI_AUTOCSETDROPRESTOFWORD"
		  Case 2271
		    Return "SCI_AUTOCGETDROPRESTOFWORD"
		  Case 2405
		    Return "SCI_REGISTERIMAGE"
		  Case 2408
		    Return "SCI_CLEARREGISTEREDIMAGES"
		  Case 2285
		    Return "SCI_AUTOCGETTYPESEPARATOR"
		  Case 2286
		    Return "SCI_AUTOCSETTYPESEPARATOR"
		  Case 2122
		    Return "SCI_SETINDENT"
		  Case 2123
		    Return "SCI_GETINDENT"
		  Case 2124
		    Return "SCI_SETUSETABS"
		  Case 2125
		    Return "SCI_GETUSETABS"
		  Case 2126
		    Return "SCI_SETLINEINDENTATION"
		  Case 2127
		    Return "SCI_GETLINEINDENTATION"
		  Case 2128
		    Return "SCI_GETLINEINDENTPOSITION"
		  Case 2129
		    Return "SCI_GETCOLUMN"
		  Case 2130
		    Return "SCI_SETHSCROLLBAR"
		  Case 2131
		    Return "SCI_GETHSCROLLBAR"
		  Case 2132
		    Return "SCI_SETINDENTATIONGUIDES"
		  Case 2133
		    Return "SCI_GETINDENTATIONGUIDES"
		  Case 2134
		    Return "SCI_SETHIGHLIGHTGUIDE"
		  Case 2135
		    Return "SCI_GETHIGHLIGHTGUIDE"
		  Case 2136
		    Return "SCI_GETLINEENDPOSITION"
		  Case 2137
		    Return "SCI_GETCODEPAGE"
		  Case 2138
		    Return "SCI_GETCARETFORE"
		  Case 2139
		    Return "SCI_GETUSEPALETTE"
		  Case 2140
		    Return "SCI_GETREADONLY"
		  Case 2141
		    Return "SCI_SETCURRENTPOS"
		  Case 2142
		    Return "SCI_SETSELECTIONSTART"
		  Case 2143
		    Return "SCI_GETSELECTIONSTART"
		  Case 2144
		    Return "SCI_SETSELECTIONEND"
		  Case 2145
		    Return "SCI_GETSELECTIONEND"
		  Case 2146
		    Return "SCI_SETPRINTMAGNIFICATION"
		  Case 2147
		    Return "SCI_GETPRINTMAGNIFICATION"
		  Case 0
		    Return "SC_PRINT_NORMAL"
		  Case 1
		    Return "SC_PRINT_INVERTLIGHT"
		  Case 2
		    Return "SC_PRINT_BLACKONWHITE"
		  Case 3
		    Return "SC_PRINT_COLOURONWHITE"
		  Case 4
		    Return "SC_PRINT_COLOURONWHITEDEFAULTBG"
		  Case 2148
		    Return "SCI_SETPRINTCOLOURMODE"
		  Case 2149
		    Return "SCI_GETPRINTCOLOURMODE"
		  Case 2
		    Return "SCFIND_WHOLEWORD"
		  Case 4
		    Return "SCFIND_MATCHCASE"
		  Case &h00100000
		    Return "SCFIND_WORDSTART"
		  Case &h00200000
		    Return "SCFIND_REGEXP"
		  Case &h00400000
		    Return "SCFIND_POSIX"
		  Case 2150
		    Return "SCI_FINDTEXT"
		  Case 2151
		    Return "SCI_FORMATRANGE"
		  Case 2152
		    Return "SCI_GETFIRSTVISIBLELINE"
		  Case 2153
		    Return "SCI_GETLINE"
		  Case 2154
		    Return "SCI_GETLINECOUNT"
		  Case 2155
		    Return "SCI_SETMARGINLEFT"
		  Case 2156
		    Return "SCI_GETMARGINLEFT"
		  Case 2157
		    Return "SCI_SETMARGINRIGHT"
		  Case 2158
		    Return "SCI_GETMARGINRIGHT"
		  Case 2159
		    Return "SCI_GETMODIFY"
		  Case 2160
		    Return "SCI_SETSEL"
		  Case 2161
		    Return "SCI_GETSELTEXT"
		  Case 2162
		    Return "SCI_GETTEXTRANGE"
		  Case 2163
		    Return "SCI_HIDESELECTION"
		  Case 2164
		    Return "SCI_POINTXFROMPOSITION"
		  Case 2165
		    Return "SCI_POINTYFROMPOSITION"
		  Case 2166
		    Return "SCI_LINEFROMPOSITION"
		  Case 2167
		    Return "SCI_POSITIONFROMLINE"
		  Case 2168
		    Return "SCI_LINESCROLL"
		  Case 2169
		    Return "SCI_SCROLLCARET"
		  Case 2170
		    Return "SCI_REPLACESEL"
		  Case 2171
		    Return "SCI_SETREADONLY"
		  Case 2172
		    Return "SCI_NULL"
		  Case 2173
		    Return "SCI_CANPASTE"
		  Case 2174
		    Return "SCI_CANUNDO"
		  Case 2175
		    Return "SCI_EMPTYUNDOBUFFER"
		  Case 2176
		    Return "SCI_UNDO"
		  Case 2177
		    Return "SCI_CUT"
		  Case 2178
		    Return "SCI_COPY"
		  Case 2179
		    Return "SCI_PASTE"
		  Case 2180
		    Return "SCI_CLEAR"
		  Case 2181
		    Return "SCI_SETTEXT"
		  Case 2182
		    Return "SCI_GETTEXT"
		  Case 2183
		    Return "SCI_GETTEXTLENGTH"
		  Case 2184
		    Return "SCI_GETDIRECTFUNCTION"
		  Case 2185
		    Return "SCI_GETDIRECTPOINTER"
		  Case 2186
		    Return "SCI_SETOVERTYPE"
		  Case 2187
		    Return "SCI_GETOVERTYPE"
		  Case 2188
		    Return "SCI_SETCARETWIDTH"
		  Case 2189
		    Return "SCI_GETCARETWIDTH"
		  Case 2190
		    Return "SCI_SETTARGETSTART"
		  Case 2191
		    Return "SCI_GETTARGETSTART"
		  Case 2192
		    Return "SCI_SETTARGETEND"
		  Case 2193
		    Return "SCI_GETTARGETEND"
		  Case 2194
		    Return "SCI_REPLACETARGET"
		  Case 2195
		    Return "SCI_REPLACETARGETRE"
		  Case 2197
		    Return "SCI_SEARCHINTARGET"
		  Case 2198
		    Return "SCI_SETSEARCHFLAGS"
		  Case 2199
		    Return "SCI_GETSEARCHFLAGS"
		  Case 2200
		    Return "SCI_CALLTIPSHOW"
		  Case 2201
		    Return "SCI_CALLTIPCANCEL"
		  Case 2202
		    Return "SCI_CALLTIPACTIVE"
		  Case 2203
		    Return "SCI_CALLTIPPOSSTART"
		  Case 2204
		    Return "SCI_CALLTIPSETHLT"
		  Case 2205
		    Return "SCI_CALLTIPSETBACK"
		  Case 2206
		    Return "SCI_CALLTIPSETFORE"
		  Case 2207
		    Return "SCI_CALLTIPSETFOREHLT"
		  Case 2220
		    Return "SCI_VISIBLEFROMDOCLINE"
		  Case 2221
		    Return "SCI_DOCLINEFROMVISIBLE"
		  Case &h400
		    Return "SC_FOLDLEVELBASE"
		  Case &h1000
		    Return "SC_FOLDLEVELWHITEFLAG"
		  Case &h2000
		    Return "SC_FOLDLEVELHEADERFLAG"
		  Case &h4000
		    Return "SC_FOLDLEVELBOXHEADERFLAG"
		  Case &h8000
		    Return "SC_FOLDLEVELBOXFOOTERFLAG"
		  Case &h10000
		    Return "SC_FOLDLEVELCONTRACTED"
		  Case &h20000
		    Return "SC_FOLDLEVELUNINDENT"
		  Case &h0FFF
		    Return "SC_FOLDLEVELNUMBERMASK"
		  Case 2222
		    Return "SCI_SETFOLDLEVEL"
		  Case 2223
		    Return "SCI_GETFOLDLEVEL"
		  Case 2224
		    Return "SCI_GETLASTCHILD"
		  Case 2225
		    Return "SCI_GETFOLDPARENT"
		  Case 2226
		    Return "SCI_SHOWLINES"
		  Case 2227
		    Return "SCI_HIDELINES"
		  Case 2228
		    Return "SCI_GETLINEVISIBLE"
		  Case 2229
		    Return "SCI_SETFOLDEXPANDED"
		  Case 2230
		    Return "SCI_GETFOLDEXPANDED"
		  Case 2231
		    Return "SCI_TOGGLEFOLD"
		  Case 2232
		    Return "SCI_ENSUREVISIBLE"
		  Case &h0002
		    Return "SC_FOLDFLAG_LINEBEFORE_EXPANDED"
		  Case &h0004
		    Return "SC_FOLDFLAG_LINEBEFORE_CONTRACTED"
		  Case &h0008
		    Return "SC_FOLDFLAG_LINEAFTER_EXPANDED"
		  Case &h0010
		    Return "SC_FOLDFLAG_LINEAFTER_CONTRACTED"
		  Case &h0040
		    Return "SC_FOLDFLAG_LEVELNUMBERS"
		  Case &h0001
		    Return "SC_FOLDFLAG_BOX"
		  Case 2233
		    Return "SCI_SETFOLDFLAGS"
		  Case 2234
		    Return "SCI_ENSUREVISIBLEENFORCEPOLICY"
		  Case 2260
		    Return "SCI_SETTABINDENTS"
		  Case 2261
		    Return "SCI_GETTABINDENTS"
		  Case 2262
		    Return "SCI_SETBACKSPACEUNINDENTS"
		  Case 2263
		    Return "SCI_GETBACKSPACEUNINDENTS"
		  Case 10000000
		    Return "SC_TIME_FOREVER"
		  Case 2264
		    Return "SCI_SETMOUSEDWELLTIME"
		  Case 2265
		    Return "SCI_GETMOUSEDWELLTIME"
		  Case 2266
		    Return "SCI_WORDSTARTPOSITION"
		  Case 2267
		    Return "SCI_WORDENDPOSITION"
		  Case 0
		    Return "SC_WRAP_NONE"
		  Case 1
		    Return "SC_WRAP_WORD"
		  Case 2268
		    Return "SCI_SETWRAPMODE"
		  Case 2269
		    Return "SCI_GETWRAPMODE"
		  Case 0
		    Return "SC_CACHE_NONE"
		  Case 1
		    Return "SC_CACHE_CARET"
		  Case 2
		    Return "SC_CACHE_PAGE"
		  Case 3
		    Return "SC_CACHE_DOCUMENT"
		  Case 2272
		    Return "SCI_SETLAYOUTCACHE"
		  Case 2273
		    Return "SCI_GETLAYOUTCACHE"
		  Case 2274
		    Return "SCI_SETSCROLLWIDTH"
		  Case 2275
		    Return "SCI_GETSCROLLWIDTH"
		  Case 2276
		    Return "SCI_TEXTWIDTH"
		  Case 2277
		    Return "SCI_SETENDATLASTLINE"
		  Case 2278
		    Return "SCI_GETENDATLASTLINE"
		  Case 2279
		    Return "SCI_TEXTHEIGHT"
		  Case 2280
		    Return "SCI_SETVSCROLLBAR"
		  Case 2281
		    Return "SCI_GETVSCROLLBAR"
		  Case 2282
		    Return "SCI_APPENDTEXT"
		  Case 2283
		    Return "SCI_GETTWOPHASEDRAW"
		  Case 2284
		    Return "SCI_SETTWOPHASEDRAW"
		  Case 2287
		    Return "SCI_TARGETFROMSELECTION"
		  Case 2288
		    Return "SCI_LINESJOIN"
		  Case 2289
		    Return "SCI_LINESSPLIT"
		  Case 2290
		    Return "SCI_SETFOLDMARGINCOLOUR"
		  Case 2291
		    Return "SCI_SETFOLDMARGINHICOLOUR"
		  Case 2300
		    Return "SCI_LINEDOWN"
		  Case 2301
		    Return "SCI_LINEDOWNEXTEND"
		  Case 2302
		    Return "SCI_LINEUP"
		  Case 2303
		    Return "SCI_LINEUPEXTEND"
		  Case 2304
		    Return "SCI_CHARLEFT"
		  Case 2305
		    Return "SCI_CHARLEFTEXTEND"
		  Case 2306
		    Return "SCI_CHARRIGHT"
		  Case 2307
		    Return "SCI_CHARRIGHTEXTEND"
		  Case 2308
		    Return "SCI_WORDLEFT"
		  Case 2309
		    Return "SCI_WORDLEFTEXTEND"
		  Case 2310
		    Return "SCI_WORDRIGHT"
		  Case 2311
		    Return "SCI_WORDRIGHTEXTEND"
		  Case 2312
		    Return "SCI_HOME"
		  Case 2313
		    Return "SCI_HOMEEXTEND"
		  Case 2314
		    Return "SCI_LINEEND"
		  Case 2315
		    Return "SCI_LINEENDEXTEND"
		  Case 2316
		    Return "SCI_DOCUMENTSTART"
		  Case 2317
		    Return "SCI_DOCUMENTSTARTEXTEND"
		  Case 2318
		    Return "SCI_DOCUMENTEND"
		  Case 2319
		    Return "SCI_DOCUMENTENDEXTEND"
		  Case 2320
		    Return "SCI_PAGEUP"
		  Case 2321
		    Return "SCI_PAGEUPEXTEND"
		  Case 2322
		    Return "SCI_PAGEDOWN"
		  Case 2323
		    Return "SCI_PAGEDOWNEXTEND"
		  Case 2324
		    Return "SCI_EDITTOGGLEOVERTYPE"
		  Case 2325
		    Return "SCI_CANCEL"
		  Case 2326
		    Return "SCI_DELETEBACK"
		  Case 2327
		    Return "SCI_TAB"
		  Case 2328
		    Return "SCI_BACKTAB"
		  Case 2329
		    Return "SCI_NEWLINE"
		  Case 2330
		    Return "SCI_FORMFEED"
		  Case 2331
		    Return "SCI_VCHOME"
		  Case 2332
		    Return "SCI_VCHOMEEXTEND"
		  Case 2333
		    Return "SCI_ZOOMIN"
		  Case 2334
		    Return "SCI_ZOOMOUT"
		  Case 2335
		    Return "SCI_DELWORDLEFT"
		  Case 2336
		    Return "SCI_DELWORDRIGHT"
		  Case 2337
		    Return "SCI_LINECUT"
		  Case 2338
		    Return "SCI_LINEDELETE"
		  Case 2339
		    Return "SCI_LINETRANSPOSE"
		  Case 2404
		    Return "SCI_LINEDUPLICATE"
		  Case 2340
		    Return "SCI_LOWERCASE"
		  Case 2341
		    Return "SCI_UPPERCASE"
		  Case 2342
		    Return "SCI_LINESCROLLDOWN"
		  Case 2343
		    Return "SCI_LINESCROLLUP"
		  Case 2344
		    Return "SCI_DELETEBACKNOTLINE"
		  Case 2345
		    Return "SCI_HOMEDISPLAY"
		  Case 2346
		    Return "SCI_HOMEDISPLAYEXTEND"
		  Case 2347
		    Return "SCI_LINEENDDISPLAY"
		  Case 2348
		    Return "SCI_LINEENDDISPLAYEXTEND"
		  Case 2349
		    Return "SCI_HOMEWRAP"
		  Case 2450
		    Return "SCI_HOMEWRAPEXTEND"
		  Case 2451
		    Return "SCI_LINEENDWRAP"
		  Case 2452
		    Return "SCI_LINEENDWRAPEXTEND"
		  Case 2453
		    Return "SCI_VCHOMEWRAP"
		  Case 2454
		    Return "SCI_VCHOMEWRAPEXTEND"
		  Case 2455
		    Return "SCI_LINECOPY"
		  Case 2401
		    Return "SCI_MOVECARETINSIDEVIEW"
		  Case 2350
		    Return "SCI_LINELENGTH"
		  Case 2351
		    Return "SCI_BRACEHIGHLIGHT"
		  Case 2352
		    Return "SCI_BRACEBADLIGHT"
		  Case 2353
		    Return "SCI_BRACEMATCH"
		  Case 2355
		    Return "SCI_GETVIEWEOL"
		  Case 2356
		    Return "SCI_SETVIEWEOL"
		  Case 2357
		    Return "SCI_GETDOCPOINTER"
		  Case 2358
		    Return "SCI_SETDOCPOINTER"
		  Case 2359
		    Return "SCI_SETMODEVENTMASK"
		  Case 0
		    Return "EDGE_NONE"
		  Case 1
		    Return "EDGE_LINE"
		  Case 2
		    Return "EDGE_BACKGROUND"
		  Case 2360
		    Return "SCI_GETEDGECOLUMN"
		  Case 2361
		    Return "SCI_SETEDGECOLUMN"
		  Case 2362
		    Return "SCI_GETEDGEMODE"
		  Case 2363
		    Return "SCI_SETEDGEMODE"
		  Case 2364
		    Return "SCI_GETEDGECOLOUR"
		  Case 2365
		    Return "SCI_SETEDGECOLOUR"
		  Case 2366
		    Return "SCI_SEARCHANCHOR"
		  Case 2367
		    Return "SCI_SEARCHNEXT"
		  Case 2368
		    Return "SCI_SEARCHPREV"
		  Case 2370
		    Return "SCI_LINESONSCREEN"
		  Case 2371
		    Return "SCI_USEPOPUP"
		  Case 2372
		    Return "SCI_SELECTIONISRECTANGLE"
		  Case 2373
		    Return "SCI_SETZOOM"
		  Case 2374
		    Return "SCI_GETZOOM"
		  Case 2375
		    Return "SCI_CREATEDOCUMENT"
		  Case 2376
		    Return "SCI_ADDREFDOCUMENT"
		  Case 2377
		    Return "SCI_RELEASEDOCUMENT"
		  Case 2378
		    Return "SCI_GETMODEVENTMASK"
		  Case 2380
		    Return "SCI_SETFOCUS"
		  Case 2381
		    Return "SCI_GETFOCUS"
		  Case 2382
		    Return "SCI_SETSTATUS"
		  Case 2383
		    Return "SCI_GETSTATUS"
		  Case 2384
		    Return "SCI_SETMOUSEDOWNCAPTURES"
		  Case 2385
		    Return "SCI_GETMOUSEDOWNCAPTURES"
		  Case -1
		    Return "SC_CURSORNORMAL"
		  Case 4
		    Return "SC_CURSORWAIT"
		  Case 2386
		    Return "SCI_SETCURSOR"
		  Case 2387
		    Return "SCI_GETCURSOR"
		  Case 2388
		    Return "SCI_SETCONTROLCHARSYMBOL"
		  Case 2389
		    Return "SCI_GETCONTROLCHARSYMBOL"
		  Case 2390
		    Return "SCI_WORDPARTLEFT"
		  Case 2391
		    Return "SCI_WORDPARTLEFTEXTEND"
		  Case 2392
		    Return "SCI_WORDPARTRIGHT"
		  Case 2393
		    Return "SCI_WORDPARTRIGHTEXTEND"
		  Case &h01
		    Return "VISIBLE_SLOP"
		  Case &h04
		    Return "VISIBLE_STRICT"
		  Case 2394
		    Return "SCI_SETVISIBLEPOLICY"
		  Case 2395
		    Return "SCI_DELLINELEFT"
		  Case 2396
		    Return "SCI_DELLINERIGHT"
		  Case 2397
		    Return "SCI_SETXOFFSET"
		  Case 2398
		    Return "SCI_GETXOFFSET"
		  Case 2399
		    Return "SCI_CHOOSECARETX"
		  Case 2400
		    Return "SCI_GRABFOCUS"
		  Case &h01
		    Return "CARET_SLOP"
		  Case &h04
		    Return "CARET_STRICT"
		  Case &h10
		    Return "CARET_JUMPS"
		  Case &h08
		    Return "CARET_EVEN"
		  Case 2402
		    Return "SCI_SETXCARETPOLICY"
		  Case 2403
		    Return "SCI_SETYCARETPOLICY"
		  Case 2406
		    Return "SCI_SETPRINTWRAPMODE"
		  Case 2407
		    Return "SCI_GETPRINTWRAPMODE"
		  Case 2410
		    Return "SCI_SETHOTSPOTACTIVEFORE"
		  Case 2411
		    Return "SCI_SETHOTSPOTACTIVEBACK"
		  Case 2412
		    Return "SCI_SETHOTSPOTACTIVEUNDERLINE"
		  Case 2421
		    Return "SCI_SETHOTSPOTSINGLELINE"
		  Case 2413
		    Return "SCI_PARADOWN"
		  Case 2414
		    Return "SCI_PARADOWNEXTEND"
		  Case 2415
		    Return "SCI_PARAUP"
		  Case 2416
		    Return "SCI_PARAUPEXTEND"
		  Case 2417
		    Return "SCI_POSITIONBEFORE"
		  Case 2418
		    Return "SCI_POSITIONAFTER"
		  Case 2419
		    Return "SCI_COPYRANGE"
		  Case 2420
		    Return "SCI_COPYTEXT"
		  Case 0
		    Return "SC_SEL_STREAM"
		  Case 1
		    Return "SC_SEL_RECTANGLE"
		  Case 2
		    Return "SC_SEL_LINES"
		  Case 2422
		    Return "SCI_SETSELECTIONMODE"
		  Case 2423
		    Return "SCI_GETSELECTIONMODE"
		  Case 2424
		    Return "SCI_GETLINESELSTARTPOSITION"
		  Case 2425
		    Return "SCI_GETLINESELENDPOSITION"
		  Case 2426
		    Return "SCI_LINEDOWNRECTEXTEND"
		  Case 2427
		    Return "SCI_LINEUPRECTEXTEND"
		  Case 2428
		    Return "SCI_CHARLEFTRECTEXTEND"
		  Case 2429
		    Return "SCI_CHARRIGHTRECTEXTEND"
		  Case 2430
		    Return "SCI_HOMERECTEXTEND"
		  Case 2431
		    Return "SCI_VCHOMERECTEXTEND"
		  Case 2432
		    Return "SCI_LINEENDRECTEXTEND"
		  Case 2433
		    Return "SCI_PAGEUPRECTEXTEND"
		  Case 2434
		    Return "SCI_PAGEDOWNRECTEXTEND"
		  Case 2435
		    Return "SCI_STUTTEREDPAGEUP"
		  Case 2436
		    Return "SCI_STUTTEREDPAGEUPEXTEND"
		  Case 2437
		    Return "SCI_STUTTEREDPAGEDOWN"
		  Case 2438
		    Return "SCI_STUTTEREDPAGEDOWNEXTEND"
		  Case 2439
		    Return "SCI_WORDLEFTEND"
		  Case 2440
		    Return "SCI_WORDLEFTENDEXTEND"
		  Case 2441
		    Return "SCI_WORDRIGHTEND"
		  Case 2442
		    Return "SCI_WORDRIGHTENDEXTEND"
		  Case 2443
		    Return "SCI_SETWHITESPACECHARS"
		  Case 2444
		    Return "SCI_SETCHARSDEFAULT"
		  Case 2445
		    Return "SCI_AUTOCGETCURRENT"
		  Case 2446
		    Return "SCI_ALLOCATE"
		  Case 3001
		    Return "SCI_STARTRECORD"
		  Case 3002
		    Return "SCI_STOPRECORD"
		  Case 4001
		    Return "SCI_SETLEXER"
		  Case 4002
		    Return "SCI_GETLEXER"
		  Case 4003
		    Return "SCI_COLOURISE"
		  Case 4004
		    Return "SCI_SETPROPERTY"
		  Case 8
		    Return "KEYWORDSET_MAX"
		  Case 4005
		    Return "SCI_SETKEYWORDS"
		  Case 4006
		    Return "SCI_SETLEXERLANGUAGE"
		  Case 4007
		    Return "SCI_LOADLEXERLIBRARY"
		  Case &h1
		    Return "SC_MOD_INSERTTEXT"
		  Case &h2
		    Return "SC_MOD_DELETETEXT"
		  Case &h4
		    Return "SC_MOD_CHANGESTYLE"
		  Case &h8
		    Return "SC_MOD_CHANGEFOLD"
		  Case &h10
		    Return "SC_PERFORMED_USER"
		  Case &h20
		    Return "SC_PERFORMED_UNDO"
		  Case &h40
		    Return "SC_PERFORMED_REDO"
		  Case &h100
		    Return "SC_LASTSTEPINUNDOREDO"
		  Case &h200
		    Return "SC_MOD_CHANGEMARKER"
		  Case &h400
		    Return "SC_MOD_BEFOREINSERT"
		  Case &h800
		    Return "SC_MOD_BEFOREDELETE"
		  Case &hF77
		    Return "SC_MODEVENTMASKALL"
		  Case 768
		    Return "SCEN_CHANGE"
		  Case 512
		    Return "SCEN_SETFOCUS"
		  Case 256
		    Return "SCEN_KILLFOCUS"
		  Case 300
		    Return "SCK_DOWN"
		  Case 301
		    Return "SCK_UP"
		  Case 302
		    Return "SCK_LEFT"
		  Case 303
		    Return "SCK_RIGHT"
		  Case 304
		    Return "SCK_HOME"
		  Case 305
		    Return "SCK_END"
		  Case 306
		    Return "SCK_PRIOR"
		  Case 307
		    Return "SCK_NEXT"
		  Case 308
		    Return "SCK_DELETE"
		  Case 309
		    Return "SCK_INSERT"
		  Case 7
		    Return "SCK_ESCAPE"
		  Case 8
		    Return "SCK_BACK"
		  Case 9
		    Return "SCK_TAB"
		  Case 13
		    Return "SCK_RETURN"
		  Case 310
		    Return "SCK_ADD"
		  Case 311
		    Return "SCK_SUBTRACT"
		  Case 312
		    Return "SCK_DIVIDE"
		  Case 1
		    Return "SCMOD_SHIFT"
		  Case 2
		    Return "SCMOD_CTRL"
		  Case 4
		    Return "SCMOD_ALT"
		  Case 2000
		    Return "SCN_STYLENEEDED"
		  Case 2001
		    Return "SCN_CHARADDED"
		  Case 2002
		    Return "SCN_SAVEPOINTREACHED"
		  Case 2003
		    Return "SCN_SAVEPOINTLEFT"
		  Case 2004
		    Return "SCN_MODIFYATTEMPTRO"
		  Case 2005
		    Return "SCN_KEY"
		  Case 2006
		    Return "SCN_DOUBLECLICK"
		  Case 2007
		    Return "SCN_UPDATEUI"
		  Case 2008
		    Return "SCN_MODIFIED"
		  Case 2009
		    Return "SCN_MACRORECORD"
		  Case 2010
		    Return "SCN_MARGINCLICK"
		  Case 2011
		    Return "SCN_NEEDSHOWN"
		  Case 2013
		    Return "SCN_PAINTED"
		  Case 2014
		    Return "SCN_USERLISTSELECTION"
		  Case 2015
		    Return "SCN_URIDROPPED"
		  Case 2016
		    Return "SCN_DWELLSTART"
		  Case 2017
		    Return "SCN_DWELLEND"
		  Case 2018
		    Return "SCN_ZOOM"
		  Case 2019
		    Return "SCN_HOTSPOTCLICK"
		  Case 2020
		    Return "SCN_HOTSPOTDOUBLECLICK"
		  Case 2021
		    Return "SCN_CALLTIPCLICK"
		  Else
		    Return "Unknown"
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsAvailable() As Boolean
		  ' IMPORTANT: THIS METHOD MUST BE CALLED IN ORDER TO INITIALIZE SCINTILLA.
		  ' Calling System.IsFunctionAvailable is equivalent to calling LoadLibrary and GetProcAddress
		  ' which is how Scintilla initializes itself
		  Return System.IsFunctionAvailable("Scintilla_DirectFunction", "SciLexer")
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function SendMessage Lib "User32" Alias "SendMessageA" (HWND As Integer, Message As UInt32, WParam As Boolean, LParam As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function SendMessage Lib "User32" Alias "SendMessageA" (HWND As Integer, Message As UInt32, WParam As Integer, LParam As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function SendMessage Lib "User32" Alias "SendMessageA" (HWND As Integer, Message As UInt32, WParam As Ptr, LParam As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function SetWindowLong Lib "User32" Alias "SetWindowLongW" (HWND As Integer, Index As Integer, NewLong As Ptr) As Integer
	#tag EndExternalMethod


	#tag Constant, Name = GWL_WNDPROC, Type = Double, Dynamic = False, Default = \"-4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = INVALID_HANDLE_VALUE, Type = Double, Dynamic = False, Default = \"&hffffffff", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_CREATE, Type = Double, Dynamic = False, Default = \"&h0001", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_DESTROY, Type = Double, Dynamic = False, Default = \"&h0002", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_NCCREATE, Type = Double, Dynamic = False, Default = \"&h0081", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_NOTIFY, Type = Double, Dynamic = False, Default = \"&h004E", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_SIZE, Type = Double, Dynamic = False, Default = \"&h0005", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_SIZING, Type = Double, Dynamic = False, Default = \"&h0214", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_CHILD, Type = Double, Dynamic = False, Default = \"&h40000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_CLIPCHILDREN, Type = Double, Dynamic = False, Default = \"&h02000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_TABSTOP, Type = Double, Dynamic = False, Default = \"&h00010000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_VISIBLE, Type = Double, Dynamic = False, Default = \"&h10000000", Scope = Private
	#tag EndConstant


	#tag Structure, Name = CharacterRange, Flags = &h1
		cpMin As Integer
		cpMax As Integer
	#tag EndStructure

	#tag Structure, Name = RECT, Flags = &h1
		left As Integer
		  top As Integer
		  right As Integer
		bottom As Integer
	#tag EndStructure

	#tag Structure, Name = SCNotification, Flags = &h1
		HWND As Integer
		  ID As Integer
		  Code As Integer
		  Position As Integer
		  Ch As Integer
		  Modifiers As Integer
		  ModificationType As Integer
		  Text As Ptr
		  Length As Integer
		  LinesAdded As Integer
		  Message As Integer
		  WParam As Ptr
		  LParam As Ptr
		  Line As Integer
		  FoldLevelNow As Integer
		  FoldLevelPrev As Integer
		  Margin As Integer
		  ListType As Integer
		  X As Integer
		  Y As Integer
		  Token As Integer
		  AnnotatedLinesAdded As Integer
		Updated As Integer
	#tag EndStructure

	#tag Structure, Name = TextRange, Flags = &h1
		Range As CharacterRange
		Text As Ptr
	#tag EndStructure


	#tag Enum, Name = Lexers, Type = Integer, Flags = &h1
		CONTAINER
		  NULL
		  PYTHON
		  CPP
		  HTML
		  XML
		  PERL
		  SQL
		  VB
		  PROPERTIES
		  ERRORLIST
		  MAKEFILE
		  BATCH
		  XCODE
		  LATEX
		  LUA
		  DIFF
		  CONF
		  PASCAL
		  AVE
		  ADA
		  LISP
		  RUBY
		  EIFFEL
		  EIFFELKW
		  TCL
		  NNCRONTAB
		  BULLANT
		  VBSCRIPT
		  BAAN
		  MATLAB
		  SCRIPTOL
		  ASM
		  CPPNOCASE
		  FORTRAN
		  F77
		  CSS
		  POV
		  LOUT
		  ESCRIPT
		  PS
		  NSIS
		  MMIXAL
		  CLW
		  CLWNOCASE
		  LOT
		  YAML
		  TEX
		  METAPOST
		  POWERBASIC
		  FORTH
		  ERLANG
		  OCTAVE
		  MSSQL
		  VERILOG
		  KIX
		  GUI4CLI
		  SPECMAN
		  AU3
		  APDL
		  BASH
		  ASN1
		  VHDL
		  CAML
		  BLITZBASIC
		  PUREBASIC
		  HASKELL
		  PHPSCRIPT
		  TADS3
		  REBOL
		  SMALLTALK
		  FLAGSHIP
		  CSOUND
		  FREEBASIC
		  INNOSETUP
		  OPAL
		  SPICE
		  D
		  CMAKE
		  GAP
		  PLM
		  PROGRESS
		  ABAQUS
		  ASYMPTOTE
		  R
		  MAGIK
		  POWERSHELL
		  MYSQL
		  PO
		  TAL
		  COBOL
		  TACL
		  SORCUS
		  POWERPRO
		  NIMROD
		  SML
		  MARKDOWN
		  TXT2TAGS
		  A68K
		AUTOMATIC
	#tag EndEnum


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
End Module
#tag EndModule
