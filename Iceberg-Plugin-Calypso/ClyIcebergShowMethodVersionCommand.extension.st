Extension { #name : #ClyIcebergShowMethodVersionCommand }

{ #category : #'*Iceberg-Plugin-Calypso' }
ClyIcebergShowMethodVersionCommand >> execute [

	| browserClass |
	browserClass := #IceTipVersionHistoryBrowser
		asClassInEnvironment: self class environment
		ifAbsent: [ #IceTipExtendedVersionBrowser asClass ].
		
	(browserClass repository: repository method: method) open

]
