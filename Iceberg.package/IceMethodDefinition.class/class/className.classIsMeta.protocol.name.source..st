instance-creation
className: aClassName classIsMeta: classIsMeta protocol: protocol name: aString source: source

	^ (self named: aString source: source)
		className: aClassName;
		classIsMeta: classIsMeta;
		protocol: protocol;
		yourself