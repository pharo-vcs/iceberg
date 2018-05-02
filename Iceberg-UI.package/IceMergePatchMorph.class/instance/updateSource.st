updating
updateSource
	"Update the source difference morph."

	
	|sel|
	sel := self selectedChange.
	self diffMorph allowJoinClicks: false"(sel notNil and: [
		sel isConflict and: [sel  isModification]])".
	
	sel isNil
		ifTrue: [self diffMorph
				from: ''
				to: '']
		ifFalse: [
			self diffMorph
				from: sel rightContents
				to: sel leftContents
				contextClass: sel contextClass ].

	(sel isNil or: [sel isConflict not]) ifTrue: [^self].
	sel isLeftChosen
		ifTrue: [self diffMorph indicateDst]
		ifFalse: [self diffMorph indicateSrc]