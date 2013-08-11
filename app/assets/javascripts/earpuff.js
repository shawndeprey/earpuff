(function($, window, document, navigator, global) {
    var earpuff = earpuff ? earpuff : {
      settings: {
      	init: function(){
      		// Initializing our JS Library Settings
          earpuff.search.init();
      	}
      },
      init: function(){
      	earpuff.settings.init();
      },
      toggleElement: function(element_class){
      	$(element_class).slideToggle(250);
      }
    };
    global.earpuff = earpuff;
})(jQuery, window, document, navigator, this);

jQuery(function($){
	$(document).ready(function(){
		earpuff.init();
	});
});
