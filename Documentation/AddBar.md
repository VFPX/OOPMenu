# AddBar

Adds a bar to the popup for this pad or bar (this is a method of [SFPad](Class%20SFPad.md) and [SFBar](Class%20SFBar.md) because bars can have submenus).

You can either add a base class [SFBar](Class%20SFBar.md) object and then manually set properties of the bar or add a subclass of SFBar. This method instantiates the specified class, adds it both to the collection and as a named member of the pad (for example, specifying "Open" as the third parameter results in a member of the pad object called Open), and returns a reference to the new bar.

## Syntax

```foxpro
o.AddBar(tcClass, tcLibrary, tcName [, tnBarNumber])
```

### Parameters

**tcClass**  
The class to use for the bar.

**tcLibrary**  
The library containing the class specified in tcClass.

**tcName**  
The name to assign to the bar.

**tnBarNumber**  
The bar number (if it isn't specified, the next available position in the popup is used).

## Example

```foxpro
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
    .AddBar('SFBar', 'SFMenu.vcx', 'FileNewProject')
    with .FileNewProject
      .cCaption = '\<Project'
      .cOnClickCommand = [messagebox('You chose File, New, Project')]
    endwith
  endwith
endwith
```
