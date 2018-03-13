accessing
children: aCollection
	children := aCollection.
	children do: [ :each | each parent: self ]