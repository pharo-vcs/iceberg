actions - selected repository
push
	^ GLMGenericAction new
		action: [ :presentation | 
			presentation selection pushThen: [ presentation pane browser update ]];
		selectionCondition: #canPush;
		icon: GLMUIThemeExtraIcons glamorousRightSide;
		showTitle: 'Push outgoing commits'; 
		shortcut: $P; 
		yourself

