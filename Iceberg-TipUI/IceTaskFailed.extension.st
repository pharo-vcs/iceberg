Extension { #name : 'IceTaskFailed' }

{ #category : '*Iceberg-TipUI' }
IceTaskFailed >> updateTaskStatus: aPresenter [

	aPresenter taskFailed: self task
]
