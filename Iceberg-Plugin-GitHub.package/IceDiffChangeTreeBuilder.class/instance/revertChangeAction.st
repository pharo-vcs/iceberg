actions
revertChangeAction
	^ GLMGenericAction new
		action: [ :presentation | 
			self entity revertChange: presentation selection.
			presentation update. ];
		condition: [ self entity canRevertChanges ];
		icon: (self iconNamed: #glamorousUndo);
		title: 'Revert change'; 
		showTitle