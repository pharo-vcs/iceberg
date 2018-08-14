enumerating
withMetacelloLoadSessionDo: aBlock 
	| context |

	"Use current context or create a new one"
	context := IceMetacelloLoadSessionContext value 
		ifNil: [ IceMetacelloLoadSession new ].

	IceMetacelloLoadSessionContext
		value: context 
		during: aBlock