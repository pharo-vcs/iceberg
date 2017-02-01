initialization
initializePresenter
	| currentBranch  |
	
	super initializePresenter.
	currentBranch := self branches detect: [ :each | 
		each remoteName = repository pushRemote remoteName
		and: [ each basename = repository currentBranch basename ] ]. 
	self titlePanel text: currentBranch basename.
	self headPanel
		items: self branches;
		displayBlock: [ :branch | branch name ];
		setSelectedItem: currentBranch.
	self basePanel
		items: self branches;
		displayBlock: [ :branch | branch name ];
		setSelectedItem: (self branches detect: [ :each | each ~= currentBranch ])