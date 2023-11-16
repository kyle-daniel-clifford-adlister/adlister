<link rel="stylesheet" href="../../css/createAd.css">
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Please Log In" />
        </jsp:include>
        <link rel="icon" type="image/x-icon" href="../../img/gunFavcon.svg">
        <link rel="stylesheet" href="../../css/"
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

                <button class="btn">
                    <span class="btn-text-one">Post</span>
                    <span class="btn-text-two">Click</span>
                </button>
            </form>
        </div>
    </body>
</html>