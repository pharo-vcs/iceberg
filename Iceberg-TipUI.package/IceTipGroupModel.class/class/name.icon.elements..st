instance creation
name: aName icon: anIcon elements: aCollection
	^ self new 
		name: aName;
		icon: anIcon;
		elements: aCollection;
		yourself