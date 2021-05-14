// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("jquery")


function httpGetAsync(url, callback) {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
        callback(xmlHttp.responseText);
    }
    xmlHttp.open("GET", url, true); // true for asynchronous
    xmlHttp.send(null);
}

function processResponse(response){
    console.log(response);
    let qs = parseFloat(JSON.parse(response).quality_score)
    console.log(qs)
    if( qs >= 0.7) {
        $('#subs').attr('disabled', false);
        $('.score_error').hide();
    }
    else {
        $('.score_error').show();
        $('#subs').attr('disabled', true);
    }
}

$(document).ready(function(){
    $('#lead_email').on('change', function(){
        $('.score-error').hide();
        let email = $(this).val();
        let url = "https://emailvalidation.abstractapi.com/v1/?api_key=7b1f15f027244fa8bfb5e5c463f1135b&email="+email
        httpGetAsync(url, processResponse)
    })
});
