private
tonelMethodClassOrTraitName: aMethod
	^ aMethod origin instanceSide name, (self tonelMethodClassExtension: aMethod), '.st'
	
	