initialization
initializePresenter
	| currentBranch branches |
	
	super initializePresenter.
	branches := self repository allBranches select: #isRemote.
	currentBranch := branches detect: [ :each | 
		each remoteName = repository pushRemote remoteName
		and: [ each basename = repository currentBranch basename ] ]. 
	self titlePanel text: currentBranch basename.
	self headPanel
		items: branches;
		displayBlock: [ :branch | branch name ];
		setSelectedItem: currentBranch.
	self basePanel
		items: branches;
		displayBlock: [ :branch | branch name ];
		setSelectedItem: (branches detect: [ :each | each ~= currentBranch ])