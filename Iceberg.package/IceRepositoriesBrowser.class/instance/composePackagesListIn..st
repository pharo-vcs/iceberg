building
composePackagesListIn: composite
	composite fastTable
		title: 'Packages';
		display: #savedPackages;
		column: 'Name' evaluated: #nameText width: 150;
		column: 'Status' evaluated: #status;
		column: 'Loaded version' evaluated: #loadedVersionName width: 50;
		addAction: self addPackageAction;
		addSelectionAction: self browsePackage;
		addSelectionAction: self loadPackageAction;
		addSelectionAction: self unloadPackageAction;
		updateOn: IceCommited from: #announcer