# cPictureResource

The system menu bar name for the picture to use for the bar.

## Example

```foxpro
oMenu.AddPad('SFPad', 'SFMenu.vcx', 'FilePad')
with oMenu.FilePad
  .cCaption       = '\<File'
  .cKey           = 'ALT+F'
  .cStatusBarText = 'Performs file functions'

  .AddBar('SFBar', 'SFMenu.vcx', 'FileNew')
  with .FileNew
    .cCaption         = '\<New...'
    .cKey             = 'CTRL+N'
    .cKeyText         = 'Ctrl+N'
    .cStatusBarText   = 'Create a file'
    .cPictureResource = '_mfi_new'
    .cOnClickCommand  = [messagebox('You chose File, New')]
  endwith
endwith
```

## See Also

[Class SFBar](Class%20SFBar.md)