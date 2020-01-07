$(function() {

  //イメージの挿入
  // var dropzone = $('.dropzone-area');
  // var images = [];
  // var inputs  =[];
  // var input_area = $('.input_area');
  // var preview = $('#preview');

//価格表示
$('#sell-price').on('keyup', function(){
  var price = $(this).val();
  var mercari_fee = Math.floor(price * 0.1)
  var seller_gain = price - mercari_fee

  if (price >= 300 && price <= 9999999) {
    $('#mercari_fee').text('¥' + mercari_fee.toLocaleString())
    $('#seller_gain').text('¥' + seller_gain.toLocaleString())
  } else {
    $('#mercari_fee').text('--')
    $('#seller_gain').text('--')
  }
})
})