# Overview of the Classes

SFMenu.vcx is a class library that implements the functionality of the menu components. It contains the following main classes:

* [SFMenu](Class%20SFMenu.md): represents the menu system.

* [SFPad](Class%20SFPad.md): represents a single pad.

* [SFBar](Class%20SFBar.md): represents a single bar.

* [SFMenuFunction](Class%20SFMenuFunction.md): a menu function implementation object, used as the parent class for implementation objects that perform actions when menu items are chosen or toolbar buttons clicked.

* [SFMenuShortcutMenu](Class%20SFMenuShortcutMenu.md): used to create shortcut menus.

Other classes in this VCX are:

* [SFMenuBase](Class%20SFMenuBase.md): the parent class for SFMenu, SFPad, and SFBar.

* SFSeparatorBar: a subclass of SFBar, providing a separator bar. You don't normally have to add these to a pad using [AddBar](AddBar.md), since [AddSeparatorBar](AddSeparatorBar.md) does it without passing any parameters.

* SFMRUBar: a subclass of SFBar providing an MRU (most-recently used) bar for a pad. See the documentation for [lMRU](lMRU.md) for details on MRU bars.

* SFHelpTopicsBar: a subclass of SFBar for the Help Topics bar in a Help menu

* SFEditPad: a subclass of SFPad that provides the contents of a typical Edit pad.

* SFPadCommand: a subclass of SFPad that executes some functionality when clicked rather than displaying a popup. Like SFBar, the [Click](Click.md) method is called when the pad is selected in the menu and the pad supports an implementation object via its [oImplementation](oImplementation.md) property.

* [SFShortcutMenu](Class%20SFShortcutMenu.md): an older shortcut menu included for backward compatibility.

Another class library, [SFDynamicMenu.vcx](Class%20SFDynamicMenu.md), contains a single class: SFDynamicMenu, which is used for reading a menu layout from text.