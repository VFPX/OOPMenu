# Samples

The following samples are included with this project:

* DemoMenu1.prg: shows creating a menu programmatically without menu subclasses.

* DemoMenu2.prg: shows creating a menu using menu subclasses.

* DemoMenu3.prg: shows a menu with inverted and MRU bars.

* DemoMenu4.prg: shows localizing a menu after it's been created (uses ChangeToFrench.prg and French.dbf).

* DemoMenu5.prg: shows both using a menu in a top-level form and using an implementation object to coordinate menu and toolbar items (uses TestForm.scx).

* SampleShortcut.scx: show using SFShortcutMenu to create a shortcut menu. Based on SFForm in SFCtrls.vcx, which has code in RightClick that calls a custom ShowMenu method that does the actual instantiation of SFShortcutMenu. The ShortcutMenu method of SampleShortcut.scx adds the bars to the menu.
