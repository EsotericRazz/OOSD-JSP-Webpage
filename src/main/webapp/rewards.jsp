<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rewards</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/rewards.js"></script>
    <script>window.onload = function (){ getRewards(); }</script>
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
<!-- table -->
<div class="table-container">
    <p>${message}</p>
    <table class="table" id="rewards-table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Reward Id</th>
            <th scope="col">Reward Name</th>
            <th scope="col">Reward Description</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Loading...</td>
            <td>Loading...</td>
            <td>Loading...</td>
            <td>Loading...</td>
            <td>Loading...</td>
        </tr>
        </tbody>
    </table>
</div>
<div>
    <a href="${pageContext.request.contextPath}/rewards/new">
        <button type="button" class="btn btn-secondary">Add Reward</button>
    </a>
</div>
</body>
</html>