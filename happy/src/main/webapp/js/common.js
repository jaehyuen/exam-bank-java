function callAjax(method, url, data) {

    var resultDto;

    $.ajax({
        url: url,
        type: method,
        contentType: 'application/json',
        dataType: 'json',
        async: false,
        data: data,
        success: function (result) {
        	resultDto = result;

        },
        error: function (xhr, resp, text) {
            console.log(xhr, resp, text);
        }
    })

    return resultDto;
}

function callPost(url, data) {
    return callAjax("post", url, JSON.stringify(data));
}

function callGet(url, data) {
    return callAjax("get", url, data);
}