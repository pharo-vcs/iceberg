building
composePackagesListIn: composite
	composite fastTable
		title: 'Packages';
		display: #savedPackages;
		column: 'Name' evaluated: [:pkg | self highlight: pkg name accordingToStatusOf: pkg ] width: 150;
		column: 'Status' evaluated: [:pkg | self class statusFor: pkg ];
		column: 'Loaded version' evaluated: #loadedVersionName width: 50;
		addAction: self addPackageAction;
		addSelectionAction: self loadPackageAction;
		addSelectionAction: self unloadPackageAction;
		updateOn: IceCommited from: #announcer