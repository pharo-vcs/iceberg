"
This class is responsibly of adding the custom styles used by Iceberg.
This class is call by Spec2 to extend the default stylesheet.
Check its superclass to understand the way of working.
"
Class {
	#name : #IceTipStyleContributor,
	#superclass : #StPharoStyleContributor,
	#category : #'Iceberg-TipUI-Styles'
}

{ #category : #styles }
IceTipStyleContributor >> styleSheetContribution [
	
	^ SpStyle newApplication 
		addClass: 'textInputField' with: [ :textClass |
			textClass addClass: 'iceTipReadonly' with: [ :iceTipReadonly |
			iceTipReadonly addPropertyDrawWith: [ :draw | draw color: Color transparent ] ]]	;
		addClass: 'text' with: [ :textClass |
			textClass addClass: 'iceTipReadonly' with: [ :iceTipReadonly |
			iceTipReadonly addPropertyDrawWith: [ :draw | draw color: Color transparent ] ]];
		yourself
]
