accessing
location: aReferenceOrString
	| ref |
	
	ref := aReferenceOrString asFileReference.
	keptLocation ifNotNil: [ 
		| newRef |
		newRef := (self location pathString 
			copyReplaceAll: keptLocation pathString 
			with: ref pathString) 
			asFileReference.
		keptLocation := ref.
		ref := newRef ].
	
	self basicLocation: ref