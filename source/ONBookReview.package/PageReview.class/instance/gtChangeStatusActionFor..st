actions
gtChangeStatusActionFor: anAction
	<gtAction>
	<todo: 'Issue an announcement to update the relevant views.'>
	^ anAction dropdown
		icon: BrGlamorousIcons hamburger;
		priority: 10;
		tooltip: 'Change status';
		content: [ :aButton | 
			BrGlamorousSimpleContextMenuContent new
				items: (self class defaultStatusList
						collect: [ :item | 
							item
								-> [ self status: item.

									aButton dispatchEvent: BrDropdownHideWish new ] ]);
				yourself ]