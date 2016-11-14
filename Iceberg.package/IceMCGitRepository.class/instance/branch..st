accessing
branch: aString
	branch := aString.
	frontend ifNotNil: [ frontend branch: self lookupHead ]
