accessing
location: aFileReference
	self backend location: aFileReference.
	aFileReference 
		ifNotNil: [ self refresh ]