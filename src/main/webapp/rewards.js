const API_URL = 'http://localhost:8080/TeamOneREST_war_exploded/api/rewards';
const APP_URL = 'http://localhost:8081/T1TravelExpertsJSP_war_exploded/rewards'

/*
Author:Jessica Lins
Date:November,2024
Manages rewards by allowing users to view, add, edit, and delete them via AJAX requests to a backend API.

1. The `get` function makes a GET request to a specified URL and processes the response with a callback function.
2. `getRewards` function fetches a list of rewards from the backend and displays them in an HTML table, with options to edit or delete each reward.
3. `getReward` function fetches the details of a single reward by its `rewardId` and populates the form fields with that data.
4. `saveReward` function saves a new or edited reward by sending a POST or PUT request with the reward data to the backend API, and redirects to the rewards page upon success.
5. `deleteReward` function deletes a reward by sending a DELETE request to the API and reloads the page upon success.
*/

function get(url, onSuccess) {
    const request = new XMLHttpRequest();
    request.onload = () => {
        onSuccess(JSON.parse(request.responseText));
    };
    request.open('GET', url);
    request.send()
}

//{id: 2, rwdName: 'AeroPlan', rwdDesc: 'test'}
function getRewards() {
    get(API_URL, (rewards) => {
        const tableBody = document.querySelector('#rewards-table tbody');
        tableBody.innerHTML = rewards.map(reward => `<tr>
            <td>${reward.id}</td>
            <td>${reward.rwdName}</td>
            <td>${reward.rwdDesc ?? ''}</td>
            <td>
                <a href="${APP_URL + '/' + reward.id}">
                    <button type="button" class="btn btn-secondary">Edit</button>
                </a>
            </td>
            <td>
                <button type="button" class="btn btn-secondary" onclick="deleteReward(${reward.id})">Delete</button>
            </td>
        </tr>`).join('');
    });
}

function getReward(rewardId){
    get(API_URL + `/get/${rewardId}`, (reward) => {
        document.getElementById("reward-id").value = reward.id;
        document.getElementById("reward-name").value = reward.rwdName;
        document.getElementById("reward-description").value = reward.rwdDesc ?? '';
    });
}

let isSaving = false;
function saveReward(){
    if(isSaving){
        return;
    }
    isSaving = true;
    const rewardId = document.getElementById("reward-id").value;
    const name = document.getElementById("reward-name").value;
    if(name === ''){
        alert('Name can not be empty!')
        return;
    }
    const description = document.getElementById("reward-description").value;
    const reward = {rwdName: name, rwdDesc: description};
    if(rewardId !== ''){
        reward.id = parseInt(rewardId);
    }

    const request = new XMLHttpRequest();
    request.onload = () => {
        window.location.replace(APP_URL);
    };

    if(reward.id != null){
        request.open('PUT', API_URL + '/put');
    }else{
        request.open('POST', API_URL + '/post');
    }

    request.setRequestHeader('Content-Type', 'application/json');
    request.setRequestHeader('Accept', 'application/json');

    request.send(JSON.stringify(reward));
}

function deleteReward(rewardId){
    const request = new XMLHttpRequest();
    request.onload = () => {
        window.location.reload();
    };
    request.open('DELETE', API_URL + `/delete/${rewardId}`);
    request.send()
}