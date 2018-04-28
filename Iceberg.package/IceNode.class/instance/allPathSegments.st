accessing
allPathSegments

	self parent ifNil: [ ^ { self key } ].
	^ self parent allPathSegments copyWith: self key