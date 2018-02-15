accessing
menuColumn: column row: rowIndex
	| menuSelection context |

	menuSelection := self elementAt: rowIndex.
	context := self menuSelectionContext.
	context selection: menuSelection.		
	^ CmdContextMenuCommandActivation 
		buildMenuFor: self table 
		inContext: context