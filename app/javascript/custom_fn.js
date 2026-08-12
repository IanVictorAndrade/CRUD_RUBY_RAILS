
import $ from "jquery"

export function bindCartQuantityButtons() {
  $(document).on("click", ".btn-plus", function(event) {
    event.preventDefault()

    const row = $(this).closest("tr")
    const quantityInput = row.find(".qty")
    const quantity = parseInt(quantityInput.val(), 10) || 1
    const price = parseFloat(row.data("price"))

    quantityInput.val(quantity + 1)
    row.find(".line-price").text((price * (quantity + 1)).toFixed(2))

    window.updateTotalPrice()
  })
}

export function minusCartQuantityButtons() {
    $(document).on("click", ".btn-minus", function(event) {
    event.preventDefault();

    const row = $(this).closest("tr");
    const quantityInput = row.find(".qty");
    const quantity = parseInt(quantityInput.val(), 10) || 1;
    const price = parseFloat(row.data("price"));

    if (quantity > 1) {
      quantityInput.val(quantity - 1);
      row.find(".line-price").text((price * (quantity - 1)).toFixed(2));
    } else {
      row.remove();
    }
    window.updateTotalPrice()
  });
}

export function bindQuantityTextbox() {
  $(document).on("input change", ".qty", function() {
    const quantityInput = $(this)
    const row = quantityInput.closest("tr")
    const price = parseFloat(row.data("price"))
    let quantity = parseInt(quantityInput.val(), 10)

    if (!Number.isInteger(quantity) || quantity < 1) {
      quantity = 1
      quantityInput.val(quantity)
    }

    row.find(".line-price").text((price * quantity).toFixed(2))
    window.updateTotalPrice()
  })
}
