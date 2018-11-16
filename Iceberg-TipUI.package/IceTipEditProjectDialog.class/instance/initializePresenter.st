initialization
initializePresenter
	| path currentNode |
	super initializePresenter.

	self formatList
		items: self formats;
		displayBlock: [ :each | each description ];
		setSelectedItem: model repositoryProperties fileFormat.

	path := (RelativePath with: model sourceDirectory) segments asOrderedCollection.
	currentNode := self sourceDirectoryTree widget dataSource rootItem children first.
	currentNode expand.
	[ path isEmpty ]
		whileFalse: [ | currentSegment |
			currentSegment := path removeFirst.
			currentNode := currentNode children
				detect: [ :e | (e data basename ifEmpty: [ '/' ]) = currentSegment ]
				ifFound: [ :node | 
					node expand.
					node ]
				ifNone: [ nil ] ].

	currentNode
		ifNotNil: [ | index |
			index := self sourceDirectoryTree widget dataSource indexOfElementMatching: [ :elem | elem = currentNode data ].
			self sourceDirectoryTree widget selectRowIndex: index ].