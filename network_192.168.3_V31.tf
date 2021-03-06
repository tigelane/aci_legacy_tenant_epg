resource "aci_bridge_domain" "bridge_domain_192_168_3_V31" {
  tenant_dn               = "${aci_tenant.tenant.id}"
  relation_fv_rs_ctx      = "${aci_vrf.vrf.id}"
  name                    = "192.168.3_V31"
}

resource "aci_subnet" "subnet_192_168_3_V31" {
  bridge_domain_dn        = "${aci_bridge_domain.bridge_domain_192_168_3_V31.id}"
  ip                      = "192.168.3.1/24"
  scope                   = "public"
}

resource "aci_application_epg" "epg_192_168_3_V31" {
  application_profile_dn  = "${aci_application_profile.app_profile.id}"
  name                    = "${aci_bridge_domain.bridge_domain_192_168_3_V31.name}"
  description             = "I was built for servers!"
  relation_fv_rs_bd       = "${aci_bridge_domain.bridge_domain_192_168_3_V31.id}"
}
