instance creation
named: packageName repository: repository
	^ self new 
		package: packageName;
		repository: repository; 
		yourself