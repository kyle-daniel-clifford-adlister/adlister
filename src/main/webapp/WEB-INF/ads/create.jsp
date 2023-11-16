<link rel="stylesheet" href="../../css/createAd.css">

<!-- MERGE START -->
<!-- <!--         <div class="form-group">
<%--            TODO Convert back to values back to names if numbers don't work--%>
            <label>Type:</label><br>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories" value="1"> Rifle
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories" value="2"> Shotgun
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories" value="3"> Pistol
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories" value="4"> Revolver
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories" value="5"> Bolt Action
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories" value="6"> Lever Action
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories" value="7"> Semi-Automatic
            </label>
        </div> -->

<!-- MAIN BELOW -->
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Please Log In" />
        </jsp:include>
        <link rel="icon" type="image/x-icon" href="../../img/gunFavcon.svg">
        <style>
            :root {
                --primary-color: #888;
                --secondary-color: #fff;
            }

            body{
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            }

            .container {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            form {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                width: calc(60% - 10px);
                gap: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 255, 1);
                border-radius: 12px;
                padding: 20px;
                background: linear-gradient(5deg, var(--primary-color), var(--secondary-color));
            }

            h1, input, button {
                text-align: center;
            }

            form-group {
                background-color: #fff;
                padding: 10px;
                margin: 10px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: calc(25% - 20px);

            }

            label {
                width: 75px;
                text-align: right;
            }

            .btn {
                width: 140px;
                height: 50px;
                background-color: rgba(0, 0, 255, 1);
                color: white;
                border-radius: 50px;
                border: none;
                outline: none;
                cursor: pointer;
                position: relative;
                box-shadow: 0 0 10px rgba(0, 0, 255, 1);
                overflow: hidden;
            }

            .btn span {
                font-size: 12px;
                text-transform: uppercase;
                letter-spacing: 1px;
                transition: top 0.5s;
            }

            .btn-text-one {
                position: absolute;
                width: 100%;
                top: 50%;
                left: 0;
                transform: translateY(-50%);
            }

            .btn-text-two {
                position: absolute;
                width: 100%;
                top: 150%;
                left: 0;
                transform: translateY(-50%);
            }

            .btn:hover .btn-text-one {
                top: -100%;
                color: white;
            }

            .btn:hover .btn-text-two {
                top: 50%;
                color: white;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp" />
        <div class="container">
            <h1>Create a new Ad</h1>
            <form action="/ads/create" method="post">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input id="title" name="title" class="form-control" type="text" required>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="form-control" placeholder="Enter description here" required></textarea>
                </div>
                <div class="form-group">
                    <label for="cost">Cost</label>
                    <input id="cost" name="cost" class="form-control" type="number" step="0.01" required>
                </div>

                <div class="form-group">
                    <label>Type:</label><br>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="categories[]" value="1"> Rifle
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="categories[]" value="2"> Shotgun
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="categories[]" value="3"> Pistol
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="categories[]" value="4"> Revolver
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="categories[]" value="5"> Bolt Action
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="categories[]" value="6"> Semi-Automatic
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="categories[]" value="7"> Lever Action
                    </label>
                </div>
<!-- MERGE ENDING -->

                <button class="btn">
                    <span class="btn-text-one">Post</span>
                    <span class="btn-text-two">Click</span>
                </button>
            </form>
        </div>
    </body>
</html>