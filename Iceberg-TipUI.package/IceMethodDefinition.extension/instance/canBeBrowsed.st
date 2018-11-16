*Iceberg-TipUI
canBeBrowsed
	
	^ Smalltalk globals at: className
		ifPresent: [ :class | class includesSelector: name ]
		ifAbsent: [ false ]