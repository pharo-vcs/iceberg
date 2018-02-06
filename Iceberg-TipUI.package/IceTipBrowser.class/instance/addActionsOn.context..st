building
addActionsOn: aPresentation context: aContext
	| menu |

	menu := CmdMenu activatedBy: CmdMenuCommandActivationStrategy.
	menu buildInContext: aContext.
	menu buildGlamourToolbarOn: aPresentation	