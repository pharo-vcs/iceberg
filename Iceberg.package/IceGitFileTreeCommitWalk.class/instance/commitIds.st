walking
commitIds
	^ (self repository command: { 
			'log'. from. 
			upto ifNotEmpty: [{'--not'}, upto].  
			maxNumber ifNotNil: [ '-', maxNumber printString ].
			'--format=%H'. 
			modifyingPackage ifNotNil: [{ '--'. modifyingPackage directoryName }]
		}) 
		trim lines 
