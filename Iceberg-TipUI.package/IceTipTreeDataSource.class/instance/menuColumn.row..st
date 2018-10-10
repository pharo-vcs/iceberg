accessing
menuColumn: column row: rowIndex
	| menuSelection context |

	menuSelection := self elementAt: rowIndex.
	context := self menuSelectionContextWithSelection: menuSelection data.
	^ CmdContextMenuActivation 
		buildContextMenuFor: self table
		inContext: context