/* ===========================================================
# Lockscreen - v0.1.0
# ==============================================================
# Copyright (c) 2014 Catalin Ilinca
# Licensed MIT.
*/
(function($) {
  var lockScreen;
  lockScreen = {
    init: function(el, config) {
      this.el = el;
      this.$el = $(el);
      this.config = $.extend({}, $.fn.lockScreen.defaults, config);
      this.updateHtml();
    },
    updateHtml: function() {
      this.$el.addClass("lockableScreen");
      this.$el.data('lockscreen-logout', this.config.logout);
      this.$el.data('lockscreen-unlock', this.config.unlock);
      this.$el.data('lockscreen-bg', this.config.bg);
      this.$el.prepend(this.config.template);
      this.$logo = $('.lock-screen .current-user h2 img');
      this.$logo.attr('alt', this.config.app);
      this.$logo.attr('src', this.config.logo);
      this.$avatar = $('.lock-screen .current-user span img');
      this.$avatar.attr('alt', this.config.name);
      this.$avatar.attr('src', this.config.avatar);
      this.$current_user = $('.lock-screen .current-user h4');
      this.$current_user.html(this.config.name);
      this.$password_field = $('.lock-screen .current-user .password-field');
      this.$password_field.attr('placeholder', this.config.placeholder);
      this.$unlock_button = $('.lock-screen .current-user .unlock-me');
      this.$unlock_button.html(this.config.unlockMe);
    }
  };
  $.fn.lockScreen = function() {
    var obj;
    obj = Object.create(lockScreen);
    return this.each(function() {
      obj.init(this);
    });
  };
  return $.fn.lockScreen.defaults = {
    timeout: 60000,
    logout: '/logout',
    unlock: '/unlock',
    app: 'jQuery LockScreen',
    logo: 'http://jquery-lockscreen.s3.amazonaws.com/logo.png',
    bg: 'http://jquery-lockscreen.s3.amazonaws.com/lock-screen.jpg',
    name: 'John Doe',
    avatar: 'http://jquery-lockscreen.s3.amazonaws.com/current-user.png',
    placeholder: 'type password',
    unlockMe: "I'm here. Let me in!",
    template: '<div class="lock-screen">\
        <div class="current-user">\
          <h2><img alt="" src=""></h2>\
          <span><img alt="" height="80" src="" width="80"></span>\
          <h4></h4>\
          <input autofocus="" class="password-field" placeholder="" type="password">\
          <button class="unlock-me"></button>\
        </div>\
      </div>'
  };
})(jQuery);
