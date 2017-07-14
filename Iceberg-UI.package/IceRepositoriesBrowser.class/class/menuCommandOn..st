world menu
menuCommandOn: aBuilder 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Iceberg')
		icon: self icon;
		parent: #MostUsedTools;
		action: [ self open ].
