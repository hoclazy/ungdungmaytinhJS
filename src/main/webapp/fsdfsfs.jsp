<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<style>
    table {
        border: 1px solid black;
        border-radius: 8px;
        text-align: center;
    }
    button {
        width: 30px;
        height: 30px;
        color: blue;
    }
    td ,tr {
        color: blue;
        border-spacing: 15px;
    }
</style>
<body>
<table>
    <tr>
        <th colspan="4" ><input type="text" id="src" style="color: blue"></th>
    </tr>
    <tr>
        <td><button onclick="nhap('1')">1</button></td>
        <td><button onclick="nhap('2')">2</button></td>
        <td><button onclick="nhap('3')">3</button></td>
        <td><button onclick="nhap('+')">+</button></td>
    </tr>
    <tr>
        <td><button onclick="nhap('4')">4</button></td>
        <td><button onclick="nhap('5')">5</button></td>
        <td><button onclick="nhap('6')">6</button></td>
        <td><button onclick="nhap('-')">-</button></td>
    </tr>
    <tr>
        <td><button onclick="nhap('7')">7</button></td>
        <td><button onclick="nhap('8')">8</button></td>
        <td><button onclick="nhap('9')">9</button></td>
        <td><button onclick="nhap('*')">*</button></td>
    </tr>
    <tr>
        <td><button onclick="xoa()">C</button></td>
        <td><button onclick="nhap('0')">0</button></td>
        <td><button onclick="cal()">=</button></td>
        <td><button onclick="nhap('/')">/</button></td>
    </tr>
</table>
<script>
    let src = document.getElementById('src');

    // hiển thị lên màn hình
    function nhap(kt){
        src.value = src.value + kt;
    }

    // tính toán
    function cal(){
        src.value = eval(src.value);
    }
    function xoa(){
        src.value = '';
    }
</script>
</body>
</html>