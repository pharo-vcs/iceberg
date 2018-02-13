initialization
buildToolbarItems
	| menu |
	
	menu := CmdMenu activatedBy: CmdMenuCommandActivationStrategy.
	menu buildInContext: IceTipRepositoryListContext new.
	menu buildToolbarOn: toolbar