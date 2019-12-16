function handleEdit(e) {
  var val = "#" + e + "-value";
  var input = "#" + e + "-input-div";
  var icon = "#" + e + "-edit-icon";
  $(input).toggle();
  $(val).toggle();
  $("#save-profile").prop("disabled", false);
  $(icon).toggleClass("fa-edit");
  $(icon).toggleClass("fa-check");
}
function handleChange(e) {
  var val = "#" + e + "-value";
  var input = "#" + e + "-input";
  $(val).html($(input).val());
}
function handleSave() {
  $("#profile-form").submit();
}
