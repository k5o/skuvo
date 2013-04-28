// $(document).ready(function(){
// 	$('.drop_zone').hide();
//   // $('.loader').hide();
//   // $('.submit_button').hide();

//   // // // File Upload

//   // var formElement = document.getElementById("form");
//   // var newFormData = new FormData(formElement);
  

//   // $('form').submit(function(e){
//   //   e.preventDefault();
//   //   console.log(window.files);
//   //   console.log(window.files[0]);
//   //   newFormData.append('photo', window.files[0]);
    
//   //   $.ajax({
//   //     type: 'post',
//   //     url: '/',
//   //     data: newFormData,
//   //     processData: false,
//   //     success: function() {
//   //       console.log('success');
//   //     },
//   //     error: function(xhr, status, error) {
//   //       console.log(status);
//   //       console.log(error);
//   //     }
//   //   }).done(function(data){
//   //     $('.loader').show();
//   //     $('.drop_zone').css("opacity", '0.3');
//   //   }).fail(function(){
//   //     console.log("FAIL");
//   //   })
//   // });

// // Drag and Drop
//   function handleFileSelect(e) {
//     e.stopPropagation();
//     e.preventDefault();

//     var files = e.dataTransfer.files; // FileList object.
//     window.files = files;
//     // files is a FileList of File objects. List some properties.
//     var output = [];
//     for (var i = 0, f; f = files[i]; i++) {
      
//       output.push(
//         '<li id="main"><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
//                   f.size, ' bytes',
//                   '</li>'
//                   );
//     }
//     document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';

//     $('.drop_zone').removeClass('over');
//     $('.submit_button').show();
//     console.log(window.files)


//   }

//   function handleDragOver(e) {
//     e.stopPropagation();
//     e.preventDefault();
//     e.dataTransfer.dropEffect = 'copy';
//   }

//   function handleDragEnter(e) {
//     this.classList.add('over');
//   }

//   function handleDragLeave(e) {
//     this.classList.remove('over');
//   }
  
//   function handleDragEnd(e) {
//     $('.drop_zone').removeClass('over');
//   }

//   var dropZone = document.getElementById('drop_zone');
//   dropZone.addEventListener('drop', handleFileSelect, false);
//   dropZone.addEventListener('dragenter', handleDragEnter, false);
//   dropZone.addEventListener('dragover', handleDragOver, false);
//   dropZone.addEventListener('dragleave', handleDragEnd, false);
//   dropZone.addEventListener('dropon', handleDragEnd, false);

// });