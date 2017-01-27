private
buildCommand
	^ { 
		'log'. from. 
		upto ifNotEmpty: [{'--not'}, upto].  
		self maxNumber ifNotNil: [ '-', self maxNumber printString ].
		'--format=', self format. 
		modifyingPackage ifNotNil: [{ '--'. modifyingPackage directoryName }]
	} 
