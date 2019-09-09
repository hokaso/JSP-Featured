/**
 * 
 */
      setInterval(on,1000); //这里是使时间动起来的地方
    function on() {
        var date1 =new Date;
        var  year=date1.getFullYear();
        var  month=date1.getMonth();
        var day=date1.getDate();
        var xinqi=date1.getDay();
        var hh=date1.getHours();
        var mm=date1.getMinutes();
        var ss=date1.getSeconds();
        var time=(month+1)+" "+year;
        var i=0;
        var length = 10000;
        
        for(i=0;i<length;i++){
        	 document.getElementsByClassName("time")[i].innerHTML = time;
             document.getElementsByClassName("day")[i].innerHTML =day;
        }}