building
buildOn: aPresenter
	^ aPresenter fastTree
		allExpanded;
		children: #children;
		icon: #icon;
		format: #description;
		display: [ self changes ];
		updateOn: IceChangeSetChanged from: #announcer;
		addAction: self refreshTreeAction;
		addSelectionAction: self inspectAction;
		addSelectionAction: self browseAction;
		addSelectionAction: self browseReferencesAction;
		addSelectionAction: self revertChangeAction;
		addSelectionAction: self installAction;
		yourself