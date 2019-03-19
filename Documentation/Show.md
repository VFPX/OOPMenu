# Show

Displays the menu, pad, or bar (this is a method of [SFMenu](Class%20SFMenu.md), [SFPad](Class%20SFPad.md), [SFBar](Class%20SFBar.md)), and [SFMenuShortcutMenu](Class%20SFMenuShortcutMenu.md).

## SFMenu

Show calls [DefineMenu](DefineMenu.md). That method is abstract in SFMenu but could be implemented in a subclass to create a self-contained menu class.

## SFPad

You don't normally need to call this method (pads are automatically shown when the menu object's Show method is called), but this can be used if you've hidden a pad by calling [Hide](Hide.md) and later want to redisplay it. You can also set the [lVisible](lVisible.md) property to .T.

## SFBar

You don't normally need to call this method (bars are automatically shown when pads are shown, which happens when the menu object's Show method is called), but this can be used if you've hidden a bar by calling [Hide](Hide.md) and later want to redisplay it. You can also set the [lVisible](lVisible.md) property to .T.

## SFMenuShortcutMenu

Show displays the menu by calling the Show method of each SFBar object in the collection.

## Syntax

```foxpro
o.Show()
```

## Example

```foxpro
oMenu = newobject('MyAppMenu', 'MyAppMenu.vcx', '', 'oMenu')
oMenu.Show()
```
