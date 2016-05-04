instance creation
fromWorkingCopy: aWorkingCopy toRepository: aRepository
	^ self new 
		package: aWorkingCopy package;
		mine: aWorkingCopy snapshot;
		theirs: (aRepository latestVersionForPackage: aWorkingCopy package) snapshot;
		yourself