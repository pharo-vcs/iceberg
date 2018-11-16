instance-creation
className: aClassName classIsMeta: classIsMeta protocol: protocol name: aString sourceCode: source

	^ (self named: aString)
		className: aClassName;
		classIsMeta: classIsMeta;
		protocol: protocol;
		sourceCode: source;
		yourself