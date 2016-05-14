require! {
  'react': { createClass, createFactory, createElement, DOM }: React
  'react-router': ReactRouter
  './ResetPassword.styl': css
  'material-ui': MUI
  'material-ui/styles': MUIStyles
}

{ div } = DOM
{ Link } = engino.createFactory ReactRouter
{ RaisedButton, FlatButton, TextField } = engino.createFactory MUI

module.exports = ResetPassword = createClass do
  render: ->
    div {className: css.container},
      TextField do
        label: 'Username or Email'
        fullWidth: true
        floatingLabelText: 'Username or Email'

      RaisedButton do
        label: 'Send Reset Password Email'
        primary: true
        fullWidth: true
        className: css.button

      Link {to: "/login"},
        FlatButton do
          label: 'Return'
          className: css.button