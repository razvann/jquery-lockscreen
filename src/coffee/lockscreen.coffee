#
# lockscreen
# https://github.com/ducknorris/jquery-lockscreen
#
# Copyright (c) 2014 Catalin Ilinca
# Licensed under the MIT license.
#

(($)->

  lockScreen =
    init: (el) ->
      @el = el
      @$el = $(el)
      @updateHtml()
      return

    updateHtml: ->
      @$el.addClass "lockableScreen"
      return

  $.fn.lockScreen = ->
    obj = Object.create(lockScreen)
    @each ->
      obj.init this
      return

)(jQuery)
