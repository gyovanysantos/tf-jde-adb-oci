
resource "oci_identity_compartment" "tf-compartment" {
    # Required
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaa7t45cunnm37yl2sqlgh4ib4rerckxiassac6sraoc23dmzvd4kkq"
    description = "Compartment for Terraform resources."
    name = "myterraformcompartment"
}