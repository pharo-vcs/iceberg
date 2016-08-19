building
composePackagesListIn: composite
	composite fastTable
		title: 'Dark Packages';
		display: #savedPackages;
		column: 'Name' evaluated: #packageName width: 150;
		column: 'Status' evaluated: [:pkg | self statusFor: pkg ];
		column: 'Loaded version' evaluated: [:pkg | self loadedVersionOf: pkg ] width: 50;
		addAction: self addPackageAction;
		addSelectionAction: self loadPackageAction;
		addSelectionAction: self unloadPackageAction
