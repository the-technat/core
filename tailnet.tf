# https://tailscale.com/kb/1018/acls
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
        // internet + k8s is always open for everyone (also via exitNodes)
        {
          "action": "accept",
          "src": [
            "*",
          ],
          "dst": [
            "autogroup:internet:*",
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
        // me can access everything
        {
          "action": "accept",
          "src": [
            "the-technat@github",
          ],
          "dst": [
            "*",
          ],
        },
      ],
      "ssh": [
        {
          // me can ssh into all servers (check)
          "action": "check",
          "src": [
            "the-technat@github",
          ],
          "dst": [
            "tag:acl-server",
            "tag:acl-backup",
            "autogroup:self",
          ],
          "users": [
            "autogroup:nonroot",
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
