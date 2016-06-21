building
compose
	self tabulator with: [ :browser | 
		browser column: #repositories; column: #packages.
		
		browser transmit to: #repositories; andShow: [ :a | a fastTable 
			title: 'Repositories';
			column: 'Remote host' evaluated: [:repo | repo origin host, '/', repo origin owner ];
			column: 'Project name' evaluated: [: repo | repo origin projectName ];
			column: 'Current branch' evaluated: #branch;
			addAction: self createRepositoryAction;
			addAction: self synchronizeRepositoryAction;
			selectionAct: self switchBranch on: $b entitled: 'Switch branch';
			onChangeOfPort: #strongSelection act: [ :table | IceGlamourSynchronizer synchronize: table selection ]
		].
	
		browser transmit from: #repositories; to: #packages; andShow: [ :a | a fastTable
			title: 'Packages';
			display: #allSavedPackages;
			column: 'Name' evaluated: #packageName;
			column: 'Status' evaluated: [:pkg | self statusFor: pkg ];
			addSelectionAction: self loadPackageAction;
			addSelectionAction: self unloadPackageAction
		].

	]