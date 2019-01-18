* Create a collection of menu/toolbar implementation objects.

public oFunctions
set path to ..\source
oFunctions = createobject('Collection')
oFunctions.Add(newobject('MyOpenFunction', 'MyMenu.vcx'), 'FileOpenFunction')
oFunctions.Add(newobject('MyNewFunction',  'MyMenu.vcx'), 'FileNewFunction')

* Run the test form.

public oTestForm
do form TestForm name oTestForm noshow

* Create the menu.

public oMenu
oMenu = newobject('SFMenu', 'SFMenu.vcx', '', 'oMenu')
oMenu.cFormName = oTestForm.Name

* Create the File pad.

oMenu.AddPad('SFPad', 'SFMenu.vcx', 'FilePad')
with oMenu.FilePad
	.cCaption       = '\<File'
	.cKey           = 'ALT+F'
	.cStatusBarText = 'Performs file functions'

	.AddBar('SFBar', 'SFMenu.vcx', 'FileNew')
	with .FileNew
		.cCaption        = '\<New...'
		.cKey            = 'CTRL+N'
		.cKeyText        = 'Ctrl+N'
		.cStatusBarText  = 'Create a file'
		.cPictureFile    = 'newxpsmall.bmp'
		.oImplementation = oFunctions.Item('FileNewFunction')
	endwith

	.AddBar('SFBar', 'SFMenu.vcx', 'FileOpen')
	with .FileOpen
		.cCaption        = '\<Open...'
		.cKey            = 'CTRL+O'
		.cKeyText        = 'Ctrl+O'
		.cStatusBarText  = 'Open a file'
		.cPictureFile    = 'openxpsmall.bmp'
		.oImplementation = oFunctions.Item('FileOpenFunction')
	endwith

	.AddSeparatorBar()

	.AddBar('SFBar', 'SFMenu.vcx', 'FileExit')
	with .FileExit
		.cCaption        = 'E\<xit'
		.cStatusBarText  = 'Restore the VFP menu'
		.cOnClickCommand = 'oMenu.Release()' + chr(13) + 'oTestForm.Release()'
	endwith
endwith

* Create the Edit pad.

oMenu.AddPad('SFEditPad', 'SFMenu.vcx', 'EditPad')

* Display the form.

messagebox('This demo shows using an implementation object to coordinate ' + ;
	'menu and toolbar items.' + chr(13) + chr(13) + ;
	"After you're done viewing the form, choose File, Exit.")
oMenu.Show()
oTestForm.Show()
