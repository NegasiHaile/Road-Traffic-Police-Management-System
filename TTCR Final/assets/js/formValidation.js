function onlyNumberKey(evt) {

    // Only ASCII charactar in that range allowed 
    var ASCIICode = (evt.which) ? evt.which : evt.keyCode
    if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
        return false;
    return true;
}

function onlyLetterKey(evt) {

    // Only ASCII charactar in that range allowed 
    var ASCIICode = (evt.which) ? evt.which : evt.keyCode
    if (!(ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57)))
        return false;
    return true;
}

function ConfirmationForUpdate() {
  return  confirm('Are you sure you want to update this page?');
}







