$(document).ready(function () {
  var active_now = $('.active').find('a').attr('href');
  $(active_now).parent().css({"display":"inline-block"});
  $('.tabs li').click(function(e){
  	var tab = $(this).find('a').attr("href");
  	var newActiveLi = $(this)
		e.preventDefault();
		$('.tab').css({"display":"none"});
  	$('li.active').removeClass();
	  $(newActiveLi).addClass("active")
		$(tab).parent().css({"display":"inline-block"});
	});
});


// Animated tabbing causes graphical unpleasantry when tab fades out
// due to y-scrollbar disappearing/reappearing
// $(document).ready(function () {
//   var active_now = $('.active').find('a').attr('href');
//   $(active_now).parent().css({"display":"inline-block"});
//   $('.tabs li').click(function(e){
//   	var tab = $(this).find('a').attr("href");
//   	var newActiveLi = $(this)
// 		e.preventDefault();
// 		$('.tab').animate ({
// 			opacity: 0.1,
// 		}, 100, function () {
// 			$('.tab').css({"display":"none"});
// 	  	$('li.active').removeClass();
//   	  $(newActiveLi).addClass("active")
//     	$(tab).parent().animate ({
//     		opacity: 1
//     	}, 100, function() {
//     		$(tab).parent().css({"display":"inline-block"});
//     	});
//   	});
//   })
// });
