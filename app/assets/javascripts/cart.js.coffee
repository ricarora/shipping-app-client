$ ->
  $(".checkout").click (e) ->
    e.preventDefault()
    $(this).fadeOut()
    $(".new-address").slideDown()


# $(function() {
#   $(".choosen").click(function(e) {
#     e.preventDefault();
#     var $form = $(this).parents("form");
#     var $club = $(this).parents(".club");
#     $.ajax($form.attr("action"), {
#       type: "POST",
#       success: function() {
#         $club.addClass("chosen");
#       },
#       error: function() {
#         alert("ERROR!");
#       }
#     });
#   });
# });
