focus
refreshFocusOrder
	
	self focusOrder
		removeAll;
		add: self typeList;
		add: self selectedType;
		add: acceptButton;
		add: cancelButton