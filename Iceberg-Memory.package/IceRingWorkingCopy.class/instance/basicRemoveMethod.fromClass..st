helpers
basicRemoveMethod: selector fromClass: aClassName

	| class method |
	class := ringEnvironment ensureClassNamed: aClassName.
	method := class localMethodNamed: selector ifAbsent: [ ^ NotFound signalFor: selector ].
	class removeLocalMethod: method.
	^ method