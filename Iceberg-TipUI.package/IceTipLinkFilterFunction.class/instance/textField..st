accessing
textField: aTextPresenter
	textField := aTextPresenter.
	textField whenTextChanged: [ :ann | self textUpdated: ann ]