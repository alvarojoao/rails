
$(document).ready(function() {
	//jQuery code goes here
var validationBlank = function(...validations){
	var valid = true;
	
	for (var i=0;i<validations.length;i++){
		var validation =$(validations[i]).val()
		if (validation=="")
			valid = false;
	}

	return valid;

};
var validationBudget = function(ad_creative_bid,ad_budget){
	var valid = true;
	var ad_creative_bid = ad_creative_bid|| $("#ad_creative_bid").val()
	var ad_budget =ad_budget||$("#ad_budget").val()
	var ad_budget =parseFloat(ad_budget)
	var ad_creative_bid =parseFloat(ad_creative_bid)
	if (ad_creative_bid>ad_budget){
		valid = false;
	}
	return valid;
};
$( document ).on("submit","#new_ad",function( event ) {
	var validateBlankResult = validationBlank("#ad_creative_adText"
												,"#ad_creative_bid"
												,"#ad_budget"
												)
	var validationBudgetResult = validationBudget()
	if( validateBlankResult&&validationBudgetResult )
		return;
	else {
		event.preventDefault();
		if(!validateBlankResult)
			$("#validation-error").html("Favor preencher os campos Corretamente")
		else if (!validationBudgetResult)
			$("#validation-error").html("Valor Bid superior ao Budget")

	}
});
$( document ).on("submit","#new_targeting",function( event ) {
});
$( document ).on("submit","#new_creative",function( event ) {
	var validateBlankResult = validationBlank("#creative_adText"
												,"#creative_bid")
	var creative_bid = $("#creative_bid").val()
	var ad_budget = $("#ad_budget").html()
	var validationBudgetResult = validationBudget(creative_bid,ad_budget)
	if( validateBlankResult&&validationBudgetResult )
		return;
	else {
		event.preventDefault();
		if(!validateBlankResult)
			$("#validation-error-creative").html("Favor preencher os campos Corretamente")
		else if (!validationBudgetResult)
			$("#validation-error-creative").html("Valor Bid superior ao Budget")

	}
});
$( document ).on("submit","#new_place",function( event ) {
	if( $("#place_address").val()!="" )
		return;
	else {
		event.preventDefault();
	}
});

});
