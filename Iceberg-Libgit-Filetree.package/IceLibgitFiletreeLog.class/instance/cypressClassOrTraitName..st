private
cypressClassOrTraitName: aMethod
	^ aMethod origin instanceSide name, (self cypressMethodClassExtension: aMethod)
	