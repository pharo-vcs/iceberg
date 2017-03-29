menu actions - selected repository
pullFrom
	^ GLMGenericAction new
		selectionAction: #pullFrom;
		selectionCondition: #isOperative;
		"icon: GLMUIThemeExtraIcons glamorousLeftSide;"
		showTitle: 'Pull from...'; 
		yourself
