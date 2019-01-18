# lEnabled

.T. if the bar is enabled. This is a property of both [SFBar](Class%20SFBar.md) and [SFMenuFunction](Class%20SFMenuFunction.md).

In the case of SFBar, this value is static; it's only evaluated when the bar is defined or refreshed. You can also set the [cSkipFor](cSkipFor.md) property to an expression to dynamically enable or disable the bar.

For SFMenuFunction, this value determines whether the menu or toolbar item is enabled. 

## Example

```foxpro
oMenu.ToolsPad.UsersBar.lEnabled = oApp.oUser.nSecurityLevel < 2
```
