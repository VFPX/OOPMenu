# Class SFDynamicMenu

**Parent Class: [SFMenu](Class%20SFMenu.md)**

Taking inspiration from Matt Slay's [Dynamic Forms](https://github.com/mattslay/DynamicForms) VFPX project, I created a subclass of SFMenu called SFDynamicMenu (in SFDynamicMenu.vcx) that creates a menu from text content. The idea is that the menu can easily be created by simply laying it out in text rather than in code or using the Menu Designer. For example, here's the content of Menu.txt:

```
&File                 Name = FilePad
    &New...           cOnClickCommand = messagebox('You chose New')
                      | cPictureFile = newxpsmall.bmp
                      | Name = FileNew
    &Open...          cOnClickCommand = messagebox('You chose Open')
                      | cPictureFile = openxpsmall.bmp
                      | Name = FileOpen
    &Print            cPictureFile = printxpsmall.bmp
                      | Name = FilePrint
        &Invoice      cOnClickCommand = messagebox('You chose Invoice')
                      | Name = FilePrintInvoice
        &Customers    cOnClickCommand = messagebox('You chose Customers')
                      | Name = FilePrintCustomerList
    -----
    E&xit             cOnClickCommand = oMenu.Release()
                      | Name = FileExit
&Edit                 Class = SFEditPad | Library = SFMenu.vcx
```

There are a few things to note about this content:

* Lines which are not indented (that is, preceded with a tab) represent pads.

* Lines that have one indent level (one tab at the start of the line) represent bars in a pad.

* Lines that have more than indent level represent bars in a submenu, in another bar.

* The first thing on a line (after any tabs) is the caption of the item. You can use "&" as a replacement for "\\<" to indicate the hotkey in a caption. Specify "-" (more than one is allowed) for the caption to represent a separator bar.

* One or more tabs separate the caption from the properties for the item. Properties are specified as "property name = propertyvalue;" for example, "cPictureFile = MyImage.bmp." Properties are separated with "|," although that's a property of SFDynamicMenu (cDelimiter) you can change if you need to use "|" for some other purpose, such as in the caption.

* Item definitions can span multiple lines for readability. Place the "|" (or whatever you set cDelimiter to) as the first non-tab character of the line to indicate this is part of the previous line.

To use SFDynamicMenu, create the content for the menu, either in a file or in a string, instantiate SFDynamicMenu and pass the name of the file to the Init method or set the cMenuDefinition property after instantiation to the content string. Then call Show as you normally would for a menu. For example, this specifies using Menu.txt as the content for the menu:

```foxpro
oMenu = newobject('SFDynamicMenu', 'SFDynamicMenu.vcx', ;
    '', 'oMenu', 'Menu.txt')
oMenu.Show()
```

If you change the content of the menu (either changing the content of the file or the layout in cMenuDefinition) and call the Refresh method, the menu changes immediately. You might even allow your end-users to customize the menus for themselves by simply updating the content. You could, of course, implement this idea using XML or a table rather than text content.
