#
# lockscreen
# https://github.com/ducknorris/jquery-lockscreen
#
# Copyright (c) 2014 Catalin Ilinca
# Licensed under the MIT license.
#

# Default HTML Outpout Template
#
# <div class="lock-screen">
#   <div class="current-user">
#     <h2><img alt="__APP__" src="__LOGO__"></h2>
#     <span><img alt="__APP__" height="80" src="__AVATAR__" width="80"></span>
#     <h4>__NAME__</h4>
#     <input autofocus="" class="password-field" placeholder="__PLACEHOLDER__" type="password">
#     <button class="unlock-me">__UNLOCK__</button>
#   </div>
# </div>

(($)->

  lockScreen =
    init: (el, config) ->
      @.el = el
      @.$el = $(el)

      @.config = $.extend {}, $.fn.lockScreen.defaults, config

      @updateHtml()
      return

    updateHtml: ->
      # CSS Class
      @.$el.addClass "lockableScreen"

      # Data Attributes
      @.$el.data 'lockscreen-logout', @.config.logout
      @.$el.data 'lockscreen-unlock', @.config.unlock
      @.$el.data 'lockscreen-bg', @.config.bg

      # HTML Template
      @.$el.prepend @.config.template

      # HTML Template Placeholders
      # App Logo
      @.$logo = $('.lock-screen .current-user h2 img')
      @.$logo.attr 'alt', @.config.app
      @.$logo.attr 'src', @.config.logo
      # Current User
      @.$avatar = $('.lock-screen .current-user span img')
      @.$avatar.attr 'alt', @.config.name
      @.$avatar.attr 'src', @.config.avatar
      @.$current_user = $('.lock-screen .current-user h4')
      @.$current_user.html @.config.name
      # Password field
      @.$password_field = $('.lock-screen .current-user .password-field')
      @.$password_field.attr 'placeholder', @.config.placeholder
      # Unlock button
      @.$unlock_button = $('.lock-screen .current-user .unlock-me')
      @.$unlock_button.html @.config.unlockMe

      return

  $.fn.lockScreen = ->
    obj = Object.create(lockScreen)
    @each ->
      obj.init this
      return

  $.fn.lockScreen.defaults =
    timeout: 60000
    logout: '/logout'
    unlock: '/unlock'
    app: 'jQuery LockScreen'
    logo: 'http://jquery-lockscreen.s3.amazonaws.com/logo.png'
    bg: 'http://jquery-lockscreen.s3.amazonaws.com/lock-screen.jpg'
    name: 'John Doe'
    avatar: 'http://jquery-lockscreen.s3.amazonaws.com/current-user.png'
    placeholder: 'type password'
    unlockMe: "I'm here. Let me in!"
    template: '<div class="lock-screen">
        <div class="current-user">
          <h2><img alt="" src=""></h2>
          <span><img alt="" height="80" src="" width="80"></span>
          <h4></h4>
          <input autofocus="" class="password-field" placeholder="" type="password">
          <button class="unlock-me"></button>
        </div>
      </div>'

)(jQuery)
