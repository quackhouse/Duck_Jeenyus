$(function(){
  $('.lyric a').mouseover(function(){
    $(this).parent().siblings('.lyric-tool-tip').css('display', 'block');
  });
    $('.lyric a').mouseout(function(){
    $(this).parent().siblings('.lyric-tool-tip').css('display', 'none');
  });
});