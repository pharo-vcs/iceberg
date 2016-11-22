instance creation
withOptions: aCollection on: target selector: selector
	^ self new 
		options: (aCollection collect: [:value | 
			IceTestParameterValue new 
				value: value;
				target: target;
				selector: selector]); 
		yourself