Ext.onReady(function(){

	Ext.QuickTips.init();

	var theform=new Ext.FormPanel({

	labelAlign: 'top',

	frame:true,

	title: '',

	bodyStyle:'padding:5px 5px 0',

	width: 600,
	
	items: [{
		
		layout:'column',

		items:[{

			columnWidth:.5,

			layout: 'form',

			items: [{

				xtype:'textfield',

				fieldLabel: 'First Name',

				name: 'first',

				anchor:'95%'

			}, {

				xtype:'textfield',

				fieldLabel: 'Company',

				name: 'company',

				anchor:'95%'

			}]

},{

columnWidth:.5,

layout: 'form',

items: [{

xtype:'textfield',

fieldLabel: 'Last Name',

name: 'last',

anchor:'95%'

},{

xtype:'textfield',

fieldLabel: 'Email',

name: 'email',

vtype:'email',

anchor:'95%'

}]

}]

},{

xtype:'htmleditor',

id:'bio',

fieldLabel:'Comments',

height:200,

anchor:'98%'

}],


buttons: [{

text: 'Save'

},{

text: 'Cancel'

}]

});

theform.render(document.body);

}); 