# cSystemBar

The name of the VFP system menu bar if this is one of those.

If this is filled in and cPictureFile is empty, the image of the specified system menu bar is used as the image for the bar.

## Example

```foxpro
oMenu.AddPad('SFPad', 'SFMenu.vcx', 'EditPad'
with oMenu.EditPad
  .cCaption       = '\<Edit'
  .cKey           = 'ALT+E'
  .cStatusBarText = 'Edit text'

  .AddBar('SFBar', 'SFMenu.vcx', 'EditUndo')
  with .EditUndo
    .cCaption       = '\<Undo'
    .cKey           = 'CTRL+Z'
    .cKeyText       = 'Ctrl+Z'
    .cStatusBarText = 'Reverse the most recent edit action'
    .cSystemBar     = '_med_undo'
  endwith
endwith
```

## See Also

[Class SFBar](Class%20SFBar.md)