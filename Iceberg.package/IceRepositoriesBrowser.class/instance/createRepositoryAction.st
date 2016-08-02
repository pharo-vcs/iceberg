action creators
createRepositoryAction
	^ GLMGenericAction new
		action: [ :presentation | self class createRepository ifNotNil: [ presentation pane ]];
		icon: GLMUIThemeExtraIcons glamorousAdd;
		shortcut: $c;
		title: 'Clone new repository'; showTitle