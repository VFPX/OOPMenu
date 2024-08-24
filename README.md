# OOPMenu

**Provides object-oriented menus for use in Visual FoxPro 9.0 development**

Project Manager: [Doug Hennig](mailto:doug@doughennig.com)

One of the last bastions of procedural code in VFP is the menu system. While we're somewhat insulated from typing DEFINE PAD and DEFINE BAR statements using the Menu Designer, having a hard-coded MPR file that defines an application's menu is far from ideal. Here are a few reasons:

* You have to use kludges to implement security such as having some bars or pads not appear for certain users.

* You can't add bars dynamically without resorting to writing DEFINE BAR statements.

* It's difficult to create a localized menu or allow the prompts for menu items to vary under certain circumstances.

* Menu bars aren't reusable, so you have to replicate menus between applications.

* Although they share common functionality, menus and toolbars don't interact in any way, requiring duplicate or coupled code. For example, the SKIP FOR of a menu bar might use NOT _SCREEN.ActiveForm.oToolbar.cmdAdd.Enabled, which highly couples the menu to the toolbar.

The goals for this project are:

* Provide runtime access to menu components as easily as access to other objects. This allows pads and bars to be dynamically added and removed with simple code-MyMenu.FilePad.AddBar() and MyMenu.FilePad.RemoveBar()-and allows attributes to be changed at runtime, such as localized captions, disabling or hiding bars based on security or context, and so forth.

* Provide menu factory tools that make it easy to implement such a menu system in an existing application. Some examples are:

    * A factory that opens an MNX file and based on the values in each record, instantiates menu objects and assigns their properties accordingly.

    * Similar to the previous point, a factory that opens another type of data store for menu definitions: a different table structure than an MNX, an XML file, etc.

    * A utility that reads an MNX file and generates code that acts as a hard-coded factory, such as the GENMENUX driver written by Mike and Toni Feltman. The benefit of this is current code that runs a menu (DO MyMenu.MPR) wouldn't change, since the MPR has been replaced with one that uses the menu objects.

* Separate the user interface of a menu (menu, pads, and bars) from the functionality. This allows individual menu components (a particular bar or even an entire pad, such as Edit) to be reused and integrated with other objects, such as toolbars, TreeViews, etc.

* Create documentation and samples for all of the components so developers can quickly learn how to use the system.

See the files in the Documentation folder, starting with [Overview of the Classes](Documentation/Overview.md). See [Converting Existing Menus](Documentation/Converting%20Existing%20Menus.md) for details on converting existing MNX-based menus to classes.

## Helping with this project

See [How to contribute to OOP Menu](.github/CONTRIBUTING.md) for details on how to help with this project.

## Releases

### 2024-08-24

* SFPad.Hide no longer sets lVisible to .T.

### 2023-02-22

* Fixed an issue with a pad with lVisible initially set to .F appearing in the menu.

### 2023-02-21

* Fixed an issue with a visible bar that's a subitem of an invisible bar.

### 2022-05-18

* Fixed an issue with separator bars marked as "Submenu" when converting an MNX.

### 2022-05-16

* Added support for Setup and Cleanup code in ConvertMNX.prg and fixed other minor conversion issues.

### 2019-06-27

* Released on GitHub.

### 2019-01-31

* Added SFShortcutMenu.

* Implemented Markdown documentation.

### 2018-09-20

* Added support for non-executing implementation objects (code provided by Eduard Alexandru). This allows you to use implementation objects that are used for enabled and visible properties of a menu item but not its execution.

* SFMenuFunction: added lNoExecute

* SFBar: made Click ignore implementation objects with lNoExecute set to .T. Made EvaluateVisible check oImplementation.lVisible. Made Refresh only call Show if lVisible is .T.

* Added support for pads that execute a function without displaying a popup (code provided by Eduard Alexandru).

* SFPad: made DefinePad call new OnPad function.

* SFPadCommand: create a subclass of SFPad used for executing pads.

* DemoMenu1.PRG: added an Exit pad to show how a pad can execute code without a popup.

* Eliminated separator bars at the top or bottom of a popup and consecutive separator bars. These cases typically happen when hiding menu items that have separators above or below them (code provided by Eduard Alexandru).

* SFBar: made lVisible_Assign call pad's AdjustSeparators.

* SFPad: added AdjustSeparators method.

### 2006-06-26

* DemoMenu6.PRG: created to demonstrate creating a menu in a top-level form.

* SFBar: removed the SET STEP ON in Define and Refresh (oops!).

* SFEditPad: set cPopupName to _MEDIT so SYS(1500) works properly

* SFMenu: added cFormName and cMenuName properties. If cFormName is filled in, Show creates a new menu in that form; this allows a menu to be created in a top-level form. If cMenuName is filled in, Refresh uses that name instead of _MSYSMENU; this allows you to specify your own menu name.

* SFPad: made Init not call DefinePopup to prevent a "popup no defined" error under some conditions; Define now calls DefinePopup. Made DefinePad and Hide handle the menu name specified in Parent.cMenuName.

### 2006-05-17

* SFBar: made Init accept tcName parameter and set Name to it; this allows cPopupNameThis to be assigned the correct value, which is required for submenus. Made AddBar pass tcName to Init of new bar and not explicitly set Name to support this. Added "before" clause to lcBarPosition in Define if there's a bar in the pad with this bar's position but different bar number; this resolves the problem of the bar not appearing correctly if it was removed and then readded. Removed include file, which isn't required and not provided.

* SFMenu: made AddPad pass tcName to Init of new pad and not explicitly set Name for the same reason as the change in SFBar.AddBar.

* SFMenuBase: added cVersion (which currently contains "2006.05.17") to indicate the version.

* SFPad: made AddBar pass tcName to Init of new bar and not explicitly set Name for the same reason as the change in SFBar.AddBar. Made Init accept tcName and set Name to it; this allows cPopupName to be assigned the correct value. Removed include file, which isn't required and not provided.

### 2006-02-17

* DemoMenu4.PRG: corrected a bug: the MESSAGEBOX() call needed double-quotes because a single quote appeared in the text. 

### 2006-02-06

* Initial release.

