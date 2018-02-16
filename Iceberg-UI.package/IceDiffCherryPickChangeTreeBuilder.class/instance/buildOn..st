building
buildOn: aPresenter
	^ aPresenter cherryPickTree
		allExpanded;
		children: #changes;
		icon: #icon;
		format: #description;
		display: [ self changes ];
		allSelected;
		onChangeOfCherryPick: [ :presentation | self selectedCherryPick: presentation cherryPick ];
		updateOn: IceChangeSetChanged from: #announcer;
		addAction: self refreshTreeAction;
		addSelectionAction: self browseAction;
		addSelectionAction: self browseReferencesAction;
		addSelectionAction: self revertChangeAction;
		yourself