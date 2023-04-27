data "okta_everyone_group" "everyone_group" {}

data "okta_groups" "default" {}

data "okta_user" "scott" {
  search {
    name  = "profile.firstName"
    value = "Scott"
  }

  search {
    name  = "profile.lastName"
    value = "Ford"
  }
}

// GROUPS

resource "okta_group" "super_admins" {
  name        = "Super Admins"
  description = "Super Admin groups"
}

resource "okta_group_role" "super_admins_role" {
  group_id  = okta_group.super_admins.id
  role_type = "SUPER_ADMIN"
}

resource "okta_group_memberships" "super_admins" {
  group_id = okta_group.super_admins.id
  users = [
    okta_user.ben.id,
  ]
}

resource "okta_group" "org_admins" {
  name        = "Org Admins"
  description = "Org admin group"
}

resource "okta_group_role" "org_admin_role" {
  group_id  = okta_group.org_admins.id
  role_type = "ORG_ADMIN"
}

resource "okta_group_memberships" "org_admins" {
  group_id = okta_group.org_admins.id
  users = [
    okta_user.ben.id,
  ]
}


resource "okta_group" "developers" {
  name        = "Developers"
  description = "Developer group"
}

resource "okta_group_role" "dev_app_admin_role" {
  group_id  = okta_group.developers.id
  role_type = "APP_ADMIN"
}

resource "okta_group_memberships" "dev" {
  group_id = okta_group.developers.id
  users = [
    okta_user.chris_hartmann.id,
    okta_user.dom.id,
  ]
}

resource "okta_group" "api_admins" {
  name        = "API Admins"
  description = "API admin groups"
}

resource "okta_group_role" "api_admin_role" {
  group_id  = okta_group.api_admins.id
  role_type = "API_ACCESS_MANAGEMENT_ADMIN"
}

resource "okta_group_memberships" "api_admins" {
  group_id = okta_group.api_admins.id
  users = [
    okta_user.chris_hartmann.id,
    okta_user.dom.id,
  ]
}

// USERS

resource "okta_user" "chris_hartmann" {
  first_name = "Chris"
  last_name  = "Hartmann"
  login      = "chris.hartmann@example.com"
  email      = "chris.hartmann@example.com"
}


resource "okta_user" "dom" {
  first_name = "Dominik"
  last_name  = "Richter"
  login      = "dom@example.com"
  email      = "dom@example.com"
}

resource "okta_user" "ben" {
  first_name = "Ben"
  last_name  = "Rockwood"
  login      = "ben@example.com"
  email      = "ben@example.com"
}

resource "okta_user" "vj" {
  first_name = "VJ"
  last_name  = "Jeffrey"
  login      = "vj@example.com"
  email      = "vj@example.com"
}

output "groups" {
  value = data.okta_groups.default.groups
}

output "scott_ford" {
  value = data.okta_user.scott
}