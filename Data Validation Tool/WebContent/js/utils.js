$(document).ready(function() {
	
	
	/*
	 * 
	 * Creates the dialog box that appears when queries are being executed
	 * 
	 */
	var $dialog = $('<div></div>')
	.html('<div id="msgBox"><img src="images/ajax-loader.gif"/><h2>Processing request...</h2></div>')
	.dialog({
		autoOpen: false,
		title: '',
		closeOnEscape: false,
		draggable: false,
		resizable: false,
		modal: true,
		open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); }

	});
	
	/*
	 * 
	 * Submits form at click of button
	 * 
	 */
	
	
	$("#submitb").click(function(){
		$dialog.dialog('open');
		$('#formx').submit();
	});
	
	/*
	 * 
	 * Reset all form values except text fields and hidden fields
	 * 
	 */
	$("#resetb").click(function(){
		$(':input','#formx').not(':text,:hidden').val('').removeAttr('checked').removeAttr('selected');
	});
	
	
	/*
		Checks whether a query is selected through the checkboxes. If so, enable RUN button.
	*/
	$(':checkbox').click(function(){
		if ($(':checkbox').is(':checked')) {
        	$('#submitb').removeAttr('disabled');
    	} else {
        	$('#submitb').attr('disabled', true);    
    	}   
	});

	/*
		Checks if a user-defined query exists in the Advanced Query tab.
		Enables Run button if a query has been inputted.
	*/

	$("#sql").change(function(){
		var sql=$("#sql").val();
		if(sql!=""){
			$("#submitb").removeAttr('disabled');
		}
		else{
			$('#submitb').attr('disabled', true);    
		}
	});
	

	
	/*
	
	*/
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content
	
	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(300); //Fade in the active content
		return false;
	});

	//all queries
	 $("#selectAllQ").click(function(){
		this.blur();
	    /*$("#tab1>input:checkbox").each(function(){
	                this.checked = true;
	    });*/
	    $("#tab2>input:checkbox").each(function(){
            this.checked = true;
		});
	    $("#tab3>*>input:checkbox").each(function(){
            this.checked = true;
		});
	 });

	 $("#deselectAllQ").click(function(){
		 	this.blur();
		    $("#tab1>input:checkbox").each(function(){
		        this.checked = false;
		    });
		    $("#tab2>input:checkbox").each(function(){
                this.checked = false;
   			 });
		    $("#tab3>*>input:checkbox").each(function(){
                this.checked = false;
    		});
	});

	//queries in Database foreign key references table
	 $("#gmsSelectAll").click(function(){
			this.blur();
		    $("#gmsField>input:checkbox").each(function(){
		                this.checked = true;
		    });
		   
		 });

		 $("#gmsDSelectAll").click(function(){
			 	this.blur();
			    $("#gmsField>input:checkbox").each(function(){
			        this.checked = false;
			    });
			    
		});

		 $("#dmsSelectAll").click(function(){
				this.blur();
			    $("#dmsField>input:checkbox").each(function(){
			                this.checked = true;
			    });
			   
			 });

			 $("#dmsDSelectAll").click(function(){
				 	this.blur();
				    $("#dmsField>input:checkbox").each(function(){
				        this.checked = false;
				    });
				    
			});	


			//submit form using ajax
			
	
});