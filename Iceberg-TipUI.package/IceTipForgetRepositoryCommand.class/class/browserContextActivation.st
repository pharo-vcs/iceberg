activation
browserContextActivation
	<classAnnotation>
	
	^ CmdContextMenuActivation 
		byRootGroupItemOrder: 10000 "put it at the end"
		for: IceTipRepositoryListContext