function collapseAction() { // bootstrap 사용 시 navbar-collapse collapsing 후 navbar-collapse collapse show만 반환하여 작동을 못함
	let toggler = document.getElementById("custom_toggler");
	let collapse = document.getElementById("custom_collapse");
	
	var item = $('.nav-item').length;
	var height = item*40 + 2;
	
	if (toggler.classList.value == "navbar-toggler collapsed") {
		toggler.setAttribute("class", "navbar-toggler");
		toggler.setAttribute("aria-expanded", true);
		collapse.style = "height: " + height + "px;";
	} else if(toggler.classList.value == "navbar-toggler") {
		toggler.setAttribute("class", "navbar-toggler collapsed");
		toggler.setAttribute("aria-expanded", false);
		collapse.style = null;
	}

	// var result = toggler.getAttribute("aria-expanded"); // 23
	
	setTimeout(function() {
		collapse.setAttribute("class", "navbar-collapse collapsing");
		// collapse.setAttribute("class", (result === "true") ? "navbar-collapse collapse show" : "navbar-collapse collapse"); // Move
	}, 300);
};