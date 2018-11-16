instance-creation
onProperties: properties commitish: aCommitish
	
	^ self basicNew
		properties: properties;
		commitish: aCommitish;
		initialize;
		yourself