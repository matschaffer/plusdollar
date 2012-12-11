// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
  function stripeResponseHandler(status, response) {
    if (response.error) {
        $(".payment-errors").show().find('.alert').text(response.error.message);
        $(".submit-button").removeAttr("disabled");
    } else {
        var $form = $("#payment-form");
        var token = response['id'];
        $form.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");
        $form.get(0).submit();
    }
  }

  $("#payment-form").submit(function (e) {
    e.preventDefault();

    $('.submit-button').attr("disabled", "disabled");

    Stripe.createToken({
      number: $('#card_number').val(),
      exp_month: $('#card-expiry-month').val(),
      exp_year: $('#card-expiry-year').val(),
      cvc: $('#card_code').val()
    }, stripeResponseHandler);
  });
});
