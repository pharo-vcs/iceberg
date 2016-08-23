action creators
revertChangeAction
	^ GLMGenericAction new
		action: [ :presentation :entity | entity revertChange: presentation selection ];
		condition: [ :presentation :entity | entity canRevertChanges ];
		icon: GLMUIThemeExtraIcons glamorousUndo;
		title: 'Revert change'; 
		showTitle