# DefineMenu

Defines the desired pads in the menu.

This method is abstract in [SFMenu](Class%20SFMenu.md), but in a subclass you could add code to call [AddPad](AddPad.md) to add pads to the menu. That would allow you to create a self-contained menu class. DefineMenu is called from Show, so it will automatically set up the menu the first time it's displayed. DefineMenu is protected, so it can't be called from outside SFMenu.
