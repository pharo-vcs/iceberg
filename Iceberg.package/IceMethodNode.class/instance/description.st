accessing
description
	
	^ Array
		with: self parent name
		with: self name
		with: self parent isMeta
		with: self parent isExtension