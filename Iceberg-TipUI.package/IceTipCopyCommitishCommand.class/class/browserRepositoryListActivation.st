activation
browserRepositoryListActivation
	<classAnnotation>
	
	^ CmdContextMenuCommandActivation
		byItemOf: CmdExtraMenuGroup
		order: 10000
		for: IceTipRepositoryListContext