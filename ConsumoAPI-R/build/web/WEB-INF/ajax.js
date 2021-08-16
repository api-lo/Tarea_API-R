
function processData()
{
    var uri = "http://127.0.0.1:8658/histograma?x1";
    var url= uri+ document.getElementById('param1') + "&y1=" + document.getElementById('param2');
      document.getElementById('imgHistograma').src="http://127.0.0.1:8658/histograma?x1=wage&y1=married";
    
   
    $.ajax({
        method: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8", 
        crossDomain: true,
        success: function (data) {
            console.log(data);
        },
        error: function (data) {
            console.log(data.status);
        }
    });
}
