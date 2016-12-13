action creations
mergeIntoCurrentBranch
	^ GLMGenericAction new
		action: [ :presentation |
			self 
				mergeIntoCurrentBranch: presentation selection
				andThen: [
					presentation selection: nil.
					presentation pane browser update 
				]];
		icon: GLMUIThemeExtraIcons glamorousLeftSide;
		shortcut: $M;
		title: 'Merge into current branch'; 
		showTitle