updating
updateSource
	"Update the source difference morph."

	|sel|
	sel := self selectedChange.
	sel isNil
		ifTrue: [self diffMorph
				from: ''
				to: '']
		ifFalse: [
			self diffMorph
				from: sel leftContents
				to: sel rightContents
				contextClass: sel contextClass ]