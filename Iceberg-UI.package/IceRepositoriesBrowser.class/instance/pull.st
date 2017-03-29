menu actions - selected repository
pull
	^ GLMGenericAction new
		selectionAction: #pull;
		selectionCondition: #isOperative;
		icon: GLMUIThemeExtraIcons glamorousLeftSide;
		showTitle: 'Pull incoming commits'; 
		shortcut: $p; 
		yourself
