initialization
initializeCommitPanel
	"This will be initialised in fact on the first refresh"
	self commitPanel 
		addTab: (infoTab := self newInfoTab);
		addTab: (diffTab := self newDiffTab).