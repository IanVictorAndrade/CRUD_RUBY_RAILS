import "trix"
import "@rails/actiontext"
import "@hotwired/turbo-rails"
import "controllers"
import {bindCartQuantityButtons, bindQuantityTextbox, minusCartQuantityButtons} from "custom_fn"

const $ = window.jQuery
window.$ = $
window.updateTotalPrice = function () {
    let totalPrice = 0

    $(".cart-table tr").each(function () {
        totalPrice += parseFloat($(this).find(".line-price").text().trim()) || 0
    })

    $(".total_count").text(totalPrice.toFixed(2))
}

bindCartQuantityButtons()
minusCartQuantityButtons()
bindQuantityTextbox()

$(document).on("change", ".category-dropdown", function () {
    $.ajax({
        url: "/shoppingcart/product_list",
        method: "GET",
        dataType: "script",
        data: {
            category: $(this).val()
        },
        error: function (xhr) {
            console.error(xhr.responseText)
        }
    })
})

$(document).on("click", ".add-cart", function (event) {
    event.preventDefault()

    $.ajax({
        url: $(this).attr("href"),
        method: "GET",
        dataType: "script",
        error: function (xhr) {
            console.error(xhr.responseText)
        }
    })
})

$(document).on('turbo:load', function () {
    addCertificado();
    removeCertificado();
    submitEmpregadoForm();
});

$(document)
    .off('turbo:submit-end.empregadoForm', 'form:has(.submit-emp-form)')
    .on('turbo:submit-end.empregadoForm', 'form:has(.submit-emp-form)', function () {
        enableSubmitButton(this);
    });

function addCertificado() {
    $(document).off('click.addCertificado', '.add-certificate').on('click.addCertificado', '.add-certificate', function (e) {
        e.preventDefault();

        if ($('form .certi-box').length < 10) {
            $('.certificate_list').append($('.certificate_fields.d-none').html());
        } else {
            showError('You can only add up to 10 certificates.');
        }
    })
}

function showError(message) {
    if (window.toastr) {
        window.toastr.error(message);
    } else {
        window.alert(message);
    }
}

function removeCertificado() {
    $(document).off('click.removeCertificado', '.remove_certi').on('click.removeCertificado', '.remove_certi', function (e) {
        e.preventDefault();
        $(this).closest('.certi-box').remove();
    });
}

function submitEmpregadoForm() {
    $('form:has(.submit-emp-form)')
        .off('submit.empregadoForm')
        .on('submit.empregadoForm', function (e) {
        const $form = $(this)

        var foundCerti = ($form.find('.certi-box').length != 0);
        if(!foundCerti) {
            showError("You need to add atleast one certificate");
            return blockSubmission(e);
        }

        if(foundCerti) {
            var invalidCertiFile = false;
            $form.find('.certificate-file').each(function(index, element) {
                if($(this).val().length == 0) {
                    foundCerti=false;
                    return false;
                }

                if (!isAllowedImage(this)) {
                    invalidCertiFile = true;
                    return false;
                }
            });

            if(!foundCerti) {
                showError("Certificates Can't be blank");
                return blockSubmission(e);
            }

            if (invalidCertiFile) {
                showError("Certificates must be png/jpeg/jpg only");
                return blockSubmission(e);
            }
        }

        if(foundCerti) {
            if (!isAllowedImage($form.find("#photo").get(0))) {
                showError("Photo must be png/jpeg/jpg only");
                return blockSubmission(e);
            }

            if (!isAllowedImage($form.find("#empregadoinfo_pan_card").get(0))) {
                showError("Pan card must be png/jpeg/jpg only");
                return blockSubmission(e);
            }
        }
    });
}

function isAllowedImage(input) {
    const file = input?.files?.[0]
    if (!file) return true

    const allowedMimeTypes = ["image/png", "image/jpeg"]
    const extension = file.name.split('.').pop()?.toLowerCase()
    const allowedExtensions = ["png", "jpeg", "jpg"]

    return allowedMimeTypes.includes(file.type) || allowedExtensions.includes(extension)
}

function blockSubmission(event) {
    event.preventDefault();
    event.stopImmediatePropagation();
    enableSubmitButton(event.currentTarget);
    return false;
}

function enableSubmitButton(form) {
    $(form).find('.submit-emp-form').prop('disabled', false);
}
