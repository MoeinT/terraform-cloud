import os

import pyspark
from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from pyspark.sql.types import *

# COMMAND ----------
# MAGIC %md
## Mounting a Datalake 
# COMMAND ----------
dbutils.secrets.listScopes()
# COMMAND ----------
dbutils.secrets.list("secret-scopes")
# COMMAND ----------
storageaccount = dbutils.secrets.get(scope = "secret-scopes", key = "sa-streaming-name")
account_key    = dbutils.secrets.get(scope = "secret-scopes", key = "sa-accountkey")
containername  = "commonfiles-dev"
mountpoint     = f"/mnt/{containername}"

if mountpoint in [mnt.mountPoint for mnt in dbutils.fs.mounts()]:
    print("The container is already mounted! Unmounting..")
    dbutils.fs.unmount(mountpoint)
# COMMAND ----------
# MAGIC %md
# MAGIC ### Mounting the container using Storage Account key
# COMMAND ----------
configs = {f"fs.azure.account.key.{storageaccount}.blob.core.windows.net": account_key}
try:
    dbutils.fs.mount(
    source = f"wasbs://{containername}@{storageaccount}.blob.core.windows.net",
    mount_point = mountpoint,
    extra_configs = configs
    )
except Exception as e:
    if "Directory already mounted" in str(e):
        pass
    else:
        print(e)
# COMMAND ----------
dbutils.fs.mounts()
# COMMAND ----------
dbutils.fs.ls(mountpoint)
# COMMAND ----------