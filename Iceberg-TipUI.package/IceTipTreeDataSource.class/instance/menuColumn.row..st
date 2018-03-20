accessing
menuColumn: column row: rowIndex
	| menuSelection context |

	menuSelection := self elementAt: rowIndex.
	context := self menuSelectionContextWithSelection: menuSelection data model.
	^ CmdContextMenuCommandActivation 
		buildContextMenuFor: self table
		inContext: context