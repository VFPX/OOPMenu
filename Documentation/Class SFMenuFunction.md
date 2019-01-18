# Class SFMenuFunction

**Parent Class: Custom**

This class can be used as the parent for any menu function implementation objects. Subclass SFMenuFunction and implement the Execute method. Then instantiate and reference this object in the oImplementation property of an [SFBar](Class%20SFBar.md) object. The bar will use the [lEnabled](lEnabled.md) and [lVisible](lVisible.md) properties of this object to determine whether the bar is enabled and visible.

## Methods

| Method  | Description                              |
|---------|------------------------------------------|
| [Execute](Execute.md) | Performs the action of a menu or toolbar function. |

## Properties

| Property   | Description                              |
|------------|------------------------------------------|
| [lEnabled](lEnabled.md)   | .T. if the menu or toolbar item is enabled. |
| [lNoExecute](lNoExecute.md) | .T. if the implementation object is used to control the enabled or visible status of the menu item but not its execution.  |
| [lVisible](lVisible.md)   | .T. if the menu or toolbar item is visible.  |
