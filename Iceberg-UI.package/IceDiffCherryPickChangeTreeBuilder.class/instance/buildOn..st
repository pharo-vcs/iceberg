building
buildOn: aPresenter
	^ aPresenter cherryPickTree
		allExpanded;
		children: #elements;
		icon: #icon;
		format: #description;
		display: [ self elements ];
		allSelected;
		onChangeOfCherryPick: [ :presentation | self selectedCherryPick: presentation cherryPick ];
		updateOn: IceChangeSetChanged from: #announcer;
		addAction: self refreshTreeAction;
		addSelectionAction: self browseAction;
		addSelectionAction: self browseReferencesAction;
		addSelectionAction: self revertChangeAction;
		addSelectionAction: self revertChangesRecursivelyAction;
		onChangeOfPort: #entity act: [ :presentation | 
			self diff ifNotNil: [
				self diff announcer 
					when: IceChangeSetChanged
					send: #execute:
					to: (IceChangesTreeResetSelectionHelper for: presentation) ] ];
		yourself