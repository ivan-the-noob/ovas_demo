<?php
require_once('./config.php');
$schedule = $_GET['schedule'];
?>
<div class="container-fluid">
    <form action="" id="appointment-form">
        <input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
        <input type="hidden" name="schedule" value="<?php echo isset($schedule) ? $schedule : '' ?>">
        <dl>
            <dt class="text-muted">Appointment Schedule</dt>
            <dd class="pl-3"><b><?= date("F d, Y", strtotime($schedule)) ?></b></dd>
        </dl>
        <hr>
        <div class="row">
            <div class="col-md-6">
                <fieldset>
                    <legend class="text-muted">Owner Information</legend>
                    <div class="form-group">
                        <label for="owner_name" class="control-label">Name</label>
                        <input type="text" name="owner_name" id="owner_name" class="form-control form-control-border" placeholder="John D Smith" value="<?php echo isset($owner_name) ? $owner_name : '' ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="contact" class="control-label">Contact #</label>
                        <input type="text" name="contact" id="contact" class="form-control form-control-border" placeholder="09xxxxxxxx" value="<?php echo isset($contact) ? $contact : '' ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="email" class="control-label">Email</label>
                        <input type="email" name="email" id="email" class="form-control form-control-border" placeholder="jsmith@sample.com" value="<?php echo isset($email) ? $email : '' ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="address" class="control-label">Address</label>
                        <textarea name="address" id="address" class="form-control form-control-sm rounded-0" rows="3" placeholder="Lot 2 Block 23, Here Subd., Over There City, Anywhere, 2306" required><?php echo isset($address) ? $address : '' ?></textarea>
                    </div>
                </fieldset>
            </div>
            <div class="col-md-6">
                <fieldset>
                    <legend class="text-muted">Pet Information</legend>
                    <div class="form-group">
                        <label for="category_id" class="control-label">Pet Type</label>
                        <select name="category_id" id="category_id" class="form-control form-control-border select2">
                            <option value="" selected disabled></option>
                            <?php
                            $categories = $conn->query("SELECT * FROM category_list where delete_flag = 0 " . (isset($category_id) && !empty($category_id) ? " or id = '{$category_id}'" : "") . " order by name asc");
                            while ($row = $categories->fetch_assoc()) :
                            ?>
                                <option value="<?= $row['id'] ?>" <?= isset($category_id) && in_array($row['id'], explode(',', $category_id)) ? "selected" : "" ?> <?= $row['delete_flag'] == 1 ? "disabled" : "" ?>><?= ucwords($row['name']) ?></option>
                            <?php endwhile; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="breed" class="control-label">Breed</label>
                        <input type="text" name="breed" id="breed" class="form-control form-control-border" placeholder="Siberian Husky" value="<?php echo isset($breed) ? $breed : '' ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="age" class="control-label">Age</label>
                        <input type="text" name="age" id="age" class="form-control form-control-border" placeholder="1 yr. old" value="<?php echo isset($age) ? $age : '' ?>" required>
                    </div>
                </fieldset>
                <div class="form-group">
                    <label for="service_id" class="control-label">Service(s)</label>
                    <?php
                    $services = $conn->query("SELECT * FROM service_list where delete_flag = 0 " . (isset($service_id) && !empty($service_id) ? " and id in ('{$service_id}')" : "") . " order by name asc");
                    while ($row = $services->fetch_assoc()) {
                        unset($row['description']);
                        $service_arr[] = $row;
                    }
                    ?>
                    <select name="service_id[]" id="service_id" class="form-control form-control-border select2" multiple>
                    </select>
                </div>
                <div class="form-group">
                    <label for="total_payment" class="control-label">Total Payment</label>
                    <div id="total_payment_display">₱<span id="total_payment_amount">0.00</span></div>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
var service = <?= json_encode($service_arr) ?> || {};

$(function () {
    $('#uni_modal').on('shown.bs.modal', function () {
        $('#category_id').select2({
            placeholder: "Please Select Pet Type here.",
            width: '100%',
            dropdownParent: $('#uni_modal')
        })
        $('#service_id').select2({
            placeholder: "Please Select Service(s) Here.",
            width: '100%',
            dropdownParent: $('#uni_modal')
        })
    })

    $('#category_id').change(function () {
        var id = $(this).val();
        $('#service_id').html('');
        $('#service_id').select2('destroy');
        Object.keys(service).map(function (k) {
            if ($.inArray(id, service[k].category_ids.split(',')) > -1) {
                var opt = $("<option>");
                opt.val(service[k].id);
                opt.text(service[k].name + ' (₱' + parseFloat(service[k].fee).toFixed(2) + ')'); // Display service name and fee in PHP
                $('#service_id').append(opt);
            }
        })
        $('#service_id').select2({
            placeholder: "Please Select Service(s) Here.",
            width: '100%',
            dropdownParent: $('#uni_modal')
        })
        $('#service_id').val('').trigger('change');
    });

    $('#service_id').on('change', function () {
        var totalPayment = 0;
        var selectedServices = $(this).val();
        if (selectedServices) {
            selectedServices.forEach(function (serviceId) {
                var serviceFee = parseFloat(service.find(s => s.id == serviceId).fee);
                totalPayment += serviceFee;
            });
        }
        $('#total_payment_amount').text(totalPayment.toFixed(2));
    });

    $('#uni_modal #appointment-form').submit(function (e) {
        e.preventDefault();
        var totalPayment = parseFloat($('#total_payment_amount').text());
        var formData = new FormData($(this)[0]);
        formData.append('total_payment', totalPayment.toFixed(2));
        $('.pop-msg').remove();
        var el = $('<div>')
        el.addClass("pop-msg alert");
        el.hide();
        start_loader();
        $.ajax({
            url: _base_url_ + "classes/Master.php?f=save_appointment",
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            dataType: 'json',
            error: function (err) {
                console.log(err);
                alert_toast("An error occurred", 'error');
                end_loader();
            },
            success: function (resp) {
                if (resp.status == 'success') {
                    end_loader();
                    setTimeout(() => {
                        uni_modal("Success", "success_msg.php?code=" + resp.code)
                    }, 750);
                } else if (!!resp.msg) {
                    el.addClass("alert-danger");
                    el.text(resp.msg);
                    $('#appointment-form').prepend(el);
                } else {
                    el.addClass("alert-danger");
                    el.text("An error occurred due to an unknown reason.");
                    $('#appointment-form').prepend(el);
                }
                el.show('slow');
                $('html,body,.modal').animate({ scrollTop: 0 }, 'fast');
                end_loader();
            }
        });
    });
});



</script>