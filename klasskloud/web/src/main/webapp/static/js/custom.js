// Hide Flash Message with delay of 3 second.
$(document).on("ready pjax:success", function () {
	$(".flash-msg-hide").delay(3000).fadeOut("slow");
});

//back to top button Js
jQuery(document).ready(function() {
	var offset = 150;
	var duration = 500;
	jQuery(window).scroll(function() {
		if (jQuery(this).scrollTop() > offset) {
			jQuery('#slideToTop').fadeIn(duration);
		} else {
			jQuery('#slideToTop').fadeOut(duration);
		}
	});
	
	jQuery('#slideToTop').click(function(event) {
		event.preventDefault();
		jQuery('html, body').animate({scrollTop: 0}, duration);
		return false;
	})
});
