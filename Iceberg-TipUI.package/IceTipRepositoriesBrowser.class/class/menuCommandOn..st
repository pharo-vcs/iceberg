world menu
menuCommandOn: aBuilder 
	"Add a custom menu item to the world menu"	
	<worldMenu> 
	
	(aBuilder item: #'Iceberg')
		order: 0.8; 
		icon: self icon;  
		parent: #'Tools';
		keyText: 'o, i';
		help: 'Iceberg is a set of tools that allow one to handle git repositories directly from a Pharo image.';
		action: [ self new openWithSpec ]