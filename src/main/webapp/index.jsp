<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test</title>
    <link rel="shortcut icon" href="assets/favicon.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>

<body>

<style>
    .wrapper {
        width: 350px;
        margin: 0px auto;
        border: #ccc 1px solid;
        padding: 5px;
        border-radius: 8px;
        margin-top: 25px;
    }

    .calc-button {
        width: calc((100% - 15px) / 4);
        height: 50px;
        margin-right: 5px;
        margin-bottom: 5px;
    }

    .button-last {
        margin-right: 0px !important;
    }

    #view-value {
        float: left;
        width: 100%;
        height: 100px;
        position: relative;
    }

    #view-value span {
        text-align: right;
        font-weight: bold;
        font-size: 25px;
        position: absolute;
        right: 0;
        bottom: 0;

    }

    #view-wrapper {
        float: left;
        width: 100%;
        height: 100px;
        position: relative;
    }

    #view-wrapper span {
        position: absolute;
        text-align: right;
        top: 50%;
        right: 0;
        color: grey;
        background-color: white;
        font-size: 20px;
    }
</style>

<div class="wrapper">
    <div id="view-wrapper"></div>
    <div id="view-value"></div>
    <div id="button-content"></div>
</div>

<script>
    var strNumber1 = "";
    var strNumber2 = "";
    var strMath = "";
    let result=0;

    function viewButton() {
        var buttons = ["%", "CE", "C", "DEL", "1/x", "x^2", "&radic", "/", "7", "8", "9", "x", "4", "5", "6", "-", "1", "2", "3", "+", "+/-", "0", ".", "="];

        var strButton = "";

        var i = 1;

        buttons.forEach(obj => {
            strButton += "<button type=\"button\" onclick=\"btnClick('" + obj + "')\" class=\"calc-button btn btn-default";
            if (i < 4) {
                i++;
            }
            else if (i == 4) {
                strButton += " button-last";
                i = 1;
            }
            strButton += "\">" + obj + "</button>";
        });
        document.getElementById("button-content").innerHTML = strButton;

    }
    function btnClick(buttonValue) {
        if (isNaN(buttonValue)) {

            if (buttonValue === "C") {
                    document.getElementById("view-value").innerHTML = "";
                    document.getElementById("view-wrapper").innerHTML = "";
                     strNumber1 = "";
                     strNumber2= "";
                     strMath = "";
                     result = 0;

            } else if (buttonValue === "DEL") {
                if (strMath) {
                    strNumber2 = strNumber2.substring(0, strNumber2.length-1);
                    document.getElementById("view-value").innerHTML = "<span>" + strNumber2 + "</span>";
                }else {
                    strNumber1 = strNumber1.substring(0,strNumber1.length-1);
                    document.getElementById("view-value").innerHTML = "<span>" + strNumber1 + "</span>";
                }
            }else if (buttonValue === "CE"){
                if (strMath) {
                    strNumber2 = "";
                    document.getElementById("view-wrapper").innerHTML = "<span>" + strNumber1+ strMath +" " + "</span>";
                    document.getElementById("view-value").innerHTML = "<span>" + " " + "</span>";
                }else {
                    strNumber1 ="";
                    document.getElementById("view-value").innerHTML = "<span>" + " " + "</span>";
                }
            }else if (buttonValue === "1/x"){
                if (!strMath){
                    result= 1/strNumber1;
                    document.getElementById("view-wrapper").innerHTML = "<span>" + "1/ "+strNumber1 + "</span>";
                    document.getElementById("view-value").innerHTML = "<span>" + result + "</span>";
                    strNumber1 = ""+result;
                }else {
                    strNumber2 = 1/strNumber2;
                    document.getElementById("view-wrapper").innerHTML = "<span>" + "1/ "+strNumber2 + "</span>";
                    document.getElementById("view-value").innerHTML = "<span>" + result + "</span>";
                }

            }else if (buttonValue === "x^2"){
                if (!strMath){
                    result = strNumber1 * strNumber1;
                    document.getElementById("view-value").innerHTML = "<span>" + result + "</span>";
                    document.getElementById("view-wrapper").innerHTML = "<span>" + strNumber1 + " ^2" + "</span>";
                    strNumber1 = ""+result;
                }else {
                    strNumber2 = strNumber2 * strNumber2;
                    document.getElementById("view-wrapper").innerHTML = "<span>" +strNumber2 + "^2" + "</span>";
                    document.getElementById("view-value").innerHTML = "<span>" + result + "</span>";
                }

            }else if (buttonValue === "&radic"){
                if (strMath!=""){
                    strNumber2 = Math.sqrt(strNumber2);
                    document.getElementById("view-value").innerHTML = "<span>" + result + "</span>";
                }else {
                    result =Math.sqrt(strNumber1);
                    document.getElementById("view-value").innerHTML = "<span>" + result + "</span>";
                    strNumber1 = result;
                }

            }else if (buttonValue ===".") {
                if (strMath) {
                    strNumber2 += buttonValue;
                    document.getElementById("view-wrapper").innerHTML = "<span>" + strNumber1 + strMath + strNumber2  + "</span>";
                    document.getElementById("view-value").innerHTML = "<span>" + result + "</span>";
                }else {
                    strNumber1 += buttonValue;
                    document.getElementById("view-value").innerHTML = "<span>" + strNumber1 + "</span>";
                }
            }else if (buttonValue ==="+/-") {
                if (strNumber1>=0) {
                    strNumber1 = -Math.abs(strNumber1);
                    document.getElementById("view-value").innerHTML = "<span>" + strNumber1 + "</span>";
                }else {
                    strNumber1 = Math.abs(strNumber1);
                    document.getElementById("view-value").innerHTML = "<span>" + strNumber1 + "</span>";
                }

            }else if (buttonValue === "%") {
                if (strMath) {
                    strNumber2 = strNumber2/100;
                    document.getElementById("view-value").innerHTML = "<span>" + result + "</span>";
                    document.getElementById("view-wrapper").innerHTML = "<span>" + strNumber1 + strMath + strNumber2  + "</span>";
                }else {
                    result =  strNumber1/100;
                    document.getElementById("view-value").innerHTML = "<span>" + result + "</span>";
                    strNumber1 = ""+result;

                }
            }else {
                if (strMath != "") {
                    result = value();
                    document.getElementById("view-wrapper").innerHTML = "<span>" + strNumber1  + strMath + strNumber2 + "</span>";
                    strMath = buttonValue;
                    if (result!=undefined) {
                        document.getElementById("view-value").innerHTML = "<span>" + result + "</span>";
                        strNumber1 = result;
                        strNumber2 = "";
                    }else {
                        strMath = buttonValue;
                        document.getElementById("view-wrapper").innerHTML = "<span>" + strNumber1 + strMath + strNumber2 + "</span>";
                    }


                } else {
                    strMath = buttonValue;
                }
                document.getElementById("view-wrapper").innerHTML = "<span>" + strNumber1 + " " + strMath + " " + strNumber2 + "</span>";
            }
        } else {
            if (strMath != "") {
                strNumber2 += buttonValue;
                document.getElementById("view-value").innerHTML = "<span>" + strNumber2 + "</span>";
            } else {
                strNumber1 += buttonValue;
                document.getElementById("view-value").innerHTML = "<span>" + strNumber1 + "</span>";
            }


        }
    }
    function value() {
        var number1 = parseFloat(strNumber1);
        var number2 = parseFloat(strNumber2);

        switch (strMath) {
            case 'x':
                return  number1 * number2;
            case '+':
                return number1 + number2;
            case '/':
                return number1 / number2;
            case '-':
                return number1 - number2;

            default:
                return;
        }

    }
    viewButton();
</script>

</body>

</html>