accessing
iceLabelWidth
	^ labelWidth ifNil: [ self class defaultLabelWidth ]