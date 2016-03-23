$("#search").keyup(function(){
	
	$('.file-name:not(:contains('+$('#search').val()+'))').parent().parent().hide();
    $('.file-name:contains('+$('#search').val()+')').parent().parent().show();

});


//$.getScript('/authentication/filter.js');
/*
$('form').submit(function() {  
    var valuesToSubmit = $(this).serialize();
    $.ajax({
        type: "POST",
        url: $(this).attr('action'), //sumbits it to the given url of the form
        data: {search: $("#search").val()},
        //dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
        console.log("success", json);
    });
    return false; // prevents normal behaviour
});
*/