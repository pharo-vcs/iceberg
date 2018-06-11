actions
doAccept
	self validate.
	commitishToTag
		createTag: self tagName
		thenDo: [ :newBranch | callback ifNotNil: [ callback value: newBranch ] ]