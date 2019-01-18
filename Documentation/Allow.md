# Allow

Determines if the bar is enabled.

By default, the [cSkipFor](.md) property of the bar is set to "not This.Allow()". This method is abstract in [SFBar](Class%20SFBar.md), but in a subclass, you could put some code that determines when the bar is enabled. Since cSkipFor is dynamic&mdash;it's evaluated every time the menu is activated&mdash;the code in this method will execute every time. Return .T. if the menu bar is enabled or .F. if not.

## Syntax

```foxpro
o.Allow()
```