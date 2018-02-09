accessing
status
	"entity could be a repository or a package"
	[
		self entity repository isMissing ifTrue: [ ^ self toErrorMessage: 'Local repository missing' ].
		self entity isLoaded ifFalse: [ ^ 'Not loaded' ].
		self entity isModified ifTrue: [ ^ 'Uncommited changes' ].
		^ 'Up to date' ] 
	on: Error do: [ :e | 
		^ self toErrorMessage: e description ]