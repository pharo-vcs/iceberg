building
createCommitInfoFrom: commitInfo
	| info |
	info := OrderedDictionary newFromPairs: { 
		'Commit Id:'. commitInfo id asString, ' [', commitInfo shortId, ']'.
		'Ancestors(s):'. commitInfo ancestors asCommaString.
		'Timestamp:'. commitInfo datetime asLocalStringYMDHM.
		'Author:'. commitInfo author.
		'Comment:'. commitInfo comment }.
	^ (IceTipReadOnlyForm items: info) buildWithSpec