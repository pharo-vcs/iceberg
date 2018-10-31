private
ensureDirectoryAtPath: aPathSegments inNode: aNode

	| firstChild |
	aPathSegments ifEmpty: [ ^ aNode ].
	firstChild := self ensureDirectoryNamed: aPathSegments first inNode: aNode.
	^ self ensureDirectoryAtPath: aPathSegments allButFirst inNode: firstChild