accessing
addItemsFromContext: aContext
	| menu |
	
	menu := CmdMenu activatedBy: IceTipToolbarActivation.
	menu buildInContext: aContext.
	menu buildIceToolbarOn: self
