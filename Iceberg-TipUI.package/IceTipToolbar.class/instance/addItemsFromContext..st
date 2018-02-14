accessing
addItemsFromContext: aContext
	| menu |
	
	menu := CmdMenu activatedBy: CmdMenuCommandActivationStrategy.
	menu buildInContext: aContext.
	menu buildToolbarOn: self
