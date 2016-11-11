$(document).ready(function() {
  viewSymptoms();
  viewSymptomForm();
  addSymptom();
  toggleSymptomDetails();
  showOneSymptom();
  showEditForm();
  submitEditForm();
  deleteEntry();
  goHome();
});

function toggleSymptomDetails(){
  $("body").on("click", ".symptom-name", function(event){
    event.preventDefault();
    var symptomName = $(this)
    var symptomDetails = $("body").find(".symptom-details")
    $(symptomDetails).children().toggle();
  });
}

function viewSymptoms(){
    $("#view-symptoms").on("click", "a", function(event){
    event.preventDefault();
    $.ajax({
      method: "GET",
      url: "/symptoms"
    })
    .done(function(response){
      $("#user-info-viewer").empty();
      $("#user-info-viewer").append(response);
      $($("body").find("ul.symptom-details")).children().hide();
    })
  })
}

function viewSymptomForm(){
    $("#new-symptom").on("click", "a", function(event){
    event.preventDefault();
    $.ajax({
      method: "GET",
      url: "/symptoms/new"
    })
    .done(function(response){
      $("#user-info-viewer").empty();
      $("#user-info-viewer").append(response);
    })
  })
}

function showOneSymptom(){
  $("body").on("click", ".edit-delete", function(event){
    event.preventDefault();
    var editLink = $(this);
    var linkURL = $(editLink.find("a")).attr("href");
    $.ajax({
      method: "GET",
      url: linkURL
    })
    .done(function(response){
      $("#user-info-viewer").empty();
      $("#user-info-viewer").append(response);
    })
  })
}

function showEditForm(){
  $("body").on("click", ".edit-symptom", function(event){
    event.preventDefault();
    var editSymptomLink = $(this);
    var linkURL = $(editSymptomLink).attr("href");
    $.ajax({
      method: "GET",
      url: linkURL
    })
    .done(function(response){
      $("#user-info-viewer").empty();
      $("#user-info-viewer").append(response);
    })
  })
}

function addSymptom(){
  $("#user-info-viewer").on("click", "#submit-symptom", function(event){
    event.preventDefault();
    var button = $(this);
    var form = $(button.parent());
    var data = form.serialize();
    // console.log(data);
  $.ajax({
    url: form.attr("action"),
    method: form.attr("method"),
    data: data
  })
  .done(function(response){
    $("#user-info-viewer").empty();
    $("#user-info-viewer").append(response);
  })
  })
}

function submitEditForm(){
  $("body").on("click", ".submit-edit-button", function(event){
    event.preventDefault();
    var submitEditButton = $(this);
    var form = $(submitEditButton.parent());
    var data = form.serialize();
    $.ajax({
      url: form.attr("action"),
      method: "PUT",
      data: data
    })
    .done(function(response){
    $("#user-info-viewer").empty();
    $("#user-info-viewer").append(response);
    })
  })
}

function deleteEntry(){
  $("body").on("click", ".delete-entry", function(event){
    event.preventDefault();
    var deleteButton = $(this);
    var form = $(deleteButton.parent());
    console.log(form);
    $.ajax({
      url: form.attr("action"),
      method: "DELETE"
    })
    .done(function(response){
    $("#user-info-viewer").empty();
    $("#user-info-viewer").append(response);
    })
  })
}

function goHome(){
  $("body").on("click", ".go-home", function(event){
    event.preventDefault();
    $.ajax({
      method: "GET",
      url: "/symptoms"
    })
    .done(function(response){
      $("#user-info-viewer").empty();
      $("#user-info-viewer").append(response);
      $($("body").find("ul.symptom-details")).children().hide();
    })
  })
}

