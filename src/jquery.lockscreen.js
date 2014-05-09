/*
 * lockscreen
 * https://github.com/ducknorris/jquery-lockscreen
 *
 * Copyright (c) 2014 Catalin Ilinca
 * Licensed under the MIT license.
 */

(function($) {

  // Collection method.
  $.fn.lockscreen = function() {
    return this.each(function(i) {
      // Do something awesome to each selected element.
      $(this).html('awesome' + i);
    });
  };

  // Static method.
  $.lockscreen = function(options) {
    // Override default options with passed-in options.
    options = $.extend({}, $.lockscreen.options, options);
    // Return something awesome.
    return 'awesome' + options.punctuation;
  };

  // Static method default options.
  $.lockscreen.options = {
    punctuation: '.'
  };

  // Custom selector.
  $.expr[':'].lockscreen = function(elem) {
    // Is this element awesome?
    return $(elem).text().indexOf('awesome') !== -1;
  };

}(jQuery));
