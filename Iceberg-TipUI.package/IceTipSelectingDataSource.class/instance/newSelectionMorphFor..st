private factory
newSelectionMorphFor: item
	^ CheckboxButtonMorph new
		selected: (self isSelected: item);
		target: [ self toggleSelectionOf: item ];
		actionSelector: #value;
		yourself	