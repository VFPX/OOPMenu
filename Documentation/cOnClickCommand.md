# cOnClickCommand

The command to execute when the bar is clicked. This is a property of [SFBar](Class%20SFBar.md) and SFPadCommand.

Fill this in if the action to take when the bar is selected is to execute some code that's not stored in the method of the application object, active form, or implementation object.

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
