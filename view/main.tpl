<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

    <style>
        .mt {
            margin-top: 1rem;
        }
        .center {
            text-align: center;
            margin: auto;
        }
    </style>

</head>

<body>

    <input class="mt center" type="text" id="name" placeholder="Name"> <br>
    <input class="mt center" type="text" id="email" placeholder="Email"><br>


    <button class="mt center" onclick="send_btn_val(this.value)" value="30">
        Send Button Value
    </button>

    <button class="mt center" onclick="submit_data()">
        SUBMIT
    </button>


    <script>
        function send_btn_val(val) {

            let name = $("#name").val();
            let email = $("#email").val();
            let btn_val = val;
            console.log(name, email, btn_val);
            
            // JSON variable will be pushed into server via ajax
            let info = {
                'name': name,
                'email': email,
                'btn_val': btn_val
            };
            // Sending POST request to the bottle server
            // will send a JSON data
            $.ajax({
                url: "/post",
                contentType: "application/json", // post request data type
                dataType: "text", // Server response type
                type: "POST",
                data: JSON.stringify(info),
                success: function (result) {
                    alert(result);
                }
            });
        }
        function submit_data() {
            let name = $("#name").val();
            let email = $("#email").val();
            console.log(name, email);
            
            // JSON variable will be pushed into server via ajax
            let info = {
                'name': name,
                'email': email
            };
            // Sending POST request to the bottle server
            // will send a JSON data
            $.ajax({
                url: "/post",
                contentType: "application/json", // post request data type
                dataType: "text", // Server response type
                type: "POST",
                data: JSON.stringify(info),
                success: function (result) {
                    alert(result);
                }
            });
        }
    </script>

</body>

</html>
