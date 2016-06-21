action creators
createRepositoryAction
	^ GLMGenericAction new
		action: [ :presentation | self class createRepository ifNotNil: [ presentation update ]];
		icon: GLMUIThemeExtraIcons glamorousAdd;
		shortcut: $a;
		title: 'Add repository'; showTitle