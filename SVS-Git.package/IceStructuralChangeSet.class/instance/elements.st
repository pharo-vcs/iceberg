accessing
elements
	^ elements ifNil: [ (elements := self initialElements) 
		asSortedCollection: [ :a :b | a name < b name ] ]