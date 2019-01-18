# Class SFShortcutMenu

**Parent Class: custom**  

SFShortcutMenu represents a shortcut menu.

To add bars to a menu, call either AddBar to add a "normal" bar or AddSeparatorBar to add a separator bar. To display the shortcut menu, call ShowMenu.

To make it easier to add a shortcut menu to any object, I added the following to almost all of my base classes (at least the visible ones):

* RightClick: calls This.ShowMenu().

* oMenu: a new property that holds a reference to an SFMenu instance.

* lUseFormShortcutMenu: a new property that if .T. (the default is .F.) adds the form's shortcut menu bars (if any) to the object's shortcut menu, in essence combining the two into one menu.

* ShortcutMenu: an abstract method in most classes; in subclasses or instances, it contains calls to AddBar to populate the shortcut menu for the object.

* ShowMenu: a new method with the following code:

```foxpro
local lcLibrary
private loObject, ;
  loForm
with This

* Define reference to objects we might have menu items from in case the action
* for a bar is to call a method of an object, which can't be done using "This.
* Method" since "This" isn't applicable in a menu.

  loObject = This
  loForm   = Thisform

* Define the menu if it hasn't already been defined.

  lcLibrary = 'SFMenu.vcx'
  if vartype(.oMenu) <> 'O' and file(lcLibrary)
    .oMenu = newobject('SFShortcutMenu', lcLibrary)
  endif vartype(.oMenu) <> 'O' ...
  if vartype(.oMenu) = 'O'

* If there aren't any bars in the menu, have the ShortcutMenu method populate
* it.

    if .oMenu.nBarCount = 0
      .ShortcutMenu(.oMenu, 'loObject')

* If desired, use the form's shortcut menu as well.

      if .lUseFormShortcutMenu and type('Thisform.Name') = 'C' and ;
        pemstatus(loForm, 'ShortcutMenu', 5)
        loForm.ShortcutMenu(.oMenu, 'loForm')
      endif .lUseFormShortcutMenu ...
    endif .oMenu.nBarCount = 0

* Activate the menu if necessary.

    if .oMenu.nBarCount > 0
      .oMenu.ShowMenu()
    endif .oMenu.nBarCount > 0
  endif vartype(.oMenu) = 'O' ...
endwith
```

The ShortcutMenu method of some base classes, such as SFTextBox, provides a shortcut menu with edit functions (Cut, Copy, Paste, etc.) using the following code:

```foxpro
lparameters toMenu, ;
  tcObject
local lcCut, ;
  lcCopy, ;
  lcPaste, ;
  lcClear, ;
  lcSelect
if type('oLocalizer.Name') = 'C'
  lcCut    = oLocalizer.GetLocalizedString('MENU_CUT')
  lcCopy   = oLocalizer.GetLocalizedString('MENU_COPY')
  lcPaste  = oLocalizer.GetLocalizedString('MENU_PASTE')
  lcClear  = oLocalizer.GetLocalizedString('MENU_CLEAR')
  lcSelect = oLocalizer.GetLocalizedString('MENU_SELECT_ALL')
else
  lcCut    = 'Cu\<t'
  lcCopy   = '\<Copy'
  lcPaste  = '\<Paste'
  lcClear  = 'Cle\<ar'
  lcSelect = 'Se\<lect All'
endif type('oLocalizer.Name') = 'C'
with toMenu
  .AddBar(lcCut, ;
    "sys(1500, '_MED_CUT',   '_MEDIT')", ;
    'not ' + tcObject + '.Enabled or ' + tcObject + '.ReadOnly', ;
    'CutXPSmall.bmp', ;
    , ;
    , ;
    , ;
    , ;
    '_med_cut')
  .AddBar(lcCopy, ;
    "sys(1500, '_MED_COPY',  '_MEDIT')", ;
    , ;
    'CopyXPSmall.bmp', ;
    , ;
    , ;
    , ;
    , ;
    '_med_copy')
  .AddBar(lcPaste, ;
    "sys(1500, '_MED_PASTE', '_MEDIT')", ;
    'not ' + tcObject + '.Enabled or ' + tcObject + '.ReadOnly', ;
    'PasteXPSmall.bmp', ;
    , ;
    , ;
    , ;
    , ;
    '_med_paste')
  .AddBar(lcClear, ;
    "sys(1500, '_MED_CLEAR', '_MEDIT')", ;
    'not ' + tcObject + '.Enabled or ' + tcObject + '.ReadOnly', ;
    '_med_clear', ;
    , ;
    , ;
    , ;
    , ;
    '_med_clear')
  .AddSeparatorBar()
  .AddBar(lcSelect, ;
    "sys(1500, '_MED_SLCTA', '_MEDIT')", ;
    , ;
    '_med_slcta',;
    , ;
    , ;
    , ;
    , ;
    '_med_slcta')
endwith
```

A few notes about this code:

* It supports localizing the bar captions using a global localizer object. If it doesn't exist, the default captions, such as "Cu\<t," are used.

* ShortcutMenu is passed a reference to a menu object to fill. It's also passed a variable name that at runtime contains a reference to the object. That way, you can reference it in bars, such as what method of the object to call when a bar is chosen or what property of the object determines if the bar is enabled. For example, the Cut bar is disabled if the current object's Enabled property is .F. or ReadOnly is .T. Note how the object has to be referenced: "tcObject" has to be used outside of quotes, which makes the syntax a little hard to read.

* I put each parameter on a separate line to make it easier to see which parameter is which, especially when some aren't used.
Typically, all you need to do to add a shortcut menu to any class or object instance is to add code to its ShortcutMenu method that adds bars to the menu. SampleShortcut.scx demonstrates this; it has this code in that method:

```foxpro
lparameters toMenu, ;
  tcObject
toMenu.AddBar('\<Find Customer', ;
  tcObject + '.FindCustomer()', ;
  , ;
  'GridExtras\Search16.bmp')
toMenu.AddBar('F\<ilter...', ;
  tcObject + '.Filter()', ;
  , ;
  'GridExtras\ShowFilters16.bmp')
toMenu.AddSeparatorBar()
toMenu.AddBar('\<Print Invoice', ;
  tcObject + '.PrintInvoice()', ;
  'not ' + tcObject + '.lInvoiceSelected', ;
  'GridExtras\Printer16.bmp')
```

## Methods

| Method          | Description                              |
|-----------------|------------------------------------------|
| [AddBar](AddBarShortcut.md)          | Adds a new bar to the shortcut menu.     |
| [AddSeparatorBar](AddSeparatorBarShortcut.md) | Adds a separator bar to the shortcut menu. |
| [ClearMenu](ClearMenu.md)       | Releases the existing shortcut menu.     |
| [EditBar](EditBar.md)         | Changes any setting for the specified bar. |
| [FindBar](FindBar.md)         | Returns the bar number for the specified prompt. |
| [ShowMenu](ShowMenu.md)        | Display the shortcut menu.               |

## Properties

| Property     | Description                              |
|--------------|------------------------------------------|
| cOnSelection | The default command to execute, used when a menu bar that doesn't have a command specified is selected. |
| nBarCount    | The number of bars defined in the menu (read-only). |
| nCol         | The column for the menu (leave 0 to use the default). |
| nRow         | The row for the menu (leave 0 to use the default). |
