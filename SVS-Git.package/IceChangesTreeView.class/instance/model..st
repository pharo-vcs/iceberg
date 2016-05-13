api
model: anIceChangeSet
	model value: anIceChangeSet.
	anIceChangeSet whenChangedDo: [ self tree updateTree.  ]
