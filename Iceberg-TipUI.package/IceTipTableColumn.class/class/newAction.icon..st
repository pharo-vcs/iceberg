instance creation
newAction: aSymbolOrBlock icon: iconSymbolOrBlock
	^ self new 
		action: aSymbolOrBlock;
		icon: iconSymbolOrBlock;
		yourself