# OOPMenu
*Provides Object-Oriented menus for use in Visual Foxpro 9.0 development*

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
