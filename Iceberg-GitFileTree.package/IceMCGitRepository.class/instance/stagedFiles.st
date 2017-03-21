actions
stagedFiles
	| modifiedFiles|
	modifiedFiles := OrderedCollection new.
	(self command: #('status' '-s'))
		linesDo: [ :line |
			modifiedFiles add: line substrings second asFileReference ].
	^ modifiedFiles