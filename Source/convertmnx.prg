#define ccTAB	chr(9)
#define ccCRLF	chr(13) + chr(10)

define class ProcessMNX as Custom
	cMenuVariable = 'oMenu'
		&& the name of the variable the SFMenu instance is instantiated into

* Processes the specified MNX file and returns an SFMenu object for it.

	function ProcessMenu(tcMNXFile)
		local lnSelect, ;
			loException as Exception, ;
			loMenu

* Ensure a valid MNX file is specified.

		if vartype(tcMNXFile) <> 'C' or empty(tcMNXFile) or not file(tcMNXFile)
			error 'Invalid MNX file specified'
		endif vartype(tcMNXFile) <> 'C' ...

* Open the MNX file as a table.

		lnSelect = select()
		select 0
		try
			use (tcMNXFile)
		catch to loException
			error 'Cannot open MNX file: ' + loException.Message
		endtry

* Process each record.

		scan
			do case
				case OBJTYPE = 1
					loMenu = This.HandleMenu()
				case OBJTYPE = 3 and (OBJCODE = 77 or LEVELNAME = '_MSYSMENU')
					This.HandlePad(loMenu)
			endcase
		endscan

* Clean up and exit.

		use
		select (lnSelect)
		return loMenu
	endfunc

* Handle the menu.

	function HandleMenu()
		local loMenu
		loMenu          = newobject('SFMenu', 'SFMenu.vcx', '', This.cMenuVariable)
		loMenu.cSetup   = SETUP
		loMenu.cCleanup = CLEANUP
*** TODO: handle PROCEDURE
		return loMenu
	endfunc

* Handle a menu pad.

	function HandlePad(toMenu)
		local lcName, ;
			lcClass, ;
			loPad, ;
			lnBars, ;
			lnI

* Get the name for the pad. Note that _MSM* isn't a valid member name
* (AddPad adds the pad as a member with the specified name) so strip the
* leading underscore.

		lcName = evl(NAME, sys(2015))
		if upper(left(lcName, 4)) = '_MSM'
			lcName = substr(lcName, 2)
		endif upper(left(lcName, 4)) = '_MSM'

* Add the pad and set its properties.

		lcClass = iif(OBJCODE = 67, 'SFPadCommand', 'SFPad')
		loPad   = toMenu.AddPad(lcClass, 'SFMenu.vcx', lcName)
		This.SetupPad(loPad)

* Handle the popup record.

		skip
		lnBars = This.HandlePopup(loPad)

* Handle the bar records.

		if not eof()
			skip
		endif not eof()
		lnI = 1
		do while lnI <= lnBars
			llHandled = This.HandleBar(loPad)
			if lnI < lnBars or not llHandled
				skip
			endif lnI < lnBars ...
			if llHandled
				lnI = lnI + 1
			endif llHandled
		enddo while lnI <= lnBars
		return
	endfunc

* Set the pad properties.

	function SetupPad(toPad)
		with toPad
			.cCaption       = PROMPT
			.cKey           = KEYNAME
			.cStatusBarText = MESSAGE
			.cSkipFor       = SKIPFOR
			.Comment        = COMMENT
			if OBJCODE = 67
				.cOnClickCommand = COMMAND
			endif OBJCODE = 67
		endwith
*** TODO: handle cContainerPosition and cObjectPosition for NEGOTIATE clause (LOCATION field)
		return
	endfunc

* Set the popup properties for the pad and get the number of bars under the
* pad.

	function HandlePopup(toPad)
		local lnBars
		lnBars = 0
		if OBJTYPE = 2 and OBJCODE = 0
			toPad.cPopupName = NAME
			lnBars = NUMITEMS
		endif OBJTYPE = 2 ...
		return lnBars
	endfunc

* Handle a bar.

	function HandleBar(toPad)
		local llReturn, ;
			lcName, ;
			loBar
		llReturn = .T.
		do case

* If this is a separator bar, add one to the pad.

			case PROMPT == '\-'
				toPad.AddSeparatorBar()

* If this is an empty submenu (usually following a separator bar), skip it.

			case OBJTYPE = 2 and NUMITEMS = 0
				llReturn = .F.

* Get the name for the bar. Note that some reserved words (e.g. _MFI*) aren't
* valid member names (AddBar adds the bar as a member with the specified name)
* so strip the leading underscore.

			otherwise
				lcName = NAME
				do case
					case empty(lcName)
						lcName = toPad.Name + 'Bar' + alltrim(ITEMNUM)
					case upper(left(lcName, 2)) = '_M'
						lcName = substr(lcName, 2)
				endcase

* Add the bar and set its properties based on the type of bar.

				loBar = toPad.AddBar('SFBar', 'SFMenu.vcx', lcName)
				This.SetupBar(loBar)
				do case
					case OBJCODE = 67
						This.HandleCommandBar(loBar)
					case OBJCODE = 77
						This.HandleSubMenu(loBar)
					case OBJCODE = 78
						This.HandleSystemBar(loBar)
					case OBJCODE = 80
						This.HandleProcedureBar(loBar)
				endcase
		endcase
		return llReturn
	endfunc

