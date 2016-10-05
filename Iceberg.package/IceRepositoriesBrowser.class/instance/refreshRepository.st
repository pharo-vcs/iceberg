actions - selected repository
refreshRepository
	^ GLMGenericAction new
		selectionAction: #refreshUpdating:;
		showTitle: 'Refresh repository';
		shortcut: $r

