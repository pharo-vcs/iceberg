private
newLabel: aString
	^ self newPanel
		listDirection: #rightToLeft;
		addMorph: (FuzzyLabelMorph newLabel: aString);
		asSpecAdapter