* Handle a command bar.

	function HandleCommandBar(toBar)
		toBar.cOnClickCommand = COMMAND
		return
	endfunc

* Handle a submenu.

	function HandleSubMenu(toBar)
		local lnBars, ;
			lnI

* Handle the popup record.

		skip
		lnBars = This.HandlePopup(toBar)

* Handle the bar records.

		skip
		for lnI = 1 to lnBars
			This.HandleBar(toBar)
			if lnI < lnBars
				skip
			endif lnI < lnBars
		next lnI
		return
	endfunc

* Handle a system bar.

	function HandleSystemBar(toBar)
		toBar.cSystemBar = NAME
		return
	endfunc

* Handle a procedure bar.

	function HandleProcedureBar(toBar)
		toBar.cOnClickCommand = PROCEDURE
		return
	endfunc

* Set the bar's properties.

	function SetupBar(toBar)
		with toBar
			.cCaption       = PROMPT
			.cKey           = KEYNAME
			.cStatusBarText = MESSAGE
			.cSkipFor       = SKIPFOR
			.cKey           = KEYNAME
			.cKeyText       = KEYLABEL
			.Comment        = COMMENT
			do case
				case empty(RESNAME)
				case SYSRES = 1
					.cPictureResource = RESNAME
				otherwise
					.cPictureFile = RESNAME
			endcase
		endwith
		return
	endfunc
enddefine

* Base class for menu generators.

define class MenuGenerator as Custom
	cMenuName = ''

	function GenerateMenu(toMenu)
	endfunc
enddefine

* This menu generator creates code that uses code (i.e. in a PRG) classes for
* the menu, each pad, and each bar.

define class MenuClassGenerator as MenuGenerator
	cCodeOutput = ''
	cComment    = '*' + replicate('=', 79)
	cPRGName    = ''

* Generate the menu.

	function GenerateMenu(toMenu, tcPRGName)
		This.cPRGName = tcPRGName
		This.HandleMenu(toMenu)
		for each loPad in toMenu foxobject
			This.HandlePad(loPad)
		next loPad
	endfunc

* Handle the menu.

	protected function HandleMenu(toMenu)
		local loPads, ;
			loPad, ;
			lcCode
		lcPads = ''
		for each loPad in toMenu foxobject
			lcPads = lcPads + ccTAB + ccTAB + ccTAB + ;
				[.AddPad('] + loPad.Name + [', '] + This.cPRGName + [', '] + loPad.Name + [')] + ;
				ccCRLF
		next loPad
		lcPads = left(lcPads, len(lcPads) - 2)
		if empty(toMenu.cSetup) and empty(toMenu.cCleanup)
			lcInit = ''
		else
			text to lcInit textmerge noshow

	procedure Init(tcInstanceName)
		dodefault(tcInstanceName)
		text to This.cSetup noshow
		<<toMenu.cSetup>>
		end*text
		text to This.cCleanup noshow
		<<toMenu.cCleanup>>
		end*text
	endproc
			endtext
			lcInit = strtran(lcInit, 'end*text', 'endtext')
		endif empty(toMenu.cSetup)
		text to lcCode textmerge noshow
<<This.cComment>>
define class <<This.cMenuName>> as SFMenu of SFMenu.vcx
<<This.cComment>>
<<lcInit>>
	procedure DefineMenu
		with This
<<lcPads>>
		endwith
	endproc
enddefine

		endtext
		This.OutputCode(lcCode)
	endfunc

* Handle a pad.

	protected function HandlePad(toPad)
		local lcProperties, ;
			lcClick, ;
			lcBars, ;
			lcBarClasses, ;
			loBar, ;
			lcCode

* Get the values of the non-default properties.

		lcProperties = This.GetCodeForProperty(toPad, 'cCaption', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toPad, 'cKey', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toPad, 'cPadPosition', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toPad, 'cPopupName', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toPad, 'cSkipFor', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toPad, 'cStatusBarText', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toPad, 'lMRU', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toPad, 'Comment', ccTAB)
		do case
			case not pemstatus(toPad, 'cOnClickCommand', 5)
				lcClick = ''
			case chr(13) $ toPad.cOnClickCommand
				lcClick = ccCRLF + ccCRLF + ccTAB + 'procedure Click' + ccCRLF + ;
					ccTAB + ccTAB + toPad.cOnClickCommand + ccCRLF + ccTAB + ;
					'endproc'
			otherwise
				lcProperties = lcProperties + ;
					This.GetCodeForProperty(toPad, 'cOnClickCommand', ccTAB)
				lcClick = ''
		endcase

