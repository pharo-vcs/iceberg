accessing
textField: aTextPresenter
	textField := aTextPresenter.
	textField whenTextChangedDo: [ :ann | self textUpdated: ann ]