accessing
removeFrom: anIceWorkingCopy 
	
	(anIceWorkingCopy fileSystem resolve: self projectFilePath) ensureDelete