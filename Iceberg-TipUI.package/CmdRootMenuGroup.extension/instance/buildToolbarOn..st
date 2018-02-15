*Iceberg-TipUI
buildToolbarOn: aToolbar
	(contents 
		sorted: [ :a :b | a order < b order ])
		do: [ :each | 
		aToolbar addItem: each buildToolbarItem ]