* Get the bar definitions.

		lcBars       = ''
		lcBarClasses = ''
		for each loBar in toPad foxobject
			if lower(loBar.Class) = 'sfseparatorbar'
				lcBars = lcBars + ccTAB + ccTAB + ccTAB + ;
					[.AddSeparatorBar()] + ccCRLF
			else
				lcBars = lcBars + ccTAB + ccTAB + ccTAB + ;
					[.AddBar('] + loBar.Name + [', '] + This.cPRGName + [', '] + loBar.Name + ;
					[')] + ccCRLF
				lcBarClasses = lcBarClasses + This.HandleBar(loBar) + ccCRLF
			endif lower(loBar.Class) = 'sfseparatorbar'
		next loBar
		lcBars       = left(lcBars,       len(lcBars)       - 2)
		lcBarClasses = left(lcBarClasses, len(lcBarClasses) - 2)

* Output the code for the pad class.		

		text to lcCode textmerge noshow
<<This.cComment>>
define class <<toPad.Name>> as SFPad of SFMenu.vcx
<<This.cComment>>
<<lcProperties>><<lcClick>>
	procedure AddBars
		with This
<<lcBars>>
		endwith
	endproc
enddefine

<<lcBarClasses>>
		endtext
		This.OutputCode(lcCode)
	endfunc

* Handle a bar.

	protected function HandleBar(toBar)
		local lcProperties, ;
			lcClick, ;
			lcBars, ;
			lcBarClasses, ;
			lcCode

* Get the values of the non-default properties.

		lcProperties = This.GetCodeForProperty(toBar, 'cBarPosition', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toBar, 'cCaption', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toBar, 'cKey', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toBar, 'cKeyText', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toBar, 'cMenuClauses', ccTAB)
		if chr(13) $ toBar.cOnClickCommand
			lcClick = ccCRLF + ccCRLF + ccTAB + 'procedure Click' + ccCRLF + ;
				ccTAB + ccTAB + toBar.cOnClickCommand + ccCRLF + ccTAB + ;
				'endproc'
		else
			lcProperties = lcProperties + ;
				This.GetCodeForProperty(toBar, 'cOnClickCommand', ccTAB)
			lcClick = ''
		endif chr(13) $ toBar.cOnClickCommand
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toBar, 'cPictureFile', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toBar, 'cPictureResource', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toBar, 'cSkipFor', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toBar, 'cStatusBarText', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toBar, 'cSystemBar', ccTAB)
		lcProperties = lcProperties + ;
			This.GetCodeForProperty(toBar, 'Comment', ccTAB)
		lcProperties = left(lcProperties, len(lcProperties) - 2)

* If this is a submenu, get the bar definitions.

		lcBars       = ''
		lcBarClasses = ''
		if toBar.Count > 0
			text to lcBars noshow flags 2

	procedure AddBars
		with This

			endtext
			for each loBar in toBar foxobject
				if lower(loBar.Class) = 'sfseparatorbar'
					lcBars = lcBars + ccTAB + ccTAB + ccTAB + ;
						[.AddSeparatorBar()] + ccCRLF
				else
					lcBars = lcBars + ccTAB + ccTAB + ccTAB + ;
						[.AddBar('] + loBar.Name + [', '', '] + loBar.Name + ;
						[')] + ccCRLF
					lcBarClasses = lcBarClasses + ccCRLF + ;
						This.HandleBar(loBar)
				endif lower(loBar.Class) = 'sfseparatorbar'
			next loBar
			text to lcBars noshow additive
		endwith
	endproc
			endtext
		endif toBar.Count > 0

* Create the code for the bar class.		

		text to lcCode textmerge noshow
<<This.cComment>>
define class <<toBar.Name>> as SFBar of SFMenu.vcx
<<This.cComment>>
<<lcProperties>><<lcClick>><<lcBars>>
enddefine
<<lcBarClasses>>
		endtext
		return lcCode
	endfunc

* Get code to set a property to a non-blank value.

	protected function GetCodeForProperty(toPad, tcProperty, tcPrefix)
		local lcCode
		luValue = evaluate('toPad.' + tcProperty)
		if empty(luValue)
			lcCode = ''
		else
			lcCode = tcPrefix + tcProperty + ' = '
			do case
				case vartype(luValue) <> 'C'
					lcCode = lcCode + transform(luValue)
				case left(luValue, 1) = '"'
					lcCode = lcCode + '[' + substr(luValue, 2, len(luValue) - 2) + ']'
				case '[' $ luValue
					lcCode = lcCode + '"' + luValue + '"'
				otherwise
					lcCode = lcCode + '[' + luValue + ']'
			endcase
			lcCode = lcCode + ccCRLF
		endif empty(luValue)
		return lcCode
	endfunc

* Output the code.

	function OutputCode(tcCode)
		This.cCodeOutput = This.cCodeOutput + tcCode + ccCRLF
	endfunc
enddefine
