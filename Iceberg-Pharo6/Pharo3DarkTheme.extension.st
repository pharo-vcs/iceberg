Extension { #name : #Pharo3DarkTheme }

{ #category : #'*Iceberg-Pharo6' }
Pharo3DarkTheme >> badgeColor [
	^ Color red alpha: 0.5
]

{ #category : #'*Iceberg-Pharo6' }
Pharo3DarkTheme >> badgeTextColor [
	^ self textColor
]

{ #category : #'*Iceberg-Pharo6' }
Pharo3DarkTheme >> dangerTextColor [
	^ Color
		r: 239
		g: 83
		b: 80
		range: 255
]

{ #category : #'*Iceberg-Pharo6' }
Pharo3DarkTheme >> disabledTextColor [ 
	^ Color gray lighter
]

{ #category : #'*Iceberg-Pharo6' }
Pharo3DarkTheme >> successTextColor [
	^ Color green darker darker darker
]

{ #category : #'*Iceberg-Pharo6' }
Pharo3DarkTheme >> warningTextColor [
	^ Color yellow darker darker
]
