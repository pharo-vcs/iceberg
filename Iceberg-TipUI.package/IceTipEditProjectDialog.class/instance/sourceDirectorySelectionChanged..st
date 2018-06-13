initialization
sourceDirectorySelectionChanged: selectedIndexes

	| selectedDirectory |
	selectedIndexes
		ifEmpty: [ selectedDirectoryPath := RelativePath new ]
		ifNotEmpty: [ | selection |	
			selection := self sourceDirectoryTree widget dataSource elementAt: selectedIndexes first.
			selectedDirectory := selection data.
			selectedDirectoryPath := selectedDirectory relativeTo: self model location ].
	sourceDirectorySelectionLabel label: selectedDirectoryPath pathString.