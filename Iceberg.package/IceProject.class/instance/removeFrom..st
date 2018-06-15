accessing
removeFrom: anIceWorkingCopy 
		1halt.
	(anIceWorkingCopy fileSystem resolve: self projectFilePath) ensureDelete