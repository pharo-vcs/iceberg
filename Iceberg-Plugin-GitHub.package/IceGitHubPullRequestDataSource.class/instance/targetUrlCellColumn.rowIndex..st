private
targetUrlCellColumn: column rowIndex: rowIndex
	| url |
	url := (self elementAt: rowIndex) at: column id.
	^ FTCellMorph new  
		addMorphBack: (
			IconicButton new
				target: self;
				actionSelector: #copyToClipboard:;
				arguments: { url };
				labelGraphic: ((self iconNamed: #smallCopy) scaledToSize: 12@12);
				color: Color transparent;
				helpText: ('Copy url {1} to clipboard' format: { url });
				borderWidth: 0;
				yourself);
		yourself
	