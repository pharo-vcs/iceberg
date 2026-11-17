Extension { #name : 'IceTaskFinished' }

{ #category : '*Iceberg-TipUI' }
IceTaskFinished >> updateTaskStatus: aPresenter [

	aPresenter taskFinished: self task
]
