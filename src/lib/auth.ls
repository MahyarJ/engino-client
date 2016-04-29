wn = require 'when'
Cookies = require 'js-cookie'

class Auth
  ->
    @user = null

  login: (email, pass) ->
    wn.promise (resolve, reject) ~>
      engino.request("auth/login", {email, pass})
      .then (result) ~>
        if result.success
          Cookies.set "token", result.token
          @user = result.user
        resolve @user

  getUser: ->
    wn.promise (resolve, reject) ~>
      if @user?
        resolve @user
      else
        engino.request("auth/getUserByToken")
        .then (result) ~>
          if result.success
            @user = result.user
          else
            Cookies.delete(\token)
          resolve @user

module.exports = engino.auth = new Auth()