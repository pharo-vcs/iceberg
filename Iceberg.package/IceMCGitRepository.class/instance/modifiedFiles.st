actions
modifiedFiles
	| modifiedFiles|
	modifiedFiles := OrderedCollection new.
	(self command: #('status' '-s'))
		linesDo: [ :line |
			modifiedFiles add: (' ' split: line trim) second asFileReference ].
	^ modifiedFiles