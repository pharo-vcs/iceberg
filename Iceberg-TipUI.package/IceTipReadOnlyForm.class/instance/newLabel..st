private factory
newLabel: aString
	^ self newPanel
		listDirection: #rightToLeft;
		cellPositioning: #center;
		addMorph: ((LabelMorph newLabel: aString)
			color: self labelColor;
			yourself);
		asSpecAdapter