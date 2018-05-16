accessing
cellColumn: column row: rowIndex
	| item cell |
	item := self elementAt: rowIndex.
	cell := FTIndentedCellMorph new.
	cell indentBy: item depth * 16.
	cell 
		addMorphBack: (self buttonFor: item);
		addMorphBack: (CheckboxButtonMorph new
			selected: (self isSelected: item data);
			target: [ self toggleSelectionOf: item ];
			actionSelector: #value;
			yourself);
		addMorphBack: (self createCellMorphFor: item).

	^ cell