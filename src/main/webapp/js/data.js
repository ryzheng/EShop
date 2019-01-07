window.onload = function () {

    localTime();

    setInterval(function () {

        localTime();

    }, 1000);

};
function localTime() {
    this.date = new Date();
    this.year = date.getFullYear();
    this.month = date.getMonth() + 1;
    this.day = date.getDate();

    this.hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
    this.minute = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
    this.second = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

    var s = year + '年' + month + '月' + day + '日 ' + hour + ':' + minute + ':' + second;

    $("#localTime").html(s);
}