action creators
createLocalRepositoryAction
	^ GLMGenericAction new
		action: [ :presentation | self class createLocalRepository ifNotNil: [ presentation pane ]];
		icon: GLMUIThemeExtraIcons glamorousAdd;
		shortcut: $a;
		title: 'Add local repository'; showTitle