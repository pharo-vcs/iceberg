building
composeRepositories: repositories in: composite
	| table |
	table := composite fastTable.
	
	table
		title: 'Repositories';
		display: [ :repos | repos collect: [ :repo | IceRepositoryModel modelFor: repo ] ];
		column: 'Origin' evaluated: #originText width: 320;
		column: 'Status' evaluated: #status width: 150;
		column: 'Current branch' evaluated: #branchName width: 120.

	table updateOn: IceRepositoryRegistryModified from: [ Iceberg announcer ].
	repositories do: [ :repo | 
		table updateOn: IceRepositoryAnnouncement from: repo announcer ].
	table updateOn: MCPackageModified from: MCPackageManager announcer.
	
	Iceberg announcer weak 
		subscribe: IceRepositoryCreated do: [ :ann | table updateOn: IceRepositoryAnnouncement from: ann repository announcer ].

	table		
		"Task bar menu"
		addAction: self createRepository;
		addAction: self createLocalRepository;
		addAction: self fetchAllRepositories;
		
		"Repository pop up menu"
		addSelectionAction: self synchronizeRepository;
		addSelectionAction: self showHistory;
		addSelectionAction: self switchBranch;
		addSelectionAction: self createNewBranch;
		addSelectionAction: self pull;
		addSelectionAction: self push;
		addSelectionAction: self cloneRepositoryAgain;
		addSelectionAction: self refreshRepository;
		addSelectionAction: self inspectRepository;
		addSelectionAction: self forgetRepository;
		
		"Double click action"
		onChangeOfPort: #strongSelection act: [ :presentation | self synchronize: presentation selection repository ]
