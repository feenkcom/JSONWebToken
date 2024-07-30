view
overview
	| overview |
	overview := {{'Page'.
				page title.
				page}.
			{'Status'.
				status}} asOrderedCollection.
	self notes
		ifNotNil: [ overview
				addLast: {'Notes'.
						notes title.
						notes} ].
	^ overview