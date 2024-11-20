# https://tailscale.com/kb/1018/acls
# https://tailscale.com/kb/1337/acl-syntax
resource "tailscale_acl" "as_hujson" {
  acl = <<EOF
    {
      "tagOwners": {
        // tags that activate / permit features
        "tag:feature-exitNode": [
          "autogroup:admin",
        ],
        "tag:feature-funnel": [
          "autogroup:admin",
        ],

        // tags that control access
        "tag:acl-server": [ // the server network
          "autogroup:admin",
        ],
        "tag:acl-backup": [
          "autogroup:admin",
        ],
      },
      "autoApprovers": {
        "exitNode": [
          "tag:feature-exitNode",
        ],
      },
      "nodeAttrs": [
        {
          "target": [
            "tag:feature-funnel",
          ],
          "attr": [
            "funnel",
          ],
        },
        {"target": ["the-technat@github"], "attr": ["funnel"]},
        {"target": ["the-technat@github"], "attr": ["mullvad"]},
      ],
      "acls": [
        // internet is always open for everyone (also via exitNodes)
        {
          "action": "accept",
          "src": [
            "*",
          ],
          "dst": [
            "autogroup:internet:*",
            "192.168.250.0/24:*",
          ],
        },
        // server net can access server net
        {
          "action": "accept",
          "src": [
            "tag:acl-server",
          ],
          "dst": [
            "tag:acl-server:*",
          ],
        },
        {
          "action": "accept",
          "src": [
            "tag:acl-backup",
          ],
          "dst": [
            "tag:acl-backup:*",
          ],
        },
        // me can access my own devices and acl-server 
        {
          "action": "accept",
          "src": [
            "the-technat@github",
          ],
          "dst": [
            "the-technat@github:*",
            "tag:acl-server:*",
          ],
        },
        // me can access acl-backup restricted
        {
          "action": "accept",
          "src": [
            "the-technat@github",
          ],
          "dst": [
            "tag:acl-backup:5000,5001,443,80,22,445",
          ],
        },
      ],
      "ssh": [
        {
          // me can ssh into acl-backup with checking
          "action": "check",
          "src": [
            "the-technat@github",
          ],
          "dst": [
            "tag:acl-backup",
          ],
          "users": [
            "autogroup:nonroot",
          ],
        },
        {
          // me can ssh into acl-server and my own devices without asking
          "action": "accept",
          "src": [
            "the-technat@github",
          ],
          "dst": [
            "tag:acl-server",
            "autogroup:self",
          ],
          "users": [
            "autogroup:nonroot",
            "root",
          ],
        },
      ],
    }
  EOF
}

resource "tailscale_dns_preferences" "tailnet" {
  magic_dns = true
}

# creation currently returns "invalid actor (500)"
# resource "tailscale_tailnet_settings" "tailnet" {
#   devices_approval_on                         = true
#   devices_auto_updates_on                     = true
#   devices_key_duration_days                   = 180
#   users_approval_on                           = true
#   users_role_allowed_to_join_external_tailnet = "member"
#   posture_identity_collection_on              = true
# }
