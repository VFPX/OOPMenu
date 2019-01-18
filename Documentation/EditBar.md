# EditBar

Changes any setting for the specified bar.

## Syntax

```foxpro
o.EditBar(tnBar, tcPrompt[, tcOnSelection[, ;
  tcDisabled[, tcImage[, tcMark[, tcBold[, ;
  tcClauses[, tcSystemBar]]]]]]])
```

### Parameters

**tnBar**  
The bar number to edit.

**tcPrompt**  
The prompt for the bar.

**tcOnSelection**  

**tcDisabled**  
The code to execute when the bar is chosen.

**tcImage**  
The path to the image to use for the bar.

**tcMark**  
An expression that determines if the bar has a mark or not.

**tcBold**  
An expression that determines if the bar is bolded or not.

**tcClauses**  
Additional clauses to use for the bar.

**tcSystemBar**  
The name of the VFP system menu bar if this is one of those.

If this is filled in and tcImage is empty, the image of the specified system menu bar is used as the image for the bar.

## See Also
[Class SFShortcutMenu](Class%20SFShortcutMenu.md)