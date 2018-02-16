instance-creation
name: aString meta: isMeta parent: aParent
	
	^ self new
		name: aString;
		isMeta: isMeta;
		parent: aParent;
		yourself