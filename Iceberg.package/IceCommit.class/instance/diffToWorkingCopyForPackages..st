API-changes
diffToWorkingCopyForPackages: aCollection

	^ IceDiff new
		sourceVersion: self;
		targetVersion: self repository workingCopy;
		buildForPackages: aCollection