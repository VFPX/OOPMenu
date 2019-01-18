# AddPad

Adds a pad to the menu.

You can either add a base class [SFPad](Class%20SFPad.md) object and then manually add bars to the new pad or add a subclass of SFPad. This method instantiates the specified class, adds it both to the collection and as a named member of the menu object (for example, specifying "FilePad" as the third parameter results in a member of the menu object called FilePad), and returns a reference to the new pad.

## Syntax

o.AddPad(tcClass, tcLibrary, tcName)

### Parameters

**tcClass**  
The class to use for the pad.

**tcLibrary**  
The library containing the class specified in tcClass.

**tcName**  
The name to assign to the pad.

## Example

```foxpro
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
endwith
```

## See Also

[Class SFMenu](Class%20SFMenu.md)  
