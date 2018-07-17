instance-creation
onProperties: properties commitish: aCommitish inRepository: anIceLibgitRepository 
	
	^ self basicNew
		repository: anIceLibgitRepository;
		properties: properties;
		commitish: aCommitish;
		initialize;
		yourself