$(function () {
  $(document).on('keyup', '#selling-price', function () {
    let input = $(this).val();
    if (input < 300 | input > 9999999) {
      $("#sales-commission").text("-");
      $("#sales-profit").text("-");
    }
    else {
      let charge = parseInt(input * 0.1);
      $("#sales-commission").text("¥" + charge.toLocaleString());
      let profit = input - charge;
      $("#sales-profit").text("¥" + profit.toLocaleString());
    }
  });
});