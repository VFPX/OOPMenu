# cStatusBarText

Text displayed in the status bar when this pad or bar is highlighted (this is a property of [SFPad](Class%20SFPad.md) and [SFBar](Class%20SFBar.md)).

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
    .cOnClickCommand = [messagebox('You chose File, New')]
  endwith
endwith
```