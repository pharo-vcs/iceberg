instance creation
name: aName children: aCollection
	^ self new 
		name: aName;
		children: aCollection;
		yourself