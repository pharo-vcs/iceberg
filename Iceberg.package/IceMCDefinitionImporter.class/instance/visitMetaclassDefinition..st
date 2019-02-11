visiting
visitMetaclassDefinition: aMCClassDefinition
	"We do nothing because of Monticello meta-model.
	
	The problem is that Monticello visitor does not launch the Metaclass visit if the metaclass does not have any class instance variables or Trait composition. We need this information all the time so we will generate it in the class visit.
	
	The concrete method it MCClassDefinition>>accept:"

	