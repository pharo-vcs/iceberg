actions
revertChangeAction
	^ GLMGenericAction new
		action: [ :presentation :entity | entity revertChange: presentation selection ];
		condition: [ :presentation :entity | entity canRevertChanges ];
		icon: #glamorousUndo asIcon;
		title: 'Revert change'; 
		showTitle