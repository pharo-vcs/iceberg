accessing
allPathSegments

	self parent ifNil: [ ^ #() ].
	^ self parent allPathSegments copyWith: self key