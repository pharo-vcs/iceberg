actions - selected repository
pull
	^ GLMGenericAction new
		selectionAction: #pull;
		selectionCondition: #isOperative;
		icon: GLMUIThemeExtraIcons glamorousLeftSide;
		showTitle: 'Pull incomming commits'; 
		shortcut: $p; 
		yourself
