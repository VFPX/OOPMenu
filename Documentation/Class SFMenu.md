# Class SFMenu

**Parent Class: [SFMenuBase](Class%20SFMenuBase.md)**

The top-level class of a menu hierarchy. A menu consists of pads, which are represented by SFPad objects. Pads, in turn, consist of bars, which are represented by SFBar objects. A bar may have a submenu, so it too can contain bars.

SFMenu, SFPad, and SFBar are all subclasses of SFMenuBase, which is a subclass of Collection. Since they are all collection based, it's easy to reference member objects by position using the Item method or reference all members using FOR EACH. In addition to being in the collection, member objects are referenced as named members. For example, if a menu has File, Edit, Tools, and Help pads, you could reference the Tools pad using any one of the following:

```foxpro
oMenu.Tools
oMenu.Item('Tools')
oMenu.Item(3)
```

When you instantiate SFMenu (or a subclass) into an object, pass the name of that object to the Init method; this is needed so the complete hierarchy can be used in methods of other menu objects. See the example below.

> Note: the object that contains the menu must be a public variable; it cannot be a member of an object since you can't use "This" in the menuing system. For example, the following will not work (you will get an error when you click a menu item):

```foxpro
This.oMenu = newobject('SFMenu', 'SFMenu.vcx', '', 'This.oMenu')
```

There are a couple of ways you can add pads to the menu:

* Manually add pad objects using the AddPad method. This can be done in code that instantiates the menu object or, in a subclass of SFMenu, in the DefineMenu method.

* Use a menu factory object to instantiate a menu object and add pads and bars. A menu factory is usually data-driven, such as from an MNX file. Menu factories are not currently documented in this help file.

To create a menu in a top-level form, set the cFormName property.

## Methods

| Method     | Description                           |
|------------|---------------------------------------|
| [AddPad](AddPad.md)     | Adds a pad to the menu.               |
| [DefineMenu](DefineMenu.md) | Defines the desired pads in the menu. |
| [Refresh](Refresh.md)    | Refreshes the display of the menu.    |
| [Show](Show.md)       | Displays the menu.                    |

## Properties

| Property  | Description                              |
|-----------|------------------------------------------|
| [cFormName](cFormName.md) | Specifies the name of a top-level form in which to put the menu. |
| [cMenuName](cMenuName.md) | Specifies the name of the menu.          |
| cCleanup | Cleanup code to execute after the menu is defined when Show is called. |
| cSetup | Setup code to execute before the menu is defined when Show is called. |

## Example

```foxpro
* Instantiate the menu object.

oMenu = newobject('SFMenu', 'SFMenu.vcx', '', 'oMenu')

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
    .cOnClickCommand = [messagebox('You chose File, New')]
  endwith

  .AddBar('SFBar', 'SFMenu.vcx', 'FileOpen')
  with .FileOpen
    .cCaption        = '\<Open...'
    .cKey            = 'CTRL+O'
    .cKeyText        = 'Ctrl+O'
    .cStatusBarText  = 'Open a file'
    .cPictureFile    = 'openxpsmall.bmp'
    .cOnClickCommand = [messagebox('You chose File, Open')]
  endwith

  .AddSeparatorBar()

  .AddBar('SFBar', 'SFMenu.vcx', 'FileExit')
  with .FileExit
    .cCaption        = 'E\<xit'
    .cStatusBarText  = 'Restore the VFP menu'
    .cOnClickCommand = 'oMenu.Release()'
  endwith
endwith

* Create the Edit pad.

oMenu.AddPad('SFEditPad', 'SFMenu.vcx', 'EditPad')

* Display the menu.

oMenu.Show()
```