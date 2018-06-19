initialization
initializePresenter

	| path currentNode |
	super initializePresenter.
	path := (RelativePath with: model sourceDirectory) segments asOrderedCollection.
	currentNode := self sourceDirectoryTree widget dataSource rootItem.
	
	[ path isEmpty ] whileFalse: [ | currentSegment |
		currentSegment := path removeFirst.
		currentNode := currentNode children detect: [ :e | e data basename = currentSegment ].
		currentNode expand ].
	self sourceDirectoryTree widget selectRowIndex: (self sourceDirectoryTree widget dataSource indexOfElementMatching: [ :elem | elem = currentNode data ]).
	
	self formatList
		items: self formats;
		displayBlock: [ :each | each description ];
		setSelectedItem: model fileFormat.