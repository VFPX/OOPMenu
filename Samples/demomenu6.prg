public oMenu, oMainWindow
set path to ..\source
messagebox('This demo shows creating a menu that resides in a top-level ' + ;
	'form.' + chr(13) + chr(13) + "After you're done viewing the menu, " + ;
	'choose File, Exit.')

* Create the top-level form.

oMainWindow = newobject('appMainWindow')
oMainWindow.Show()

* Create the Menu object.

oMenu = newobject('SFMenu', 'SFMenu.vcx', '', 'oMenu')
oMenu.cFormName = oMainWindow.Name

* Create the File pad.

oMenu.AddPad('SFPad', 'SFMenu.vcx', 'FilePad')
with oMenu.FilePad
	.cCaption    = '\<File'
	.cKey      = 'ALT+F'
	.cStatusBarText = 'Performs file functions'

	.AddBar('SFBar', 'SFMenu.vcx', 'FileNew')
	with .FileNew
		.cCaption    = '\<New...'
		.cKey      = 'CTRL+N'
		.cKeyText    = 'Ctrl+N'
		.cStatusBarText = 'Create a file'
		.cPictureFile  = 'newxpsmall.bmp'
		.cOnClickCommand = [messagebox('You chose File, New')]
	endwith

	.AddBar('SFBar', 'SFMenu.vcx', 'FileOpen')
	with .FileOpen
		.cCaption    = '\<Open...'
		.cKey      = 'CTRL+O'
		.cKeyText    = 'Ctrl+O'
		.cStatusBarText = 'Open a file'
		.cPictureFile  = 'openxpsmall.bmp'
		.cOnClickCommand = [messagebox('You chose File, Open')]
	endwith

	.AddSeparatorBar()

	.AddBar('SFBar', 'SFMenu.vcx', 'FileExit')
	with .FileExit
		.cCaption    = 'E\<xit'
		.cStatusBarText = 'Restore the VFP menu'
		.cOnClickCommand = 'oMainWindow.Release()'
	endwith
endwith

* Create the Edit pad.

oMenu.AddPad('SFEditPad', 'SFMenu.vcx', 'EditPad')

* Display the menu.

oMenu.Show()

read events
release oMainWindow, oMenu

define class appMainwindow as Form
	Name = 'AppMainWindow'
	ShowWindow = 2
	BackColor = rgb(128,128,128)

	procedure Unload() 
		clear events
	endproc 
enddefine
