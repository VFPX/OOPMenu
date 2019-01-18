# AddSeparatorBar

Adds a separator bar to the shortcut menu.

## Syntax

```foxpro
o.AddSeparatorBar(tnElementNumber)
```

### Parameters

**tnElementNumber**  
The optional position for the bar in the menu.

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