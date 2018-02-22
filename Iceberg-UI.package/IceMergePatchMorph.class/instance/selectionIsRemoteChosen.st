testing
selectionIsRemoteChosen
	self selectedChange ifNil: [ ^ false].
	^ self selectedChange rightChosen