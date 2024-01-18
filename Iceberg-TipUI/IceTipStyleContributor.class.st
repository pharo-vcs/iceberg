"
This class is responsibly of adding the custom styles used by Iceberg.
This class is call by Spec2 to extend the default stylesheet.
Check its superclass to understand the way of working.
"
Class {
	#name : 'IceTipStyleContributor',
	#superclass : 'StPharoStyleContributor',
	#category : 'Iceberg-TipUI-Styles',
	#package : 'Iceberg-TipUI',
	#tag : 'Styles'
}

{ #category : 'styles' }
IceTipStyleContributor >> styleSheetContribution [
	
	^ SpStyle newApplication 
		addClass: 'libgit2NotAvailable' with: [ :aClass | aClass 
			addPropertyDrawWith: [ :draw | draw backgroundColor: Color orange ];
			addPropertyFontWith: [ :font | font color: Color white ] ];
		addClass: 'textInputField' with: [ :textClass | textClass 
			addClass: 'iceTipReadonly' with: [ :iceTipReadonly | iceTipReadonly 
				addPropertyDrawWith: [ :draw | draw color: Color transparent ] ] ];
		addClass: 'text' with: [ :textClass | textClass 
			addClass: 'iceTipReadonly' with: [ :iceTipReadonly | iceTipReadonly 
				addPropertyDrawWith: [ :draw | draw color: Color transparent ];
			addClass: 'iceTipText4Lines' with: [ :iceTipText4Lines | iceTipText4Lines 
				addPropertyGeometryWith: [ :geo | geo height: 80 ] ] ] ];
		yourself
]
