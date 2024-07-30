view
gtOverviewFor: aView
	<gtView>
	^ aView columnedList
		title: 'Overview';
		priority: 10;
		items: [ self overview ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Key' text: #first;
		column: 'Value'
			text: #second
			weight: 3;
		send: #last;
		actionUpdateButton