menu actions - selected repository
pushAction
	^ GLMGenericAction new
		action: [ :presentation | 
			presentation selection pushThen: [ presentation pane browser update ]];
		selectionCondition: #canPush;
		icon: #glamorousRightSide asIcon;
		showTitle: 'Push'; 
		shortcut: $P; 
		yourself

