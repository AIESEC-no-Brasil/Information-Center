
$("#search").keyup(function(){
	
	$('.file-name:not(:contains('+$('#search').val()+'))').parent().parent().hide();
    $('.file-name:contains('+$('#search').val()+')').parent().parent().show();

});



//$.getScript('/authentication/filter.js');
/*
$('#search').keyup(function() {  
    var valuesToSubmit = $(this).serialize();
    $.ajax({
        type: "POST",
        url: "/authentication/files", //sumbits it to the given url of the form
        data: {search: $("#search").val()},
        //dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(data){
        console.log("success");
        console.log(data);

    });
    return false; // prevents normal behaviour
});
*/
