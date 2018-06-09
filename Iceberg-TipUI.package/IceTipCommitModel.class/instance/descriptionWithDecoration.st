accessing
descriptionWithDecoration
	| tags |
	tags := (', ' join: self entity tagNames) asText allBold makeAllColor: Color gray.
	tags ifNotEmpty: [ tags := tags , ' ' ].
	tags append: self entity comment asText.
	^ tags