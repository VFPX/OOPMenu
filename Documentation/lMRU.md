# lMRU

.T. to add an MRU (most-recently used) bar at the bottom of the popup (this is a property of [SFPad](Class%20SFPad.md) and [SFBar](Class%20SFBar.md) because bars can have submenus).

An MRU bar appears as a downward-pointing chevron; this indicates there are some hidden bars in the pad that appear when this bar is selected. This is used to hide functions that aren't used often, and provides a feature similar to the adaptive menus in Microsoft Office applications.

The class and library to use for the MRU bar are specified in the [cMRUBarClass](cMRUBarClass.md) and [cMRUBarLibrary](cMRUBarLibrary.md) properties.

## Example

```foxpro
oMenu.FilePad.lMRU = .T.
```
