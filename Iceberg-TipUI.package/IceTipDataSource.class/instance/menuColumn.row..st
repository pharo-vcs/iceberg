accessing
menuColumn: column row: rowIndex
	| menuSelection context |

	menuSelection := self elementAt: rowIndex.
	context := self menuSelectionContextWithSelection: menuSelection.		
	^ CmdContextMenuCommandActivation 
		buildMenuFor: self table 
		inContext: context