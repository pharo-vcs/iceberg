private
tableRefresh
	self table ifNil: [ ^ self ].
	^ super tableRefresh 