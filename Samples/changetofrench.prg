use FRENCH
for each loPad in oMenu
	locate for ENGLISH = loPad.cCaption
	if found()
		loPad.cCaption = trim(FRENCH)
	else
		locate for FRENCH = loPad.cCaption
		if found()
			loPad.cCaption = trim(ENGLISH)
		endif found()
	endif found()
	for each loBar in loPad
		locate for ENGLISH = loBar.cCaption
		if found()
			loBar.cCaption = trim(FRENCH)
		else
			locate for FRENCH = loBar.cCaption
			if found()
				loBar.cCaption = trim(ENGLISH)
			endif found()
		endif found()
	next loBar
	loPad.Refresh()
next loPad
