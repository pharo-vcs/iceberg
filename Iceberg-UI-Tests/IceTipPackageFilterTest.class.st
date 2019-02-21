Class {
	#name : #IceTipPackageFilterTest,
	#superclass : #TestCase,
	#category : 'Iceberg-UI-Tests'
}

{ #category : #tests }
IceTipPackageFilterTest >> testMatches [
	| filter package |
	filter := IceTipPackageFilter new.
	package := self class package.
	filter pattern: 'Iceberg'.
	self assert: (filter matches: package).
	filter pattern: 'ICEBERG'.
	self assert: (filter matches: package).
	filter pattern: 'iceberg'.
	self assert: (filter matches: package).
	filter pattern: 'noticeberg'.
	self deny: (filter matches: package)
]
