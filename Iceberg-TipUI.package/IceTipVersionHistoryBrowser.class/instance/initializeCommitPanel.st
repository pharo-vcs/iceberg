initialization
initializeCommitPanel
	"This will be initialised in fact on the first refresh"

	commitTabPanel
		addTab: (infoTab := self newInfoTab);
		addTab: (diffTab := self newDiffTab 
			label: 'Diff from ancestor';
			whenTabSelected: [ self refreshDiff ];
			yourself)