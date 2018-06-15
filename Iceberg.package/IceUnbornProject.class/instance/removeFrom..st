removing
removeFrom: anIceWorkingCopy
		1halt.
	"We should remove it because we add it before..."
	self flag: #potentialBug.
	self projectFileReference ensureDelete.