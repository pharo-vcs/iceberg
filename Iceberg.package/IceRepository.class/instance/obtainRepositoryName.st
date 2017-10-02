private
obtainRepositoryName
	self origin isUndefined
		ifFalse: [ ^ self origin projectBasename ].
	"guess from location"
	^ self location basename 