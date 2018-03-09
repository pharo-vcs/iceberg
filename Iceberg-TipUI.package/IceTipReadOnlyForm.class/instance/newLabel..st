private factory
newLabel: aString
	^ self newPanelMorph
		listDirection: #rightToLeft;
		cellPositioning: #center;
		addMorph: ((LabelMorph newLabel: aString)
			color: self labelColor;
			yourself);
		asSpecAdapter