activation
browserContextActivation
	<classAnnotation>
	
	^ CmdContextMenuCommandActivation 
		byRootGroupItemOrder: 10001 "put it at the end"
		for: IceTipRepositoryListContext