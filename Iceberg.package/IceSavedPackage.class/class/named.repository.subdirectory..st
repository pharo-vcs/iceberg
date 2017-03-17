instance creation
named: packageName repository: repository subdirectory: aString
	^ self new 
		package: (IcePackageReference named: packageName); 
		repository: repository; 
		subdirectory: aString;
		yourself