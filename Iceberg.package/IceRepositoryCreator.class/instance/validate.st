private
validate
	(self location isNil 
		and: [ self url isNil
		and: [ self remote isNil ] ])
		ifTrue: [ IceError signal: 'No location/url or remote defined.' ]