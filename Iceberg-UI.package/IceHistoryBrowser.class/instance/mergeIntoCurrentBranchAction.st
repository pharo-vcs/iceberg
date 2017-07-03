action creations
mergeIntoCurrentBranchAction
	^ GLMGenericAction new
		action: [ :presentation |
			IceMergeTool new 
				source: presentation selection;
				targetBranch: presentation selection repository branch;
				onMerge: [
					presentation selection: nil.
					presentation pane browser update ];
				run ];
		icon: GLMUIThemeExtraIcons glamorousLeftSide;
		shortcut: $M;
		title: 'Merge into current branch'; 
		showTitle