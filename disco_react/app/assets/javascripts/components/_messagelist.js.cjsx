# @cjsx React.DOM

@MessageList = React.createClass
  displayName: 'MessageList'
  propTypes:
    messages: React.PropTypes.array.isRequired # messages to display
    create_path: React.PropTypes.string.isRequired # path to create a message
    csrf_param: React.PropTypes.string.isRequired # parameter name
    csrf_token: React.PropTypes.string.isRequired # protection token value

  getInitialState: ->
    messages: @props['messages']
    message_form:
      action: @props['create_path']
      csrf_param: @props['csrf_param']
      csrf_token: @props['csrf_token']

  refresh: ->
    $.ajax
      url: @props['create_path'],
      dataType: "json",
      success: (data) =>
        @setState messages: data['messages']
    return

  handleMessageCommit: (json, action) ->
    $.ajax
      data: json,
      url: action,
      type: "POST",
      dataType: "json",
      success: (data) =>
        @setState
          messages: @state.messages.concat data['message']
        waitForEvent data['event_url'], (() => @refresh()), showException
    return

  render: ->
    messages = @state.messages.map (message) ->
      <Message key={ message['id'] } message={ message } />
    <div>
      <h1>Message List</h1>
      <table>
        <thead>
          <tr>
            <th>Head</th>
            <th>Body</th>
            <th>Author</th>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          { messages }
        </tbody>
      </table>
      <MessageForm form={ @state.message_form } onMessageSubmit={ @handleMessageCommit } />
    </div>
