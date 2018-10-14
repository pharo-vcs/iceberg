accessing
latestTagPartsIn: tagNames
	| prefix parts |
	"Find the highest numeric version with optional 'v' prefix. Set any missing parts to 0. For proper comparison (build data, prerelease, etc.), a Semver library is needed."
	parts := #('v' 0 0 0).
	prefix := 'v'.
	(tagNames select: [ :each | 'v?[0-9]' asRegex matchesPrefix: each ])
		ifNotEmpty: [ :tags | 
			| latestTag |
			latestTag := tags sorted last.
			parts := ((latestTag beginsWith: prefix)
				ifTrue: [ #('v') ]
				ifFalse: [ #('') ])
				, ((((latestTag withoutPrefix: prefix) copyUpTo: $-) splitOn: '.') collect: #asNumber).
			parts := parts , (#(0 0 0) first: 4 - parts size) ].
	^ parts