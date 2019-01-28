initialization
initializeCommitPanel
	"This will be initialised in fact on the first refresh"

	notebookPanel
		addPage: (infoPage := self newInfoPage);
		addPage: (headPage := self newDiffPage 
			title: 'Diff from HEAD';
			presenterProvider: [ self diffFromHead ];
			yourself);
		addPage: (ancestorPage := self newDiffPage 
			title: 'Diff from ancestor';
			presenterProvider: [ self diffFromAncestor ];
			yourself)