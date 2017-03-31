lparameters tcMNXFile, ;
	toMenu
local lnSelect
*** handle not specified or doesn't exist
lnSelect = select()
select 0
try
	use (tcMNXFile)
catch to loException
*** handle failure
endtry
if not empty(alias())
	scan
		do case
			case OBJTYPE = 1
				do HandleMenu with toMenu
			case OBJTYPE = 3 and OBJCODE = 77
				do HandlePad with toMenu
		endcase
	endscan
	use
endif not empty(alias())

* Clean up and exit.

select (lnSelect)
return

function HandleMenu(toMenu)
*** HANDLE SETUP and CLEANUP
return

function HandlePad(toMenu)
local loPad, ;
	lnBars, ;
	lnI
loPad = toMenu.AddPad('SFPad', 'SFMenu.vcx', NAME)
SetupPad(loPad)

* Handle the popup record.

skip
lnBars = HandlePopup(loPad)

* Handle the bar records.

skip
for lnI = 1 to lnBars
	.HandleBar(loPad)
	skip
next lnI
return

function SetupPad(toPad)
with toPad
	.cCaption       = PROMPT
	.cKey           = KEYNAME
	.cStatusBarText = MESSAGE
*** only if not empty?
	.cSkipFor       = SKIPFOR
*** handle NEGOTIATE (LOCATION field): container and object
*** handle COMMENT
endwith
return

function HandlePopup(toPad)
local lnBars
lnBars = 0
if OBJTYPE = 2 and OBJCODE = 0
	toPad.cPopupName = NAME
	lnBars = NUMITEMS
endif OBJTYPE = 2 ...
return lnBars

function HandleBar(toPad)
local loBar
if PROMPT = '\-'
	loBar = .AddSeparatorBar()
else
	loBar = .AddBar('SFBar', 'SFMenu.vcx', NAME)
	do case
		case OBJCODE = 67
			HandleCommandBar(loBar)
		case OBJCODE = 77
			HandleSubMenu(loBar)
		case OBJCODE = 78
			HandleSystemBar(loBar)
		case OBJCODE = 80
			HandleProcedureBar(loBar)
	endcase
	SetupBar(loBar)
endif PROMPT = '\-'
return

function HandleCommandBar(toBar)
*** COMMAND CONTAINS CODE
*** HANDLE BAR #
return

function HandleSubMenu(toBar)
*** HANDLE BAR #
return

function HandleSystemBar(toBar)
toBar.cSystemBar = NAME
return

function HandleProcedureBar(toBar)
*** PROCEDURE CONTAINS CODE TO EXECUTE
*** HANDLE BAR #
return

function SetupBar(toBar)
with toBar
	.cCaption       = PROMPT
*** do these two apply to submenu?
	.cKey           = KEYNAME
	.cKeyText       = KEYLABEL
	.cStatusBarText = MESSAGE
*** only if not empty?
	.cSkipFor       = SKIPFOR
	do case
		case empty(RESNAME)
		case SYSRES = 1
			.cPictureResource = RESNAME
		otherwise
			.cPictureFile = RESNAME
	endcase
*** other properties?
endwith
return
