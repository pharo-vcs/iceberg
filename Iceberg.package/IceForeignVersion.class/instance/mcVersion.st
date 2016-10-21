as yet unclassified
mcVersion
	^ mcVersion ifNil: [ mcVersion := self package workingCopy loadedVersion ]