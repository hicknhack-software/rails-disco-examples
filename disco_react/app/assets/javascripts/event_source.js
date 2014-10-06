function waitForEvent(href, onProjected, onException) {
    var source = new EventSource(href);
    source.addEventListener('projected', function (e) {
        var data = $.parseJSON(e.data);
        onProjected.call(data);
        source.close();
    });
    source.addEventListener('exception', function (e) {
        var d = $.parseJSON(e.data);
        onException.call( d['error'], d['backtrace'] );
        source.close();
    });
}

function showException(message, backtrace) {
    $('body').prepend(
        $('<div class="alert alert-projection">').append(
            $('<div class="message">').text(error),
            $('<div class="backtrace">').text(backtrace.join('\n'))
        )
    );
}

$(function () {
    var event_source = $('.event-source[data-href]');
    if (event_source.length==1 && typeof(EventSource)!=='undefined') {
        waitForEvent(event_source.data('href'),
            function () {
                window.location.reload();
            },
            showException
        );
    }
});
