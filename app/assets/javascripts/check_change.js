$('.filter-button').click(function(){
	$(this).toggleClass('button-checked');
	$.ajax({
	  type: "POST",
	  url: "/authentication/files",
	  data: { search: $(this).text() },
	  success: function(){
	  	$('tbody').hide();
	  	$('filtered-results').html('<%= escape_javascript(render @archives.where({show: true, path: session[:dbox_path]}))%>');
	  }
	  
	});
	var filtered = $.post( "/authentication/files", { search: $(this).text() });
	filtered.done(function(){
		//alert("Dados carregados");
		console.log(filtered);
	});
});

