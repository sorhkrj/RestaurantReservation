function collapseAction() {
	let toggler = document.getElementById("custom_toggler");
	let collapse = document.getElementById("custom_collapse");
	
	/*
	var item = $('.nav-item').length;
	var height = item*40 + 2;
	*/
	
	collapse.setAttribute("class", "navbar-collapse collapsing");
	
	if (toggler.classList.value == "navbar-toggler collapsed") {
		toggler.setAttribute("class", "navbar-toggler");
		toggler.setAttribute("aria-expanded", true);
		// collapse.style = "height: " + height + "px;";
	} else if(toggler.classList.value == "navbar-toggler") {
		toggler.setAttribute("class", "navbar-toggler collapsed");
		toggler.setAttribute("aria-expanded", false);
		// collapse.style = null;
	}

	var result = toggler.getAttribute("aria-expanded");
	
	if (result === "true") {
		collapse.setAttribute("class", "navbar-collapse collapse show");
	} else if (result === "false") {
		collapse.setAttribute("class", "navbar-collapse collapse");
	}
	collapse.style = null;
};