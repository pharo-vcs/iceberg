initialization
sourceDirectorySelectionChanged: selectedIndexes

	| selectedDirectory |
	selectedIndexes
		ifEmpty: [ 
			"If the user does not select any directory, we choose the root and we use the default format"
			selectedDirectoryPath := RelativePath new.
			formatList setSelectedItem: defaultFormat  ]
		ifNotEmpty: [ | selection |
			selection := self sourceDirectoryTree widget dataSource elementAt: selectedIndexes first.
			selectedDirectory := selection data.
			selectedDirectoryPath := selectedDirectory relativeTo: self model location.
			formatList setSelectedItem: (self guessFormatFromDirectory: selectedDirectory) ].
	sourceDirectorySelectionLabel label: selectedDirectoryPath pathString.