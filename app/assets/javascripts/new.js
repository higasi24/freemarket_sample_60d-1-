$(document).on('turbolinks:load', function(){
  var imagecontent = $('#img-content');
  var imagecontent2 = $('#img-content2');
  // var dropzone_box = $('.dropzone-box');
  var images = [];
  var inputs  =[];
  var imagefield = $('#img-field');
  var preview = $('#preview');
  var preview2 = $('#preview2');

  $(document).on('change', 'input[type="file"]#img-file', function(event) {
    let file = $(this).prop('files')[0];
    let reader = new FileReader();
    inputs.push($(this));
    let img = $(`<div class= "img_view"><img class="image"></div>`);
    reader.onload = function(e) {
      let btn_wrapper = $('<div class="btn_box"><div class="btn_box__edit" id="edit" >編集</div><div class="btn_box__delete" id="delete" >削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);

    if(images.length >= 5) {
      imagecontent2.css({
        'display': 'block'
      })
      imagecontent.css({
        'display': 'none'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
        imagecontent2.css({
          'width': `calc(100% - (130px * ${images.length - 5}))`
        })
      })
      if(images.length == 9) {
        imagecontent2.find('#guide2').replaceWith('<i class="fa fa-camera" id="camera-icon"></i>')
      }
    } else {
        $('#preview').empty();
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
        })
        imagecontent.css({
          'width': `calc(100% - (130px * ${images.length}))`
        })
      }
      if(images.length == 4) {
        imagecontent.find('#guide').replaceWith('<i class="fa fa-camera" id="camera-icon"></i>')
      }
    if(images.length == 10) {
      imagecontent2.css({
        'display': 'none'
      })
      return;
    }
    var new_image = $(`<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${images.length} type="file" id="img-file">`);
    imagefield.prepend(new_image);
  });
  $(document).on('click', '#delete', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0) {
          $('input[type= "file"]#img-file').attr({
            'data-image': 0
          })
        }
      }
    })
    $('input[type= "file"]#img-file:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"]#img-file:first').after(input)
    })
    if (images.length >= 5) {
      imagecontent2.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
      })
      imagecontent2.css({
        'width': `calc(100% - (130px * ${images.length - 5}))`
      })
      if(images.length == 9) {
        imagecontent2.find('pre').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(images.length == 8) {
        imagecontent2.find('i').replaceWith('<pre>ココをクリックしてください</p>')
      }
    } else {
      imagecontent.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
      imagecontent.css({
        'width': `calc(100% - (130px * ${images.length}))`
      })
    }
    if(images.length == 4) {
      imagecontent2.css({
        'display': 'none'
      })
    }
    if(images.length == 3) {
      imagecontent.find('i').replaceWith('<p>ココをクリックしてください</p>')
    }
  });

  // カテゴリーボックス
  function appendOption(category) {
    let html = `<option value="${ category.id }", data-category="${ category.id }">${ category.name }</option>`;
    return html;
  }

  function appendChildrenSelectBox(insertHTML) {
    let childrenhtml = '';
    childrenhtml = `<div class="send__main__content__form__box3__content__group1__div__select", id="children_box">
                      <select class="send__main__content__form__box3__content__group1__div__select__show", id="child-form", name="item[category_items_attributes][0][category_id]">
                        <option>---</option>
                        ${ insertHTML }
                      </select>
                    </div>`;
    $('#category-form').append(childrenhtml);
  }

  function appendGrandchildrenSelectBox(insertHTML) {
    let grandchildrenhtml = '';
    grandchildrenhtml = `<div class="send__main__content__form__box3__content__group1__div__select", id="grandchildren_box">
                      <select class="send__main__content__form__box3__content__group1__div__select__show", id="grandchild-form", name="item[category_items_attributes][0][category_id]">
                        <option value="---" data-category="---" >---</option>
                        ${ insertHTML }
                      </select>
                    </div>`;
    $('#category-form').append(grandchildrenhtml);
  }
// 親選択時のイベント
  $("#parent-form").on("change",function(){
    let parent = document.getElementById("parent-form").value;
    if (parent != "---") {
      $.ajax({
        url: '/items/get_children',
        type: "GET",
        dataType: 'json',
        data: { parent_id: parent }
      })
      .done(function(children) {
        $('#children_box').remove();
        $('#grandchildren_box').remove();
        // $('#size_box').remove();
        // $('#brand_form').remove();
        let insertHTML = '';
        children.forEach(function(child) {
          insertHTML += appendOption(child)
        });
        appendChildrenSelectBox(insertHTML);
      })
      .fail(function() {
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      $('#children_box').remove();
      $('#grandchildren_box').remove();
      // $('#size_box').remove();
      // $('#brand_form').remove();
    }
  });
// 子選択時のイベント
  $('#category-form').on("change", "#child-form", function() {
    let child = $('#child-form option:selected').data('category');
    if (child != "---"){
      $.ajax({
        url: '/items/get_grandchildren',
        type: 'GET',
        dataType: 'json',
        data: { child_id: child }
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_box').remove();
          // $('#size_box').remove();
          // $('#brand_form').remove();
          let insertHTML = '';
          grandchildren.forEach(function(grandchild) {
            insertHTML += appendOption(grandchild);
          });
        appendGrandchildrenSelectBox(insertHTML);
        }
      })
      .fail(function() {
        alert('カテゴリー取得に失敗しました')
      })
    } else {
      $('#grandchildren_box').remove();
      // $('#size_box').remove();
      // $('#brand_form').remove();
    }
  });
});

