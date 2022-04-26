

resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = oci_identity_compartment.tf-compartment.id
    shape = "VM.Standard.E2.1.Micro"
    source_details {
        source_id = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaamp6xsr5asrv4fquaogmv3lb3sttua4ohwyyqn4s5g47jckd2e3ma"
        source_type = "image"
    }

    # Optional
    display_name = "UbuntuWithTerraform"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet.id
    }
    metadata = {
        ssh_authorized_keys = file("putty-cred.pub")
    } 
    preserve_boot_volume = false
}