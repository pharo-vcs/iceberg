actions
addFilesToIndex: aListOfPaths 
	^ self command: { 'add' . aListOfPaths }
