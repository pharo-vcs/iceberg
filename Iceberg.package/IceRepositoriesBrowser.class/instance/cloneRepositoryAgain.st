actions - selected repository
cloneRepositoryAgain
	^ GLMGenericAction new
		selectionAction: #restoreUpdating:;
		selectionCondition: #isMissing;
		showTitle: 'Clone repository again';
		shortcut: $R;
		yourself
