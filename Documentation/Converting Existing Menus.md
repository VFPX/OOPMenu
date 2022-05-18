# Converting Existing Menus

You're probably thinking, "this sounds great but I already have an existing MNX-based menu and it'd be a lot of work to use these menu objects instead." Actually, no. Here's what's involved.

First, use the ProcessMNX and MenuClassGenerator classes in ConvertMNX.prg to create a PRG that uses menu objects to reproduce your MNX menu. ProcessMNX reads an MNX file and generates a filled SFMenu object while MenuClassGenerator takes a filled SFMenu object and creates code to generate that menu, with the menu, each pad, and each bar being its own class (subclasses of SFMenu, SFPad, and SFBar). Here's some code that converts MainMenu.mnx into Menu.prg:

```foxpro
loProcess   = newobject('ProcessMNX', 'ConvertMNX.prg')
loMenu      = loProcess.ProcessMenu('mainmenu.mnx')
loGenerator = newobject('MenuClassGenerator', 'ConvertMNX.prg')
loGenerator.cMenuName = 'MainMenu'
loGenerator.GenerateMenu(loMenu, 'menu.prg')
strtofile(loGenerator.cCodeOutput, 'menu.prg')
```

Here's part of Menu.prg to show what the classes look like:

```foxpro
*=============================================================================
define class MainMenu as SFMenu of SFMenu.vcx
*=============================================================================
  procedure DefineMenu
    with This
      .AddPad('msm_file', '', 'msm_file')
      .AddPad('msm_edit', '', 'msm_edit')
      .AddPad('msm_tools', '', 'msm_tools')
      .AddPad('msm_systm', '', 'msm_systm')
    endwith
  endproc
enddefine

*=============================================================================
define class msm_file as SFPad of SFMenu.vcx
*=============================================================================
  cCaption = [\<File]
  cKey = [ALT+F]
  cPadPosition = [before msm_edit]
  cPopupName = [_mfile]
  cStatusBarText = [Performs file tasks]
  Comment = [This is the File pad]

  procedure AddBars
    with This
      .AddBar('msm_fileBar1', '', 'msm_fileBar1')
      .AddBar('msm_fileBar2', '', 'msm_fileBar2')
      .AddSeparatorBar()
      .AddBar('msm_fileBar4', '', 'msm_fileBar4')
      .AddBar('msm_fileBar5', '', 'msm_fileBar5')
      .AddSeparatorBar()
      .AddBar('mfi_pgset', '', 'mfi_pgset')
      .AddBar('mfi_prevu', '', 'mfi_prevu')
      .AddSeparatorBar()
      .AddBar('msm_fileBar10', '', 'msm_fileBar10')
    endwith
  endproc
enddefine

*=============================================================================
define class msm_fileBar1 as SFBar of SFMenu.vcx
*=============================================================================
  cCaption = [\<New...]
  cKey = [CTRL+N]
  cKeyText = [Ctrl+N]
  cOnClickCommand = [ShowMenuChoice('New')]
  cPictureFile = [newxpsmall.bmp]
  cStatusBarText = [Creates a new file]
enddefine
```

Note that pad class names come from the MNX file while bar class names are the pad name suffixed with "Bar" and the bar number. You may wish to replace those names with more meaningful ones, such as, in the code above, replacing "msm_file" with "FilePad" and "msm_fileBar1" with "FileNewBar." That makes the code easier to read and allows you to reference a bar using code like oMenu.FilePad.FileNewBar if you want to change something about it at runtime.

Then replace your DO MAINMENU.MPR with two lines of code:

```foxpro
oMenu = newobject('MainMenu', 'menu.prg', '', 'oMenu')
oMenu.Show()
```

oMenu must be global so it lives throughout the application.

> Note: ConvertMNX.prg isn't complete: it doesn't handle procedures within menus and doesn't handle the NEGOTIATE setting for bars.