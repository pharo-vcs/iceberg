actions
pushThen: aBlock
	UIManager default 
		informUser: ('Pushing to {1}' format: { self remoteName }) 
		during: [
			self withErrorHandlingDo: [ 
				self entity push.
				aBlock value.
				Iceberg announcer announce: (IceRepositoryModified for: self entity) ] ].
	