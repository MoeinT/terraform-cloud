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

policy "enforce-naming" {
    enforcement_level = "hard-mandatory"
}