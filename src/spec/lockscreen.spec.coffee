# ======== A Handy Little Jasmine Reference ========
# http://pivotal.github.io/jasmine/

# Test methods:
#   describe "name", ()->

describe "jQuery#lockscreen", ->

  beforeEach ->
    @.body = $("body")

  afterEach ->
    # no cleanup needed

  it "should be available on the jQuery object", ->
    expect($.fn.lockScreen).toBeDefined()

  it "should be chainable", ->
    expect(@.body.lockScreen()).toEqual @.body

  it "should add .lockableScreen class to body", ->
    expect(@.body.lockScreen().hasClass('lockableScreen')).toBeTruthy()

  it "has defaults configured", ->
    expect($.fn.lockScreen.defaults).toBeDefined()

  it "should have Logout path in place", ->
    expect(@.body.lockScreen().data('lockscreen-logout')).toEqual '/logout'

  it "should have unlock path in place", ->
    expect(@.body.lockScreen().data('lockscreen-unlock')).toEqual '/unlock'

  it "should have Bg image in place", ->
    expect(@.body.lockScreen().data('lockscreen-bg')).toEqual 'http://jquery-lockscreen.s3.amazonaws.com/lock-screen.jpg'

  it "should have HTML template Logo in place", ->
    expect(@.body.lockScreen().find('.lock-screen .current-user h2 img').attr('alt')).toEqual 'jQuery LockScreen'
    expect(@.body.lockScreen().find('.lock-screen .current-user h2 img').attr('src')).toEqual 'http://jquery-lockscreen.s3.amazonaws.com/logo.png'

  it "should have HTML template Current User in place", ->
    expect(@.body.lockScreen().find('.lock-screen .current-user span img').attr('alt')).toEqual 'John Doe'
    expect(@.body.lockScreen().find('.lock-screen .current-user span img').attr('src')).toEqual 'http://jquery-lockscreen.s3.amazonaws.com/current-user.png'
    expect(@.body.lockScreen().find('.lock-screen .current-user h4').html()).toEqual 'John Doe'

  it "should have HTML template Password in place", ->
    expect(@.body.lockScreen().find('.lock-screen .current-user .password-field').attr('placeholder')).toEqual 'type password'

  it "should have HTML template Unlock button in place", ->
    expect(@.body.lockScreen().find('.lock-screen .current-user .unlock-me').html()).toEqual "I'm here. Let me in!"

  # it "should insert lock-screen-wrapper", ->
  #   expect(@.body.lockScreen().find('.lock-screen').html()).toEqual '
  #     <div class="current-user">
  #       <h2><img alt="jQuery LockScreen" src="/assets/admin/logo.png"></h2>
  #       <img alt="John Doe" height="80" src="http://gravatar.com/avatar/bf9a49c89790c65e6685c00a6bd00882.jpg" width="80">
  #       <h4>
  #         Catalin Ilinca
  #         <span class="fa fa-question-circle darkGrey info" data-rel="tooltip" title="" data-original-title="Enter your password and hit ENTER."></span>
  #       </h4>
  #       <input autofocus="" class="input-large col-xs 12 password-field error" placeholder="type password" type="password" style="">
  #       <div class="clearfix"></div>
  #       <button class="btn btn-primary col-xs-12 unlock-me">I\'m here. Let me in!</button>
  #     </div>'

