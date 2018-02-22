initialization
initializeCommitPanel
	"This will be initialised in fact on the first refresh"
	commitTabPanel
		addTab: (infoTab := self newInfoTab);
		addTab: (diffFromHeadTab := self newDiffTab 
			label: 'Diff from HEAD';
			whenTabSelected: [ self refreshDiffFromHead ];
			yourself);
		addTab: (diffFromAncestorTab := self newDiffTab 
			label: 'Diff from ancestor';
			whenTabSelected: [ self refreshDiffFromAncestor ];
			yourself).