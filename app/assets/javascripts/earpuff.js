(function($, window, document, navigator, global) {
    var earpuff = earpuff ? earpuff : {
      settings: {
      	init: function(){
      	}
      },
      init: function(){
      	earpuff.settings.init();
      },
      toggleElement: function(element_class){
      	$(element_class).slideToggle(250);
      },
      hideElement: function(element_class){
        $(element_class).hide();
      },
      showElement: function(element_class){
        $(element_class).show();
      }
    };
    global.earpuff = earpuff;
})(jQuery, window, document, navigator, this);

jQuery(function($){
	$(document).ready(function(){
		earpuff.init();
	});
});
