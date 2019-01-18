# oImplementation

A reference to an implementation object. This is a property of [SFBar](Class%20SFBar.md) and SFPadCommand.

Implementation objects are subclasses of [SFMenuFunction](Class%20SFMenuFunction.md) that perform some action when a menu item or toolbar button is selected. The advantage of using an implementation object rather than filling in one of the properties that specify the action ([cActiveFormMethod](cActiveFormMethod.md), [cAppObjectMethod](cAppObjectMethod.md), or [cOnClickCommand](cOnClickCommand.md)) is separating the display of the menu from its functionality. This allows you to vary the implementation (change the code in the implementation class or specify a different class) without changing the appearance of the menu item. It also allows you to coordinate menu items and toolbars without duplicating code, as both items will execute the code in the implementation object and use the [lEnabled](lEnabled.md) and [lVisible](lVisible.md) properties of this object to determine whether the bar is enabled and visible.

## Example

```foxpro
* Create a collection of menu/toolbar implementation objects.

public oFunctions
oFunctions = createobject('Collection')
oFunctions.Add(newobject('MyOpenFunction', 'MyMenu.vcx'), 'FileOpenFunction')
oFunctions.Add(newobject('MyNewFunction',  'MyMenu.vcx'), 'FileNewFunction')

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
endwith
```
