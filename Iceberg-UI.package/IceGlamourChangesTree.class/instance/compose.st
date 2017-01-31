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
		addSelectionAction: self browseAction;
		addSelectionAction: self browseReferencesAction;
		addSelectionAction: self revertChangeAction;
		onChangeOfPort: #entity act: [ :presentation :diff | 
			diff ifNotNil: [ 
				diff announcer weak 
					subscribe: IceChangeSetChanged 
					send: #execute:
					to: (IceChangesTreeResetSelectionHelper for: presentation) ] ]
