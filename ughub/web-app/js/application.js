if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

$(document).ready(function() {
	 $("#comauto").autocomplete({
	  source: function(request, response){
	   $.ajax({
	    url: "/ughub/tag/getTagsByName", // remote datasource
	    data: request,
	    success: function(data){
	     response(data); // set the response
	    },
	    error: function(){ // handle server errors
	     $.jGrowl("Unable to retrieve tags", {
	      theme: 'ui-state-error ui-corner-all'   
	     });
	    }
	   });
	  },
	  minLength: 2, // triggered only after minimum 2 characters have been entered.
	  select: function(event, ui) { // event handler when user selects a company from the list.
	   $("#company\\.id").val(ui.item.id); // update the hidden field.
	   $("#empId").val(ui.item.nasSymbol + "-") // populate the employee field with the nasdaq symbol.
	  }
	 });
	});