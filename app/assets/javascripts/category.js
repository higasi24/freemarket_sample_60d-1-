$(document).on('turbolinks:load',(function(){

  function appendCategories(categories){
    $('#categoryBox__box').empty();
    let num = 0;
    categories.forEach(function(category){
      var html = `<a href="/categories/${category.id}" class="categoryList", data-child="${num}">${category.category}</a>`
      $('#categoryBox__box').append(html);
      num++;
    });
    var listhtml = `<a href="/categories" class="categoryList">カテゴリー一覧</a>`
    $('#categoryBox__box').append(listhtml);

    $(".categoryList").on("mouseover",function(e){
      e.preventDefault();
      let datachild = $(this).data('child');
      $("#categoryBox__childbox").empty();
      categories[datachild].children.forEach(function(childCategory){
        var childhtml = `<a href="/categories/${childCategory.id}" class="childcategoryList", data-parent="${childCategory.ancestry}", data-grandchild="${childCategory.id}">${childCategory.category}</a>`
        $('#categoryBox__childbox').append(childhtml);
      });
      $(".childcategoryList").on("mouseover",function(e){
        let dataparent = $(this).data('parent');
        let datagrand = $(this).data('grandchild');
        e.preventDefault();
        $.ajax({
          type: "GET",
          url: "/items/getAllCategory",
          // data: "",
          dataType: "json"
        })
        .done(function(categories){
          $("#categoryBox__grandchildbox").empty();
          let grandchildren = categories.filter(function(category){
            return category.ancestry == dataparent + "/" + datagrand;
          });
          grandchildren.forEach(function(grandchildCategory){
            var childhtml = `<a href="/categories/${grandchildCategory.id}" class="grandchildcategoryList">${grandchildCategory.category}</a>`
            $('#categoryBox__grandchildbox').append(childhtml);
          });
        })
        .fail(function(){
          alert("通信エラー...");
        });
      });
    });

    // $("#categoryBox").on("mouseout",function(){
    //   $("#categoryBox").empty();
    // });
  };
  function scroller(id){
    var target = $("[data-name=" + id + "]");
    var position = target.offset().top
    $("*").animate({
      scrollTop: position
    }, 300, 'swing');
  };

  $('.header__box__lower__list-categories__category').on("mouseover",function(e){
    e.preventDefault();
    $.ajax({
      type: 'GET',
      url:   '/items/getCategory',
      // data:  '',
      dataType: 'json' 
    })
    .done(function(categories){
      appendCategories(categories);
    })
    .fail(function(){
      alert("通信エラー");
    });
  });

  $(".category__top__contents__box__rank").click(function(){
    var id = $(this).data('id');
    scroller(id);
  });
  $(".categories__box__root__category").click(function(){
    var id = $(this).data('id');
    scroller(id);
  });

}));