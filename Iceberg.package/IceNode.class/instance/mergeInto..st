operations
mergeInto: aTree

	parent := self ensureNodeOn: aTree.
	self children do: [ :e | e mergeInto: parent ]