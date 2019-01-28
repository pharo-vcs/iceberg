initialization
initializeCommitPanel
	"This will be initialised in fact on the first refresh"

	commitPanel
		addPage: (infoPage := self newInfoPage);
		addPage: (diffPage := self newDiffPage 
			label: 'Diff from ancestor';
			presenterProvider: [ self diff ];
			yourself)