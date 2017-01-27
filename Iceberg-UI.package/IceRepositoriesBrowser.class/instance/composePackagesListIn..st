building
composePackagesListIn: composite
	composite fastTable
		title: 'Packages';
		display: #savedPackages;
		column: 'Name' evaluated: #nameText width: 200;
		column: 'Status' evaluated: #status;
		addAction: self addPackageAction;
		addSelectionAction: self browsePackage;
		addSelectionAction: self loadPackageAction;
		addSelectionAction: self unloadPackageAction;
		updateOn: IceCommited from: #announcer