
$(document).ready(function() {
	//jQuery code goes here
var validationBlank = function(){
	var valid = true;
	
	var ad_creative_adText =$("#ad_creative_adText").val()
	var ad_creative_bid =$("#ad_creative_bid").val()
	var ad_budget =$("#ad_budget").val()
	var ad_targeting_address =$("#ad_targeting_address").val()
	if (ad_creative_adText==""||
		ad_creative_bid==""||
		ad_budget==""||
		ad_targeting_address==""){
		valid=false;
	}

	return valid;
	

};
var validationBudget = function(){
	var valid = true;
	var ad_creative_bid =$("#ad_creative_bid").val()
	var ad_budget =$("#ad_budget").val()
	var ad_budget =parseInt(ad_budget)
	var ad_creative_bid =parseInt(ad_creative_bid)
	if (ad_creative_bid>ad_budget){
		valid = false;
	}
	return valid;
};
$( document ).on("submit","#new_ad",function( event ) {
	var validateBlankResult = validationBlank()
	var validationBudgetResult = validationBudget()
	if( validateBlankResult&&validationBudgetResult )
		return;
	else {
		event.preventDefault();
		if(!validateBlankResult)
			$("#validation-error").append("Favor preencher os campos Corretamente")
		if (!validationBudgetResult)
			$("#validation-error").append("Valor Bid superior ao Budget")

	}
});
$( document ).on("submit","#new_targeting",function( event ) {
	// targeting_places_address
	//validation-error-targeting
	if( validateBlankResult&&validationBudgetResult )
		return;
	else {
		event.preventDefault();
		if(!validateBlankResult)
			$("#validation-error").append("Favor preencher os campos Corretamente")
		if (!validationBudgetResult)
			$("#validation-error").append("Valor Bid superior ao Budget")

	}
});
$( document ).on("submit","#new_creative",function( event ) {
	// creative_adText
	// creative_bid
	//validation-error-creative
	if( validateBlankResult&&validationBudgetResult )
		return;
	else {
		event.preventDefault();
		if(!validateBlankResult)
			$("#validation-error").append("Favor preencher os campos Corretamente")
		if (!validationBudgetResult)
			$("#validation-error").append("Valor Bid superior ao Budget")

	}
});
$( document ).on("submit","#new_place",function( event ) {
	// place_address
	// validation-error-place
	if( validateBlankResult&&validationBudgetResult )
		return;
	else {
		event.preventDefault();
		if(!validateBlankResult)
			$("#validation-error").append("Favor preencher os campos Corretamente")
		if (!validationBudgetResult)
			$("#validation-error").append("Valor Bid superior ao Budget")

	}
});

});
