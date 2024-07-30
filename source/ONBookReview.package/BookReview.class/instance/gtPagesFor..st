accessing
gtPagesFor: aView
	<gtView>
	^ aView columnedList
		title: 'Page reviews';
		priority: 30;
		items: [ self pageReviews ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Status'
			text: [ :item | item status ]
			width: 100;
		column: 'Page'
			text: [ :item | item ]
			width: 300;
		actionUpdateButton