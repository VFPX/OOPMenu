# Click
Called when the bar is selected in a menu.

When a bar is selected, the Click method uses the following logic to determine what to do:

* If [oImplementation](oImplementation.md) contains an object, its [Execute](Execute.md) method is called.

* If [cAppObjectMethod](cAppObjectMethod.md) is filled it, it contains the name of a method of the application object whose name is stored in [cAppObjectName](cAppObjectName.md), so that method is called.

* If [cActiveFormMethod](cActiveFormMethod.md) is filled it, it contains the name of a method of the active form, so that method is called.

* If [cOnClickCommand](cOnClickCommand.md) is filled in, it contains code to execute, so that code is executed.

There's no need to call this method manually.

## Syntax

```foxpro
o.Click()
```

## See Also

[Class SFBar](Class%20SFBar.md)