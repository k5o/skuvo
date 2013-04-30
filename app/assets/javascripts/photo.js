var Photo = {
  init: function() {
  	$('.photoButtons').on('click', '#delete', this.confirmDelete);    
  	$('.asdf').click(console.log("oogabooga"));
    $('.photoButtons').on('ajax:success', '#delete', this.deletePhoto);
    $('.photoButtons').on('ajax:success', '#delete', this.subtractPhotoCount);
  },

  confirmDelete: function() {
  	console.log("sanitycheck")
    if (!confirm("Delete this photo?")) return false;
  },

  deletePhoto: function() {
  	console.log("brownies");
  	debugger
    $(this).parent().parent().parent().parent('.photoView').hide(800);
  },

  subtractPhotoCount: function() {
    newVal = parseInt($('#photosCount').text());
    $('#photosCount').text(newVal - 1);
  }
}

$(document).ready(function() {
  Photo.init();
});