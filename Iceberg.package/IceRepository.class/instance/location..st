accessing
location: aFileReference
	self backend location: aFileReference.
	aFileReference ifNil: [ ^ self ].
	name := nil. "New location may mean new repository with new name"
	self refresh.
	