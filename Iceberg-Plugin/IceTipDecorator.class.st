"
A generic decorator to allow users (plugins) to modify how the elements are displayed.
This defines diverse hooks that can be extended and used in diverse parts 

The decorator list is defined using the pragma <extensionDecorators>

While this is not user in a lot of sides, see `IceTipWorkingCopyBrowser class` to get methods that use <extensionDecorators> pragma. 
It is expected that more decorators will be created with time.

"
Class {
	#name : 'IceTipDecorator',
	#superclass : 'Object',
	#category : 'Iceberg-Plugin-Base',
	#package : 'Iceberg-Plugin',
	#tag : 'Base'
}

{ #category : 'accessing' }
IceTipDecorator >> iconNameForPackage: aPackage [

	^ nil
]
