# Class SFBar

**Parent Class: [SFMenuBase](Class%20SFMenuBase.md)**

SFBar represents a bar in a pad of a menu. Since a bar may have a submenu, which consists of other bars, SFBar is based on SFMenuBase, which is a subclass of Collection.

To add bars to a menu, call either AddBar to add a "normal" bar or AddSeparatorBar to add a separator bar.

## Methods

| Method              | Description                              |
|---------------------|------------------------------------------|
| [AddBar](AddBar.md) | Adds a bar to the submenu popup for this bar. |
| [AddSeparatorBar](AddSeparatorBar.md)     | Adds a separator bar to the submenu popup for this bar. |
| [Allow](Allow.md)               | Determines if the bar is enabled.        |
| [Click](Click.md)               | Called when the bar is selected in a menu. |
| [Hide](Hide.md)                | Hides the bar.                           |
| [Refresh](Refresh.md)             | Refreshes the bar.                       |
| [Show](Show.md)                | Displays the bar.                        |

## Properties

| Property          | Description                              |
|-------------------|------------------------------------------|
| [cActiveFormMethod](cActiveFormMethod.md) | The method of the active form to execute.<br><br>Fill this in if the action to take when the bar is selected is to call a method of the currently active form. |
| [cAppObjectMethod](cAppObjectMethod.md)  | The method of the application object to execute. |
| [cAppObjectName](cAppObjectName.md)    | The name of the variable containing the application object. |
| [cBarPosition](cBarPosition.md)      | An optional "before" or "after" bar clause to use in defining the bar's location in the menu. |
| [cCaption](cCaption.md)          | The caption for the bar.                 |
| [cKey](cKey.md)              | The hotkey for the bar.                  |
| [cKeyText](cKeyText.md)          | The text for the hotkey.                 |
| [cMenuClauses](cMenuClauses.md)      | Other clauses for bar; see the VFP help topic for DEFINE BAR for a list of possible clauses. |
| [cMRUBarClass](cMRUBarClass.md)      | The class to use for the MRU bar.        |
| [cMRUBarLibrary](cMRUBarLibrary.md)    | The library containing the class specified in cMRUBarClass. |
| [cOnClickCommand](cOnClickCommand.md)   | The command to execute when the bar is clicked.  |
| [cPictureFile](cPictureFile.md)      | The file name for the picture to use for the bar. |
| [cPictureResource](cPictureResource.md)  | The system menu bar name for the picture to use for the bar. |
| [cSkipFor](cSkipFor.md)          | The SKIP FOR clause for the bar.         |
| [cStatusBarText](cStatusBarText.md)    | The text displayed in the status bar when this bar is highlighted. |
| [cSystemBar](cSystemBar.md)        | The name of the VFP system menu bar if this is one of those. |
| [lEnabled](lEnabled.md)          | .T. if the bar is enabled.               |
| [lInvert](lInvert.md)           | .T. to make this an inverted bar.        |
| [lMarked](lMarked.md)           | .T. if the bar is marked.                |
| [lMRU](lMRU.md)              | .T. to add an MRU (most-recently used) bar at the bottom of the submenu.  |
| [lVisible](lVisible.md)          | .T. if the bar should be visible.        |
| [nBarNumber](nBarNumber.md)        | The number of the bar.                   |
| [oImplementation](oImplementation.md)   | A reference to an implementation object.  |

