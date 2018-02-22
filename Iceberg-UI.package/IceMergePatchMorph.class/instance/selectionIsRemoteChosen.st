testing
selectionIsRemoteChosen
	self selectedChange ifNil: [ ^ false].
	^ self selectedChange isConflict
		and: [ self selectedChange isRightChosen ]