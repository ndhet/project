const sessionID = $('input').val();

function updateStatus() {
    fetch(`https://api-wa.det.my.id/session?sessionID=${sessionID}`)
        .then(response => response.ok ? response.json() : Promise.reject(response))
        .then(data => {
            if (data.message) {
                $('#s').html('<div class="badge bg-success badge-blink text-white">Server Online</div>');
                $('#sesi').html(`<div>${data.message}</div>`);
            } else {
                $('#s').html('<div class="badge bg-success badge-blink text-white">Server Is Online</div>');
                $('#sesi').html('<div>Server Offline</div>');
            }
        })
        .catch(error => {
            console.error(error);
            $('#s').html('<div class="badge bg-danger badge-blink text-white">Server Is Offline</div>');
            $('#sesi').html('<div>Server Offline</div>');
        });
}

function getQRCode() {
    fetch(`https://api-wa.det.my.id/session?sessionID=${sessionID}`)
        .then(response => response.ok ? response.json() : Promise.reject(response))
        .then(data => {
            if (data.message) {
                setInterval(fetchQRCodeImage, 3000);
            } else {
                $('#img').html('<h4>PLEASE SCAN HERE QR CODE</h4>');
                $('#ket').html('<div class="card-body"><img width="200" class="img-fluid" src="https://i.gifer.com/ZKZg.gif"></div>');
            }
        })
        .catch(error => {
            console.error(error);
            $('#img').html('<h4 class="badge bg-danger badge-blink text-white">SERVER OFFLINE</h4>');
            $('#ket').html('<div>Server Offline</div>');
        });
}

async function fetchQRCodeImage() {
    const response = await fetch(`https://api-wa.det.my.id/start-session?session=${sessionID}`);
    const data = await response.json();

    if (data.message === "0") {
        $('#img').html('<h4>Connected Successfully</h4>');
        setTimeout(() => {
            window.location = "index.php";
        }, 2000);
    } else {
        $('#img').html('<h4>PLEASE SCAN HERE QR CODE</h4>');
        $('#ket').html(`<img class="img-fluid mb-5" src="${data.qr}" alt="QR Code">`);
        $('#start').hide();
    }
}

function deleteSession() {
    fetch(`https://api-wa.det.my.id/delete-session?session=${sessionID}`)
        .then(response => response.ok ? response.json() : Promise.reject(response))
        .then(data => {
            $('#img').html(`<h4 class="badge bg-success mb-5 text-white">${data.message}</h4>`);
            $('#start').show();
        })
        .catch(error => {
            console.error(error);
            $('#img').html('<h4 class="badge bg-danger badge-blink">SERVER OFFLINE</h4>');
        });
}

$(document).ready(function() {
    $('#start').click(getQRCode);
    $('#hapus').click(deleteSession);
    updateStatus();
    setInterval(updateStatus, 6000);
});
