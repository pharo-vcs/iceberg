activation
browserContextActivation
	<classAnnotation>
	
	^ CmdContextMenuCommandActivation 
		byRootGroupItemOrder: 10000 "put it at the end"
		for: IceTipRepositoryListContext