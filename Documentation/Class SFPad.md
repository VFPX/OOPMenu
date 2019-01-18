# Class SFPad

**Parent Class: [SFMenuBase](Class%20SFMenuBase.md)**  

SFPad represents a pad in a menu. Since pads contains bars, SFPad is based on SFMenuBase, which is a subclass of Collection.

To add bars to a menu, call either AddBar to add a "normal" bar or AddSeparatorBar to add a separator bar.

## Methods

| Method          | Description                           |
|-----------------|---------------------------------------|
| [AddBar](AddBar.md)          | Adds a bar to the popup for this pad. |
| [AddSeparatorBar](AddSeparatorBar.md) | Adds a separator bar to the pad.      |
| [Hide](Hide.md)            | Hides the pad.                        |
| [Refresh](Refresh.md)         | Refreshes the pad.                    |
| [Show](Show.md)            | Shows the pad.                        |

## Properties

| Property       | Description                              |
|----------------|------------------------------------------|
| [cCaption](cCaption.md)       | The caption for the menu pad.            |
| [cKey](cKey.md)           | The hotkey for the pad.                  |
| [cMRUBarClass](cMRUBarClass.md)   | The class to use for the MRU bar.        |
| [cMRUBarLibrary](cMRUBarLibrary.md) | The library containing the class specified in cMRUBarClass. |
| [cPadPosition](cPadPosition.md)   | An optional "before" or "after" pad clause to use in defining the pad's location in the menu.  |
| [cSkipFor](cSkipFor.md)       | The logical expression used for the SKIP FOR clause for the pad. |
| [cStatusBarText](cStatusBarText.md) | Text displayed in the status bar when this pad is highlighted. |
| [lMRU](lMRU.md)           | .T. to add an MRU (most-recently used) bar at the bottom of the menu. |
| [lVisible](lVisible.md)       | .T. if the pad is visible.               |

