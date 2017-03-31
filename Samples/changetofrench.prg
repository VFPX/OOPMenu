use FRENCH
for each loPad in oMenu
	locate for ENGLISH = loPad.cCaption
	if found()
		loPad.cCaption = trim(FRENCH)
	endif found()
	for each loBar in loPad
		locate for ENGLISH = loBar.cCaption
		if found()
			loBar.cCaption = trim(FRENCH)
		endif found()
	next loBar
	loPad.Refresh()
next loPad
