comparing
isNewerThan: another
	another ifNil: [ self haltOnce ].
	^ self entry info timeStamp > another entry info timeStamp