accessing
menuColumn: column row: rowIndex
	| menuSelection context |

	menuSelection := self elementAt: rowIndex.
	context := self menuSelectionContextWithSelection: menuSelection data.		
	^ CmdContextMenuCommandActivation 
		buildMenuFor: self table
		inContext: context