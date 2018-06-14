removing
removeFrom: anIceWorkingCopy
	
	"We should remove it because we add it before..."
	self flag: #potentialBug.
	self projectFileReference ensureDelete.