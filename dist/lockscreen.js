/* ===========================================================
# Lockscreen - v0.1.0
# ==============================================================
# Copyright (c) 2014 Catalin Ilinca
# Licensed MIT.
*/
(function($) {
  var lockScreen;
  lockScreen = {
    init: function(el) {
      this.el = el;
      this.$el = $(el);
      this.updateHtml();
    },
    updateHtml: function() {
      this.$el.addClass("lockableScreen");
    }
  };
  return $.fn.lockScreen = function() {
    var obj;
    obj = Object.create(lockScreen);
    return this.each(function() {
      obj.init(this);
    });
  };
})(jQuery);
