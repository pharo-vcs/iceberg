accessing
allPathSegments

	self isRoot ifTrue: [ ^ #() ].
	self parent isRoot ifTrue: [ ^ { self key } ].
	^ self parent allPathSegments copyWith: self key