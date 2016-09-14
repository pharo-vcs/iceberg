private
buildCommand
	^ { 
		'log'. from. 
		upto ifNotEmpty: [{'--not'}, upto].  
		maxNumber ifNotNil: [ '-', maxNumber printString ].
		'--format=', self format. 
		modifyingPackage ifNotNil: [{ '--'. modifyingPackage directoryName }]
	} 
