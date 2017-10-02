private
cypressClassOrTraitName: aMethod
	^ aMethod origin name, (self cypressMethodClassExtension: aMethod)
	