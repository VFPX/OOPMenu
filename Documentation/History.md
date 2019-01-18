# History

### 01/31/2019

* Added SFShortcutMenu.

* Implemented Markdown documentation.

### 09/20/2010

* Added support for non-executing implementation objects (code provided by Eduard Alexandru). This allows you to use implementation objects that are used for enabled and visible properties of a menu item but not its execution.

* **SFMenuFunction**: added lNoExecute

* **SFBar**: made Click ignore implementation objects with lNoExecute set to .T. Made EvaluateVisible check oImplementation.lVisible. Made Refresh only call Show if lVisible is .T.

* Added support for pads that execute a function without displaying a popup (code provided by Eduard Alexandru).

* **SFPad**: made DefinePad call new OnPad function.

* **SFPadCommand**: create a subclass of SFPad used for executing pads.

* **DemoMenu1.PRG**: added an Exit pad to show how a pad can execute code without a popup.

* Eliminated separator bars at the top or bottom of a popup and consecutive separator bars. These cases typically happen when hiding menu items that have separators above or below them (code provided by Eduard Alexandru).

* **SFBar**: made lVisible_Assign call pad's AdjustSeparators.

* **SFPad**: added AdjustSeparators method.

### 06/26/2006

* **DemoMenu6.PRG**: created to demonstrate creating a menu in a top-level form.

* **SFBar**: removed the SET STEP ON in Define and Refresh (oops!).

* **SFEditPad**: set cPopupName to _MEDIT so SYS(1500) works properly.

* **SFMenu**: added cFormName and cMenuName properties. If cFormName is filled in, Show creates a new menu in that form; this allows a menu to be created in a top-level form. If cMenuName is filled in, Refresh uses that name instead of _MSYSMENU; this allows you to specify your own menu name.

* **SFMenuBase**: changed cVersion to "2006.06.26"

* **SFPad**: made Init not call DefinePopup to prevent a "popup no defined" error under some conditions; Define now calls DefinePopup. Made DefinePad and Hide handle the menu name specified in Parent.cMenuName.

### 05/17/2006

* **SFBar**: made Init accept tcName parameter and set Name to it; this allows cPopupNameThis to be assigned the correct value, which is required for submenus. Made AddBar pass tcName to Init of new bar and not explicitly set Name to support this. Added "before" clause to lcBarPosition in Define if there's a bar in the pad with this bar's position but different bar number; this resolves the problem of the bar not appearing correctly if it was removed and then readded. Removed include file, which isn't required and not provided.

* **SFMenu**: made AddPad pass tcName to Init of new pad and not explicitly set Name for the same reason as the change in SFBar.AddBar.

* **SFMenuBase**: added cVersion (which currently contains "2006.05.17") to indicate the version.

* **SFPad**: made AddBar pass tcName to Init of new bar and not explicitly set Name for the same reason as the change in SFBar.AddBar. Made Init accept tcName and set Name to it; this allows cPopupName to be assigned the correct value. Removed include file, which isn't required and not provided.

### 02/17/2006

* **DemoMenu4.PRG**: corrected a bug: the MESSAGEBOX() call needed double-quotes because a single quote appeared in the text.

### 02/06/2006

Initial release.
