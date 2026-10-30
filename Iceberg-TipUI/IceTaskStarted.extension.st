Extension { #name : 'IceTaskStarted' }

{ #category : '*Iceberg-TipUI' }
IceTaskStarted >> updateTaskStatus: aPresenter [

	aPresenter taskStarted: self task
]
