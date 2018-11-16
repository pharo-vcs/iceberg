instance-creation
fromWorkingCopy: aWorkingCopy
	^ self basicNew 
		repository: aWorkingCopy repository; 
		initialize;
		project: aWorkingCopy project;
		yourself