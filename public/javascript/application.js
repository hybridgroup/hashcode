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
    setTimeout(load_data, 10000);
});
