actions - selected repository
push
	^ GLMGenericAction new
		action: [ :presentation | 
			self 
				pushRepository: presentation selection repository
				andThen: [ presentation pane browser update ]];
		selectionCondition: #canPush;
		icon: GLMUIThemeExtraIcons glamorousRightSide;
		showTitle: 'Push outgoing commits'; 
		shortcut: $p; 
		yourself

