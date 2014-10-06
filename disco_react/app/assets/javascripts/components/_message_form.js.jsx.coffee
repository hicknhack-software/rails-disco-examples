###* @jsx React.DOM ###

@MessageForm = React.createClass
  propTypes:
    form: React.PropTypes.shape(
      action: React.PropTypes.string.isRequired # url where the form is processed
      csrf_param: React.PropTypes.string.isRequired # parameter name
      csrf_token: React.PropTypes.string.isRequired # protection token value
    ).isRequired # the form properties

  handleSubmit: (ev) ->
    ev.preventDefault()

    return false unless @validate()
    @submit()
    @resetForm()
    false

  resetForm: ->
    @refs['head'].getDOMNode().value = ''
    @refs['body'].getDOMNode().value = ''
    @refs['author'].getDOMNode().value = ''
    @refs['email'].getDOMNode().value = ''
    return

  submit: ->
    formData = $( @refs['form'].getDOMNode() ).serialize()
    @props.onMessageSubmit formData, @props.form.action
    return

  validate: ->
    head = @refs['head'].getDOMNode().value.trim()
    body = @refs['body'].getDOMNode().value.trim()
    author = @refs['author'].getDOMNode().value.trim()
    email = @refs['email'].getDOMNode().value.trim()
    head && body && author && email

  render: ->
    form = @props.form
    `<form ref="form" className="forum-form" action={ form.action } accept-charset="UTF-8" method="post" onSubmit={ this.handleSubmit }>
      <input type="hidden" name={ form.csrf_param } value={ form.csrf_token } />
      <p><input ref="head" name="message[head]" placeholder="Headline" /></p>
      <p><textarea ref="body" name="message[body]" placeholder="Say something..." /></p>
      <p><input ref="author" name="message[author]" placeholder="Your name" /></p>
      <p><input ref="email" name="message[email]" placeholder="Your email" /></p>
      <p><button type="submit">Post message</button></p>
    </form>`
