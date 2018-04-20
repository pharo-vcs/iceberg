initialization
initializeSourceDirectory
	subdirectoryLabel := self newLabel label: 'Source directory'.
	subdirectoryInputText := self newTextInput 
		ghostText: 'e.g., src';
		autoAccept: true.
		
	subdirectoryInputText text: self defaultSubdirectory