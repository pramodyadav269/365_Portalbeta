
$(document).ready(function () {

    bsCustomFileInput.init();

    $('.courses.dropdown .dropdown-menu').on("click", function (e) {
        e.stopPropagation();
        //e.preventDefault();
    });

    selectInit('select.select2', 'Select a option');

    //bsCustomFileInput.init();

    $('.date').datepicker({ uiLibrary: 'bootstrap4', format: 'yyyy-dd-mm' });

    $('.custom-range').on('change', function () {
        $('label[for=' + this.id + ']').text('Value : ' + $(this).val());
    });

    //$.extend(true, $.fn.dataTable.defaults, {
    //    'paging': false,
    //    'ordering': false,
    //    'info': false,
    //    'searching': false,
    //    dom: '<"tbl-head"Bf><"tbl-body"rt><"tbl-foot"ip>',
    //    buttons: [
    //        { extend: 'colvis', columns: ':not(.noVis)' }, {
    //            extend: 'excel',
    //            exportOptions: {
    //                format: {
    //                    body: function (data, row, column, node) {
    //                        if ($(node).hasClass('noVis'))
    //                            return;
    //                        data = data.replace(/(&nbsp;|<([^>]+)>)/ig, "");
    //                        data = data.replace('more_horiz', '');
    //                        return "\u200C" + data;
    //                    }
    //                }
    //            }
    //        }
    //    ]
    //});

    $('.input-inline-picker').click(function () {
        if ($('.inline-picker').hasClass('d-none')) {
            $('.inline-picker').removeClass('d-none');
        }
        else {
            $('.inline-picker').addClass('d-none');
        }
    });

    // set close button for inline datepicker
    $('.inline-picker').append('<div class="mt-2 mb-2"><i class="fas fa-times float-right" onclick="closeDatetime();"></i></div>');

    $('.upload .custom-file-input').on('change', function () {
        $('label[for=' + this.id + ']').text('');
    });

});

function closeDatetime() {
    $('.inline-picker').addClass('d-none');
}


function selectInit(el, placeholder) {

    $(el).select2({
        placeholder: placeholder,
        allowClear: true
    });

}

function hideSelected(value) {
    if (value && !value.selected) {
        return $('<span>' + value.text + '</span>');
    }
}


function QueryStringValue(param) {
    var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < url.length; i++) {
        var urlparam = url[i].split('=');
        if (urlparam[0] === param) {
            return urlparam[1];
        }
    }
}

function ToggleNav() {
    if ($("#sideNav").width() === 210) {
        closeNav();
    } else {
        openNav();
    }
}

function openNav() {
    $("#sideNav").css("width", "210px");
    $("main").css("margin-left", "210px");

    setTimeout(function () {
        $('.sidenav-nav .link-text').show();
    }, 500);

}

function closeNav() {
    $("#sideNav").css("width", "60px");
    $("main").css("margin-left", "60px");

    $('.sidenav-nav .link-text').hide();


}


function ShowLoader() {
    loader(1);
}

function HideLoader() {
    loader(0);
}

function loader(acion) {
    if (acion === 1) {
        $('.spinner-center').removeClass('d-none');
    } else if (acion === 0) {
        $('.spinner-center').addClass('d-none');
    }
}

function toggle(view, hide) {
    $('#' + view).removeClass('d-none');
    $('#' + hide).addClass('d-none');
}


function clearFields(container) {
    var inputs = $(container);
    inputs.find('[type=text],[type=number],[type=email],textarea').val(null);
    inputs.find('select.select2').val(null).trigger('change');
    inputs.find('select').val(null).trigger('change');
    inputs.find('input[type="file"]').val(null);
    inputs.find('.custom-file .custom-file-label').text('Choose file');
    inputs.find('[type=radio], [type=checkbox]').prop('checked', false);


    inputs.find('.is-invalid').removeClass('is-invalid').removeClass('is-valid');
    inputs.find('.is-valid').removeClass('is-invalid').removeClass('is-valid');

}

function inputValidation(container) {

    $(container).find('.required').each(function (i, _input) {
        var input = $(_input);

        var val = $(input).val();
        if (input.attr('type') === 'text' || input.attr('type') === 'password' ||
            input.attr('type') === 'number' || input.attr('type') === 'email' || input.prop("tagName") === "TEXTAREA") {
            input.removeClass('is-invalid').removeClass('is-valid');
            if (val === undefined || val === null || val === "") {
                input.addClass('is-invalid');
            }
            else {
                input.addClass('is-valid');
            }
        }

        if (input.attr('type') === 'file') {
            input.removeClass('is-invalid').removeClass('is-valid');
            if (val === undefined || val === null || val === "") {
                input.addClass('is-invalid');
            }
            else {
                input.addClass('is-valid');
            }
        }

        if (input.prop("tagName") === "SELECT") {
            input.next().removeClass('is-invalid').removeClass('is-valid');
            if (val !== undefined && val !== null && val !== "" && val.length > 0) {
                input.next().addClass('is-valid');
            }
            else {
                input.next().addClass('is-invalid');
            }
        }

        if (input.hasClass('radio') || input.hasClass('checkbox')) {
            input.find('input').removeClass('is-invalid').removeClass('is-valid');
            if (input.find('input').is(':checked')) {

                input.find('input').addClass('is-valid');
            }
            else {
                input.find('input').addClass('is-invalid');
            }
        }
    });

    if ($(container).find('.is-invalid').length < 1) {
        return true;
    } else {
        return false;
    }
}

function setTextCount(ctrl) {
    var maxLength = $(ctrl).attr('maxlength');
    var charLength = $(ctrl).val().length;

    $(ctrl).next('small').find('span').html(charLength + ' / ' + maxLength);

}

function readURL(ctrl, el) {

    if (ctrl.files.length === 0) {
        $(el).removeClass('img');
        $(el).empty();
        return;
    }

    var ext = ctrl.files[0].name.split('.').pop().toLowerCase();
    if (ctrl.files && ctrl.files[0] && (ext === "gif" || ext === "png" || ext === "jpeg" || ext === "jpg")) {
        var reader = new FileReader();
        reader.onload = function (e) {
            // $(el).html('src', e.target.result);
            $(el).addClass('img');
            $(el).html('<img src="' + e.target.result + '" class="img-fluid" />');
        };
        reader.readAsDataURL(ctrl.files[0]);
    } else {
        $(el).removeClass('img');
        $(el).empty();
    }
}

function viewLesson() {
    $('.theme-section').addClass('d-none');
    $('.dashboard[ng-app="MasterPage"]').addClass('d-none');

    $('#dvLesson').removeClass('d-none');
}

function viewLessonContent() {
    $('.theme-section').addClass('d-none');
    $('.dashboard[ng-app="MasterPage"]').addClass('d-none');

    $('#dvLesson').addClass('d-none');
    $('#dvLessonContent').removeClass('d-none');
}

function backToLesson() {
    $('.theme-section').addClass('d-none');
    $('.dashboard[ng-app="MasterPage"]').addClass('d-none');

    $('#dvLesson').removeClass('d-none');
    $('#dvLessonContent').addClass('d-none');
}