private factory
newValue: aStringOrText
	^ IceTipReadOnlyTextMorph new 
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		contentsWrapped: aStringOrText;
		asSpecAdapter