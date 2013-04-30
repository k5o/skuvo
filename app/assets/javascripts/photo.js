var Photo = {
  init: function() {
  	$('.photoButtons').on('click', 'form.button_to', this.confirmDelete);    
    $('.photoButtons').on('ajax:success', 'form.button_to', this.deletePhoto);
    $('.photoButtons').on('ajax:success', 'form.button_to', this.subtractPhotoCount);
  },

  confirmDelete: function() {
    if (!confirm("Delete this photo?")) return false;
  },

  deletePhoto: function() {
    $(this).parent().parent('.photoView').fadeOut(800);
  },

  subtractPhotoCount: function() {
    newVal = parseInt($('#photosCount').text());
    $('#photosCount').text(newVal - 1);
  }
}

$(document).ready(function() {
  Photo.init();
});