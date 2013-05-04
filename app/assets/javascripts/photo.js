var Photo = {
  init: function() {
  	$('.deleteButton').on('click', 'a', this.confirmDelete);
    $('.deleteButton').on('ajax:success', 'a', this.deletePhoto);
    $('.deleteButton').on('ajax:success', 'a', this.subtractPhotoCount);
  },

  confirmDelete: function() {
    if (!confirm("Delete this photo?")) return false;
  },

  deletePhoto: function() {
    $(this).parent().parent().parent('.photoView').fadeOut(800);
  },

  subtractPhotoCount: function() {
    newVal = parseInt($('#photosCount').text());
    $('#photosCount').text(newVal - 1);
  }
}

$(document).ready(function() {
  Photo.init();
});