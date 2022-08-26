/* module "tfplan-functions" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-guides/master/governance/third-generation/common-functions/tfplan-functions/tfplan-functions.sentinel"
} */

module "tfplan-functions" {
    source = "./tfplanFunctions/tfplan-functions.sentinel"
}

policy "restrict-databricks-clusters" {
    enforcement_level = "hard-mandatory"
}

policy "restrict-keyvaults" {
    enforcement_level = "hard-mandatory"
}

policy "restrict-eventhub" {
    enforcement_level = "hard-mandatory"
}

policy "enforce-tags" {
    enforcement_level = "hard-mandatory"
}