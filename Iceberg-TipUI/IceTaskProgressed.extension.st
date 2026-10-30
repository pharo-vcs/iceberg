Extension { #name : 'IceTaskProgressed' }

{ #category : '*Iceberg-TipUI' }
IceTaskProgressed >> updateTaskStatus: aPresenter [

	aPresenter title: self title current: self current max: self max
]
