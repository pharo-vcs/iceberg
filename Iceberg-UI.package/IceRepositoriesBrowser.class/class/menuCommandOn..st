world menu
menuCommandOn: aBuilder 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Iceberg')
		order: 0.8; 
		icon: self icon;  
		parent: #'MostUsedTools';
		keyText: 'o, i';
		action: [ self open ].
