$(document).ready(function() {
  viewSymptoms();
  viewSymptomForm();
  addSymptom();
  toggleSymptomDetails();

  $("body").on("click", ".edit-delete", function(event){
    event.preventDefault();
    var editLink = $(this);
    var linkURL = $(editLink.find("a")).attr("href");
    $.ajax({
      method: "GET",
      url: linkURL
    })
    .done(function(response){
      console.log(response);
      $("#user-info-viewer").empty();
      $("#user-info-viewer").append(response);
    })
  })

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
      // $(response).hide()
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
    // console.log(response);
    $("#user-info-viewer").empty();
    $("#user-info-viewer").append(response);
  })

  })

}
