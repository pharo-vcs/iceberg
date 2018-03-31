actions
revertChangesRecursivelyAction
	^ GLMGenericAction new
		action: [ :presentation | self entity revertAllChanges: presentation selection ];
		condition: [ self entity canRevertChanges ];
		icon: #glamorousUndo asIcon;
		title: 'Revert changes recursively'; 
		showTitle