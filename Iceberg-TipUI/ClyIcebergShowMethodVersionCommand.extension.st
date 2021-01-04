Extension { #name : #ClyIcebergShowMethodVersionCommand }

{ #category : #'*Iceberg-TipUI' }
ClyIcebergShowMethodVersionCommand >> execute [
		
	(IceTipVersionHistoryBrowser onRepository: repository method: method) openWithSpec
]
