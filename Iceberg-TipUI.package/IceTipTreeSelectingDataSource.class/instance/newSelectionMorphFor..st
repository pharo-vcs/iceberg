private factory
newSelectionMorphFor: item
	^ CheckboxButtonMorph new
		selected: (self isSelected: item data);
		target: [ self toggleSelectionOf: item ];
		actionSelector: #value;
		yourself	