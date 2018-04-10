initialization
initializeCommitPanel
	"This will be initialised in fact on the first refresh"

	commitTabPanel
		addTab: (infoTab := self newInfoTab);
		addTab: (headTab := self newDiffTab 
			label: 'Diff from HEAD';
			whenTabSelected: [ self refreshDiffFromHead ];
			yourself);
		addTab: (ancestorTab := self newDiffTab 
			label: 'Diff from ancestor';
			whenTabSelected: [ self refreshDiffFromAncestor ];
			yourself).
		
	headTabContainer tab: headTab.
	ancestorTabContainer tab: ancestorTab