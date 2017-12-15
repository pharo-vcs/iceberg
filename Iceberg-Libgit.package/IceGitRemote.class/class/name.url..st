instance creation
name: aName url: anUrl
	^ (self url: anUrl)
		name: aName;
		yourself