visiting
visitCheckoutConflict: anError
	UIManager default 
		alert: anError messageText
		title: 'Iceberg conflicts while checking out'