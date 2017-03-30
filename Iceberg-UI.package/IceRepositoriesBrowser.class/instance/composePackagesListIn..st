building
composePackagesListIn: composite
	composite fastTable
		title: 'Packages';
		display: #savedPackages;
		column: 'Name' evaluated: #nameText width: 200;
		column: 'Status' evaluated: #status;
		addAction: self reloadAllPackagesAction;
		addAction: self addPackageAction;
		addSelectionAction: self browsePackage;
		addSelectionAction: self loadPackageAction;
		addSelectionAction: self unloadPackageAction;
		addSelectionAction: self reloadPackageAction;
		updateOn: IceCommited from: #announcer