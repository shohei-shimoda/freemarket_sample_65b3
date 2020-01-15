$(function(){
  $('.image-sub').mouseover('change',function(){
    var selectedSrc = $(this).attr('src');
    $('#phototo').html(`<img src="${selectedSrc}" width="300px" height="300px">`)
  });
});