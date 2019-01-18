# lVisible

.T. if the pad or bar is visible (this is a property of [SFPad](Class%20SFPad.md), [SFBar](Class%20SFBar.md), and [SFMenuFunction](Class%20SFMenuFunction.md)). For SFMenuFunction, this value determines whether the menu or toolbar item is visible. 

## Example

```foxpro
oMenu.ToolsPad.lVisible = oApp.oUser.nSecurityLevel < 2
oMenu.ToolsPad.UsersBar.lVisible = oApp.oUser.nSecurityLevel < 2
```