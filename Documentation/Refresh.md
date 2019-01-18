# Refresh

Refreshes the display of the menu, pad, or bar (this is a method of [SFMenu](Class%20SFMenu.md), [SFPad](Class%20SFPad.md), and [SFBar](Class%20SFBar.md)).

Call this method to refresh the entire menu when changes have been made to things like pad and bar captions. You can also call the Refresh method of a pad or bar to just refresh the pad or bar.

## Syntax

```foxpro
o.Refresh()
```

## Example

```foxpro
* Change the captions in every pad and bar to French.

use FRENCH
for each loPad in oMenu
  locate for ENGLISH = loPad.cCaption
  if found()
    loPad.cCaption = trim(FRENCH)
  endif found()
  for each loBar in loPad
    locate for ENGLISH = loBar.cCaption
    if found()
      loBar.cCaption = trim(FRENCH)
    endif found()
  next loBar
next loPad
```
