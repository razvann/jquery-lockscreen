# ======== A Handy Little Jasmine Reference ========
# http://pivotal.github.io/jasmine/

# Test methods:
#   describe "name", ()->

describe "jQuery#lockscreen", ->

  beforeEach ->
    @.body = $("body")

  afterEach ->


  it "should be available on the jQuery object", ->
    expect($.fn.lockScreen).toBeDefined()

  it "should be chainable", ->
    expect(@.body.lockScreen()).toEqual @.body

  it "should add .lockableScreen class to body", ->
    expect(@.body.lockScreen().hasClass('lockableScreen')).toBeTruthy()


