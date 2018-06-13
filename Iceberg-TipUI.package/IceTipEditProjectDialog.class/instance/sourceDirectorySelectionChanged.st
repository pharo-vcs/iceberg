initialization
sourceDirectorySelectionChanged

	| selectedDirectory path selection |
	selection := self sourceDirectoryTree widget dataSource selectedItem.
	selection
		ifNil: [ path := RelativePath new ]
		ifNotNil: [ 	
			selectedDirectory := selection data.
			path := selectedDirectory relativeTo: self model location ].
	sourceDirectorySelectionLabel label: path pathString.