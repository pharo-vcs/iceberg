initialization
initializeCommitPanel
	"This will be initialised in fact on the first refresh"

	commitPanel
		addPage: (infoPage := self newInfoPage);
		addPage: (diffPage := self newDiffPage 
			title: 'Diff from ancestor';
			presenterProvider: [ self diff ];
			yourself)