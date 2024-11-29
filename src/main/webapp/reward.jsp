<jsp:useBean id="rewardId" scope="request" class="java.lang.String"/>
<!--
Author:Jessica Lins
Date:November,2024
This JSP page allows users to add or edit a reward by displaying a form with fields
for reward name and description, and a button that either saves or adds the reward
depending on whether an existing `rewardId` is provided.-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Add Rewards</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin=""></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/rewards.js"></script>
    <script>window.onload = function () {
        const rewardId = ${rewardId.equals("") ? "'new'" : rewardId};
        if (rewardId != 'new') {
            getReward(rewardId);
        }
    }
    </script>
</head>
<body>
<div class="top">
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/rewards">Travel Experts</a>
            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#mynavbar"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="mynavbar">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/rewards">Rewards</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="form-group">
    <label for="reward-id">Reward Id:</label>
    <input type="text" class="form-control" id="reward-id" disabled="disabled"/>
</div>
<div class="form-group">
    <label for="reward-name">Reward Name:</label>
    <input type="text" class="form-control" id="reward-name"/>
</div>
<div class="form-group">
    <label for="reward-description">Reward Description:</label>
    <input type="text" class="form-control" id="reward-description"/>
</div>

<button type="button" class="btn btn-secondary" onclick="saveReward()">${rewardId.equals("") ? "Add" : "Save"}</button>
</body>
</html>
