# AddBar

Adds a new bar to the shortcut menu.

## Syntax

```foxpro
o.AddBar(tcPrompt, tcOnSelection[, tlDisabled[, ;
  tcImage[, tnElementNumber[, tlMark[, tlBold[, ;
  tcClauses[, tcSystemBar]]]]]]])
```

### Parameters

**tcPrompt**  
The prompt for the bar.

**tcOnSelection**  
The code to execute when the bar is chosen.

**tlDisabled**  
An expression that determines whether the bar is disabled or not.

**tcImage**  
The path to the image to use for the bar.

**tnElementNumber**  
The optional position for the bar in the menu.

**tlMark**  
An expression that determines if the bar has a mark or not.

**tlBold**  
An expression that determines if the bar is bolded or not.

**tcClauses**  
Additional clauses to use for the bar.

**tcSystemBar**  
The name of the VFP system menu bar if this is one of those.

If this is filled in and tcImage is empty, the image of the specified system menu bar is used as the image for the bar.

## Example

```foxpro
loMenu = newobject('SFShortcutMenu', 'SFMenu.vcx')
loMenu.AddBar('\<Find Customer', ;
  'FindCustomer()', ;
  , ;
  'Search16.bmp')
loMenu.AddBar('F\<ilter...', ;
  'FilterRecords()', ;
  , ;
  'ShowFilters16.bmp')
loMenu.AddSeparatorBar()
loMenu.AddBar('\<Print Invoice', ;
  'PrintInvoice()', ;
  'not _screen.ActiveForm.lInvoiceSelected', ;
  'Printer16.bmp')
loMenu.ShowMenu()
```

## See Also
[Class SFShortcutMenu](Class%20SFShortcutMenu.md)
