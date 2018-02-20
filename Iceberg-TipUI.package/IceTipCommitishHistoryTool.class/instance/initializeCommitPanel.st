initialization
initializeCommitPanel
	"This will be initialised in fact on the first refresh"
	self commitPanel 
		addTab: (infoTab := self newInfoTab);
		addTab: (diffFromHeadTab := self newDiffTab label: 'Diff from HEAD');
		addTab: (diffFromAncestorTab := self newDiffTab label: 'Diff from ancestor').