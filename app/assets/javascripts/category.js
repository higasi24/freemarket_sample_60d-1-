$(function(){
  $('.header__box__lower__list-categories__category__link')
  .mouseover(function(category){

    html = `
          <div class = "categoryList">${category.name}</div>
           `
    $(this).append(html);
    console.log(html)
  })
  // onが必要かも
  // .mouseout(function(){
  //   $(this).removeClass("categoryList");
  //   $("categoryList").remove()
  // })
})