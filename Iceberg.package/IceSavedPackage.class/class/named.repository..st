instance creation
named: packageName repository: repository
	^ self new 
		package: (IcePackageReference named: packageName); 
		repository: repository; 
		subdirectory: repository subdirectory;
		yourself