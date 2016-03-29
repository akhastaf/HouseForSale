$(document).ready(function (){
  $('.inputfile').each(function (){
    var $input = $(this);
    var $label = $input.prev('label');
    var $labelVal = $label.html();
    var $value = $label.html();
    $label.html(' ');
    $label.append('<span>'+ $value +'</span>');

    $input.on('change', function (e){
      var $fileName = '';
      if(this.files && this.files.length > 1)
        $fileName = (this.getAttribute('data-multipale-caption') || '').replace('{count}', this.files.length);
      else if(e.target.value)
        $fileName = e.target.value.split('\\').pop();

      if($fileName)
        $label.find('span').html($fileName);
      else
        $label.html($labelVal);
    });
    $input
    .on('focus', function(){ $input.addClass('has-focus'); })
    .on('blur', function(){ $input.removeClass('has-focus'); });
  });
});
