visiting
visitProjectChange: anIceProjectChange 
	
	"Import the project file extracted from the commit without utterly post-treatment to create the new project file"
	self importProjectFile: version basicProject.
	self importPropertiesFile: version basicProject.