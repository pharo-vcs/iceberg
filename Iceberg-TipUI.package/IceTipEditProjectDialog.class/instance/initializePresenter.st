initialization
initializePresenter

	| path currentNode |
	super initializePresenter.
	path := (RelativePath with: model sourceDirectory) segments asOrderedCollection.
	
	path isEmpty ifFalse: [
		currentNode := self sourceDirectoryTree widget dataSource rootItem.
	
		[ path isEmpty ] whileFalse: [ | currentSegment |
			currentSegment := path removeFirst.
			currentNode := currentNode children detect: [ :e | e data basename = currentSegment ] ifFound: [ :node | node expand. node ] ifNone: [ nil ]].

		currentNode ifNotNil: [self sourceDirectoryTree widget selectRowIndex: (self sourceDirectoryTree widget dataSource indexOfElementMatching: [ :elem | elem = currentNode data ])].
	].
	
	self formatList
		items: self formats;
		displayBlock: [ :each | each description ];
		setSelectedItem: model repositoryProperties fileFormat.
		
	useSourceFolder state: model sourceDirectory isNotEmpty.