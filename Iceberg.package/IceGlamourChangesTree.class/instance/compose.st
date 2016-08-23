building
compose
	self fastTree 
		title: self treeTitle;
		allExpanded;
		children: #elements;
		icon: #icon;
		format: #description;
		display: #elements;
		updateOn: IceChangeSetChanged from: #announcer;
		addAction: self refreshTreeAction;
		addSelectionAction: self revertChangeAction