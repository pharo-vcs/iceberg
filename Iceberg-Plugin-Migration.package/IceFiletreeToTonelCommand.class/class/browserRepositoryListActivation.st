activation
browserRepositoryListActivation
	<classAnnotation>
	
	^ CmdContextMenuCommandActivation
		byItemOf: CmdExtraMenuGroup
		order: 100
		for: IceTipRepositoryListContext