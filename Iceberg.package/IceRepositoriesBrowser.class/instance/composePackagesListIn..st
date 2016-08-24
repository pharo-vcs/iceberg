building
composePackagesListIn: composite
	composite fastTable
		title: 'Packages';
		display: #savedPackages;
		column: 'Name' evaluated: #packageName width: 150;
		column: 'Status' evaluated: [:pkg | self class statusFor: pkg ];
		column: 'Loaded version' evaluated: [:pkg | self class loadedVersionOf: pkg ] width: 50;
		addAction: self addPackageAction;
		addSelectionAction: self loadPackageAction;
		addSelectionAction: self unloadPackageAction
