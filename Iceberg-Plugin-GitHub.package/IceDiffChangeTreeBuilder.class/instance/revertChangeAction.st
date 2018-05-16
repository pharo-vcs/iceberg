actions
revertChangeAction
	^ GLMGenericAction new
		action: [ :presentation | 
			self entity revertChange: presentation selection.
			presentation update. ];
		condition: [ self entity canRevertChanges ];
		icon: #glamorousUndo asIcon;
		title: 'Revert change'; 
		showTitle