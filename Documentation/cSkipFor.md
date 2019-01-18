# cSkipFor

The logical expression used for the SKIP FOR clause for the pad (this is a property of [SFPad](Class%20SFPad.md) and [SFBar](Class%20SFBar.md)).

## Example

```foxpro
oMenu.ToolsPad.cSkipFor = 'oApp.oUser.nSecurityLevel < 5'
oMenu.ToolsPad.UsersBar.cSkipFor = 'oApp.oUser.nSecurityLevel < 5'
```