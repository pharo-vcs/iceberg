building
composeRepositories: repositories in: composite
	| table |
	table := composite fastTable.
	
	table
		title: 'Repositories';
		column: 'Origin' evaluated: [:repo | 
			self highlight: repo origin url accordingToStatusOf: repo ] width: 320;
		column: 'Status' evaluated: [ :repo | self class statusFor: repo ] width: 150;
		column: 'Current branch' evaluated: #branchName width: 120.

	table updateOn: IceRepositoryRegistryModified from: [ Iceberg announcer ].
	repositories do: [ :repo | 
		table updateOn: IceRepositoryAnnouncement from: repo announcer ].
	table updateOn: MCPackageModified from: MCPackageManager announcer.

	table		
		"Task bar menu"
		addAction: self createRepositoryAction;
		addAction: self createLocalRepositoryAction;
		
		"Repository pop up menu"
		addSelectionAction: self showHistoryAction;
		selectionAct: self switchBranch on: $b entitled: 'Switch branch...';
		selectionAct: self createNewBranch on: $B entitled: 'Create new branch...';
		selectionAct: self forgetRepository on: $x entitled: 'Forget repository...';
		addSelectionAction: self synchronizeRepositoryAction;
		addSelectionAction: self pushAction;
		selectionAct: self refreshRepository on: $r entitled: 'Refresh repository';
		addSelectionAction: self inspectRepositoryAction;
		
		"Double click action"
		onChangeOfPort: #strongSelection act: [ :presentation | self synchronize: presentation selection ]
