instance creation
newRepositoryAt: aFileReference subdirectories: aCollection

	| result |

	result := self new	location: aFileReference.
	aCollection do: [:each | result addSubdirectory: each ].
	^ result.