sorting
sort: aListOfPackages
	| result packages lasts |
	packages := aListOfPackages.
	result := OrderedCollection new.
	self first = #none ifFalse: [ result addAll: (self sortByName: (self selectMatching: self first from: packages)) ].
	packages := packages copyWithoutAll: result.
	lasts := self last = #none ifTrue: [ {} ] ifFalse: [ self selectMatching: self last from: packages ].
	packages := packages copyWithoutAll: lasts.
	result addAll: (self sortByName: packages).
	result addAll: (self sortByName: lasts).
	^ result