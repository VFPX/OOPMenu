public oMenu
set path to ..\source
oMenu = newobject('MyMenu', 'MyMenu.vcx', '', 'oMenu')
messagebox('This demo shows creating a menu using menu subclasses.' + ;
	chr(13) + chr(13) + "After you're done viewing the menu, choose File, " + ;
	'Exit or type oMenu.Release() in the Command window.')
oMenu.Show()
