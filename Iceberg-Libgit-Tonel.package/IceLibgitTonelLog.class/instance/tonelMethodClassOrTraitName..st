private
tonelMethodClassOrTraitName: aMethod
	^ aMethod origin name, (self tonelMethodClassExtension: aMethod), '.st'
	
	