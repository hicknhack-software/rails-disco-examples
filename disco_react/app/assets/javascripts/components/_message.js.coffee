# Pure coffee

@Message = React.createClass
  displayName: 'Message'
  propTypes:
    message: React.PropTypes.object.isRequired # the message to display

  render: ->
    message = @props.message
    {tr,td} = React.DOM
    tr null,
      td className:'bold', message['head']
      td null, message['body']
      td null, message['author']
      td null, message['email']

