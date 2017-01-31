building
composeRepositories: repositories in: composite
	| table |

	table := composite fastTable.
	table
		title: 'Repositories';
		display: [ :repos | repos collect: [ :repo | IceRepositoryModel modelFor: repo ] ];
		column: 'Name' evaluated: #descriptionText width: 200;
		column: 'Current branch' evaluated: #branchName width: 120;
		column: 'Loaded version' evaluated: #loadedCodeDescription width: 200;
		column: 'Status' evaluated: #status width: 150.

	table updateOn: IceRepositoryRegistryModified from: [ Iceberg announcer weak ].
	repositories do: [ :repo | 
		table updateOn: IceRepositoryAnnouncement from: repo announcer ].
	table updateOn: MCPackageModified from: MCPackageManager announcer.
	
	Iceberg announcer weak 
		subscribe: IceRepositoryCreated 
		send: #execute:
		to: (IceRepositoryUpdateHelper for: table).

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
		addSelectionAction: self addRemote;
		addSelectionAction: self pull;
		addSelectionAction: self pullFrom;
		addSelectionAction: self push;
		addSelectionAction: self pushTo;
		addSelectionAction: self cloneRepositoryAgain;
		addSelectionAction: self refreshRepository;
		addSelectionAction: self inspectRepository;
		addSelectionAction: self forgetRepository;
		"Double click action"
		onChangeOfPort: #strongSelection act: [ :presentation | 
			self synchronize: presentation selection repository ]