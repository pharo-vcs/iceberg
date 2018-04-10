private
tonelClassOrTraitName: aClass
	^ aClass name, (self tonelClassExtension: aClass), '.st'