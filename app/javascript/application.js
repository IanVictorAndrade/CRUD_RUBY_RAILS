import "trix"
import "@rails/actiontext"
import "controllers"
import $ from "jquery"
import { bindCartQuantityButtons, bindQuantityTextbox, minusCartQuantityButtons } from "custom_fn"

window.$ = window.jQuery = $
window.updateTotalPrice = function() {
  let totalPrice = 0

  $(".cart-table tr").each(function() {
    totalPrice += parseFloat($(this).find(".line-price").text().trim()) || 0
  })

  $(".total_count").text(totalPrice.toFixed(2))
}

bindCartQuantityButtons()
minusCartQuantityButtons()
bindQuantityTextbox()

$(document).on("change", ".category-dropdown", function() {
  $.ajax({
    url: "/shoppingcart/product_list",
    method: "GET",
    dataType: "script",
    data: {
      category: $(this).val()
    },
    error: function(xhr) {
      console.error(xhr.responseText)
    }
  })
})

$(document).on("click", ".add-cart", function(event) {
  event.preventDefault()

  $.ajax({
    url: $(this).attr("href"),
    method: "GET",
    dataType: "script",
    error: function(xhr) {
      console.error(xhr.responseText)
    }
  })
})
