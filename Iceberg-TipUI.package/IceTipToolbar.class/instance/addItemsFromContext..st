accessing
addItemsFromContext: aContext
	| menu |
	
	menu := CmdMenu activatedBy: IceTipToolbarActivation.
	menu buildInContext: aContext.
	menu buildToolbarOn: self
