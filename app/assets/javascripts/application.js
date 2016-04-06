//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(".path-link").on("click", function(){
	var numb_id = $(this).attr("id").slice(2);
	var form_id = "#form-".concat(numb_id);
	$(form_id).submit();
});

function buttonSelected(e) {
   $('.select-button').toggleClass('button-checked');
   var target = e.target;
   current_class = target.getAttribute("class");
   target.setAttribute("class",  current_class ==="select-button" ? "select-button-selected" :  "select-button");
​
 }
​
 
 function checkSelectedTags(){
​
​
 	var selectedElements = document.getElementsByClassName("select-button-selected");
 	var idSelectedElements = [];
 	for (i = 0; i < selectedElements.length; i++) {
     	idSelectedElements[i] = selectedElements[i].getAttribute("value");
    }
	
	$.ajax({
        url: "/authentication/selected_buttons",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        type: "post",
        data: {tags_ids: idSelectedElements} 
    });
 }