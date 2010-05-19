$(document).ready(function() {
	$('#indicator').hide();
	
	/*
	 * 
	 *  Displays dialog box upon form submission
	 * 
	 */
	
	/*
	$("form").submit(function() {
		 
		// we want to store the values from the form input box, then send via ajax below
		var email     = $('#email').attr('value');
	 
			$.ajax({
				type: "POST",
				url: "add.php",
				data: "email=" + email,
				success: {
				}
			});
		return false;
		});
	*/
	$('#submitb').click(function() {
		$('#indicator').show();  
		$('#formx').submit();
		   
	});
	 
	/*
		Checks whether a query is selected through the checkboxes. If so, enable RUN button.
	*/
	$(':checkbox').click(function(){
		if ($(':checkbox').is(':checked')) {
        	$('#run').removeAttr('disabled');
    	} else {
        	$('#run').attr('disabled', true);    
    	}   
	});

	/*
		Checks if a user-defined query exists in the Advanced Query tab.
		Enables Run button if a query has been inputted.
	*/

	$("#sql").change(function(){
		var sql=$("#sql").val();
		if(sql!=""){
			$("#run").removeAttr('disabled');
		}
		else{
			$('#run').attr('disabled', true);    
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