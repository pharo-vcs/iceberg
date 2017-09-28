building
composePackagesListIn: composite
	composite fastTable
		title: 'Packages';
		display: #savedPackages;
		column: 'Name' evaluated: #nameText width: 200;
		column: 'Status' evaluated: #status;
		addAction: self reloadAllPackagesAction;
		addAction: self addPackageAction;
		addSelectionAction: self browsePackageAction;
		addSelectionAction: self browseLocalPackageAction;
		addSelectionAction: self loadPackageAction;
		addSelectionAction: self unloadPackageAction;
		addSelectionAction: self reloadPackageAction;
		addSelectionAction: self unloadAndRemovePackageAction;
		addSelectionAction: self removePackageAction;
		addSelectionAction: self removePackageFromDiskAction;
		enableFilter: [ :packageModel :pattern | packageModel packageName includesSubstring: pattern caseSensitive: false ];
		"Plugin actions"
		dynamicActionsOnSelection: [ :presentation | 
			presentation selection ifNotNil: [ 
				presentation entity pluginPackageActionsFor: presentation selection entity ]];
		updateOn: IceCommited from: #announcer