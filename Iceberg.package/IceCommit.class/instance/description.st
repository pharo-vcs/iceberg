printing
description
	
	self tags
		ifNotEmpty: [ :tags |
			^ ', ' join: (tags collect: [ :each | each name ]) ].
		
	^ 'Detached at {1}' format: { self shortId }