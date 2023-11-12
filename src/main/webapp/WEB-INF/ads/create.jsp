<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" required></textarea>
        </div>
        <div class="form-group">
            <label for="cost">Cost</label>
            <input id="cost" name="cost" class="form-control" type="number" step="0.01" required>
        </div>

        <div class="form-group">
            <label>Type:</label><br>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories[]" value="Rifle"> Rifle
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories[]" value="Shotgun"> Shotgun
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories[]" value="Pistol"> Pistol
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories[]" value="Revolver"> Revolver
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories[]" value="Bolt Action"> Bolt Action
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories[]" value="Lever Action"> Lever Action
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="categories[]" value="Semi-Automatic"> Semi-Automatic
            </label>
        </div>

        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
