building
addSelectionActionsOn: aPresentation context: aContext
	| menu |

	menu := CmdMenu activatedBy: CmdContextMenuCommandActivation.
	menu buildInContext: aContext.
	menu buildGlamourContextMenuOn: aPresentation 