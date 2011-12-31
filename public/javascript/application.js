$(document).ready(function(){
    function load_data() {
        $.ajax({
            type: 'GET',
            url: '/stats',
            dataType: 'html',
            success: function(data) {
              $('#stats').html(data);
            }
        });
    }
    setInterval(load_data, 15000);
});
