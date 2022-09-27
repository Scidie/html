$(function() {
    window.onload = (e) => {
        window.addEventListener("message", (event) => {
            var item = event.data
            if (item !== undefined && item.type === "ui") {
                if (item.display === true) {
                    $('#container').show();
                    $('#message').text(item.text)
                } else {
                    $('#container').hide();
                    $('#message').text(item.text)
                }
            }
        })
    }
})