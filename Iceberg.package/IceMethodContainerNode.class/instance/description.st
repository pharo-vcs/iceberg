accessing
description

	^ Array
		with: (self ownerNameOf: name isMeta: isMeta)
		with: self isMeta
		with: self isExtension