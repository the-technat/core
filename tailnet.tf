# https://tailscale.com/kb/1018/acls
resource "tailscale_acl" "as_hujson" {
  acl = <<EOF
    {
      "tagOwners": {
        // tags that activate / permit features
        "tag:feature-exitNode": [
          "the-technat@github",
        ],
        "tag:feature-funnel": [
          "the-technat@github",
        ],
        "tag:k8s-operator": [ // tailscale-operator in k8s needs this tag
          "the-technat@github",
        ],

        // tags that control access
        "tag:acl-server": [ // the server network
          "the-technat@github",
        ],
        "tag:acl-admin": [ // the admin network
          "the-technat@github",
        ],
        "tag:k8s": [ // k8s exposed services via tailscale-operator
          "the-technat@github",
          "tag:k8s-operator",
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
        {"target": ["100.95.156.71"], "attr": ["funnel"]},
        {"target": ["100.103.19.50"], "attr": ["funnel"]},
        {"target": ["100.85.236.124"], "attr": ["mullvad"]},
        {"target": ["100.123.58.60"], "attr": ["mullvad"]},
        {"target": ["100.103.19.50"], "attr": ["mullvad"]},
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
            "tag:k8s:*",
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
        // admin can access server
        {
          "action": "accept",
          "src": [
            "tag:acl-admin",
          ],
          "dst": [
            "tag:acl-server:*",
          ],
        },
        // me can access admin and server net
        {
          "action": "accept",
          "src": [
            "the-technat@github",
          ],
          "dst": [
            "the-technat@github:*",
            "tag:acl-server:*",
            "tag:acl-admin:*",
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
            "tag:acl-admin",
            "the-technat@github",
          ],
          "users": [
            "autogroup:nonroot",
          ],
        },
        {
          // admin can ssh into server (accept)
          "action": "accept",
          "src": [
            "tag:acl-admin",
          ],
          "dst": [
            "tag:acl-server",
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

resource "tailscale_tailnet_settings" "tailnet" {
  devices_approval_on                         = true
  devices_auto_updates_on                     = true
  devices_key_duration_days                   = 180
  users_approval_on                           = true
  users_role_allowed_to_join_external_tailnet = "member"
  posture_identity_collection_on              = true
}
