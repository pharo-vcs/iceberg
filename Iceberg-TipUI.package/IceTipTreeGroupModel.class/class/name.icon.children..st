instance creation
name: aName icon: anIcon children: aCollection
	^ self new 
		name: aName;
		icon: anIcon;
		children: aCollection;
		yourself