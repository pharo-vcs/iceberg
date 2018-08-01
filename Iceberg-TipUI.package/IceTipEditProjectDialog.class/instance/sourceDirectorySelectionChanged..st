initialization
sourceDirectorySelectionChanged: selectedIndexes

	| selectedDirectory selection |
	selectedIndexes
		ifEmpty: [ 
			"If the user does not select any directory, we choose the root and we use the default format"
			selectedDirectoryPath := RelativePath new.
			self sourceDirectoryTree widget selectRowIndex: 1.
			selection := self sourceDirectoryTree widget dataSource rootItem children first.
			selectedDirectory := self sourceDirectoryTree widget dataSource rootItem children first data.
		] ifNotEmpty: [
			selection := self sourceDirectoryTree widget dataSource elementAt: selectedIndexes first.
		].
	
	selectedDirectory := selection data.
	selectedDirectoryPath := selectedDirectory relativeTo: self model fileSystem. 
	formatList setSelectedItem: (self guessFormatFromDirectory: selectedDirectory).